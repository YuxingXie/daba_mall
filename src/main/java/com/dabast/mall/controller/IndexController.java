package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.FileUtil;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.dao.UserDao;
import com.mongodb.BasicDBObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.ServletContextResource;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;


@Controller
@RequestMapping("/index")
//@SessionAttributes("loginUser")
public class IndexController extends BaseRestSpringController {
    private static Logger logger = LogManager.getLogger();
    @Resource(name = "userDao")
    private UserDao userDao;
    @RequestMapping(value = "/test")
    public String test(HttpServletRequest request, ModelMap model, HttpSession session) {
        return "forward:/index.jsp?test=test_exit";
    }
    @RequestMapping(value = "")
    public String index(HttpServletRequest request, ModelMap model, HttpSession session) {
        if (session.getAttribute(Constant.LOGIN_USER)==null){
            Cookie nameCookie = CookieTool.getCookieByName(request, "loginStr");
            Cookie pwdCookie = CookieTool.getCookieByName(request, "password");
            String name = null;
            try {
                name = nameCookie == null ? null : URLDecoder.decode(nameCookie.getValue(), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String password = pwdCookie == null ? null : pwdCookie.getValue();
            if (name != null && password != null) {
                User user = userDao.findByEmailOrPhone(name);
                if (user!=null && user.getPassword().equalsIgnoreCase(password)) {
                    session.setAttribute(Constant.LOGIN_USER, user);

                }
            }
        }
        List<Interest> interests=ServiceManager.interestService.findInterestsOfUser(getLoginUser(session));
        model.addAttribute("interests", interests);
        TopCarousel topCarousel=ServiceManager.topCarouselService.findByMaxPriority();
        if(topCarousel!=null){
            List<String[]> top3 = topCarousel.getAdContent();
            model.addAttribute("top3", top3);
        }

        List<HomePageBlock> homePageBlocks=ServiceManager.homePageBlockService.findAll(new BasicDBObject("show",true));
        for (HomePageBlock homePageBlock:homePageBlocks){
            setInterest(homePageBlock.getProductSeriesList(),interests);
        }
        model.addAttribute("homePageBlocks",homePageBlocks);
        return "index";
    }
    private void setInterest(List<ProductSeries> productSeriesList,List<Interest> interestList){
        if (productSeriesList==null) return;
        if (interestList==null) return;
        out:for (ProductSeries productSeries:productSeriesList){
//          if (interestList.contains(productSeries))  productSeries.setInterested(true);
            String productSeriesId=productSeries.getId();
            inner:for (Interest interest:interestList){
                ProductSeries interestProductSeries=interest.getProductSeries();
                if(productSeriesId.equalsIgnoreCase(interestProductSeries.getId())){
                    productSeries.setInterested(true);
                    break inner;
                }
            }
        }
    }

    @RequestMapping(value = "/product/search")
    public String  searchProducts(ModelMap model,String keyWord,Integer page) {
        page=page==null?1:page;
        keyWord=keyWord==null?"":keyWord;
        Page<ProductSeries> productSeriesListPage=ServiceManager.productSeriesService.findProductSeriesesByKeyWord(keyWord,page,3);
//        if (productSeriesListPage.getTotalElements()==1l){
//            ProductSeries productSeries=productSeriesListPage==null?null:productSeriesListPage.getContent()==null?null:productSeriesListPage.getContent().size()==0?null:productSeriesListPage.getContent().get(0);
//            if (productSeries==null){
//                model.addAttribute("_page", productSeriesListPage);
//                model.addAttribute("page", page);
//                model.addAttribute("keyWord", keyWord);
//                return "search-result";
//            }
//            model.addAttribute("productSeries",productSeries);
//            return "item";
//        }else{
            model.addAttribute("_page", productSeriesListPage);
            model.addAttribute("page", page);
            model.addAttribute("keyWord", keyWord);
            return "search-result";
//        }

    }

    @RequestMapping(value = "/download/cer")
    public void   downloadCer(HttpServletResponse response) throws IOException {
        ServletContextResource resource=new ServletContextResource(ProjectContext.getServletContext(),"statics/docs/tomcat.cer");
        FileUtil.fileDownload(response,resource.getFile().getAbsolutePath());
    }

    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
    }
}