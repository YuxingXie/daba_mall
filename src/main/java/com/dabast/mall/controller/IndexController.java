package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.service.impl.CartService;
import com.dabast.mall.service.impl.RegisterValidateService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/")
//@SessionAttributes("loginUser")
public class IndexController extends BaseRestSpringController {
    @Resource(name = "userDao")
    UserDao userDao;
    @Resource
    private RegisterValidateService registerValidateService;
    @Resource private CartService cartService;
    @RequestMapping(value = "/index")
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
                if (user.getPassword().equalsIgnoreCase(password)) {
                    session.setAttribute(Constant.LOGIN_USER, user);


                }
            }
        }

        List<String[]> top3 = ServiceManager.productSeriesService.getTop3ProductSeries();
        model.addAttribute("top3", top3);
        List<ProductSeries> hotSells = ServiceManager.productSeriesService.getHotSell(Constant.HOT_SELL_COUNT);
        List<ProductSeries> newProducts = ServiceManager.productSeriesService.getNewProducts(Constant.NEW_PRODUCTS_COUNT);
        List<ProductSeries> lowPrices = ServiceManager.productSeriesService.getLowPrices(Constant.LOW_PRICE_COUNT);
        model.addAttribute("newProducts", newProducts);
        model.addAttribute("newProducts2", newProducts);
        model.addAttribute("hotSells", hotSells);
        model.addAttribute("hotSells2", hotSells);
        model.addAttribute("lowPrices", lowPrices);
        model.addAttribute("lowPrices2", lowPrices);
        ServiceManager.productStoreInAndOutService.clearNullUserInAndOut();
        return "index";
    }


    @RequestMapping(value = "/index/product/search")
    public String  searchProducts(ModelMap model,String keyWord,Integer page) {
        page=page==null?1:page;
        keyWord=keyWord==null?"":keyWord;
        Page<ProductSeries> productSeriesListPage=ServiceManager.productSeriesService.findProductSeriesesByKeyWord(keyWord,page,3);
        if (productSeriesListPage.getTotalElements()==1l){
            ProductSeries productSeries=productSeriesListPage==null?null:productSeriesListPage.getContent()==null?null:productSeriesListPage.getContent().size()==0?null:productSeriesListPage.getContent().get(0);
            if (productSeries==null){
                model.addAttribute("_page", productSeriesListPage);
                model.addAttribute("page", page);
                model.addAttribute("keyWord", keyWord);
                return "search-result";
            }
            model.addAttribute("productSeries",productSeries);
            return "item";
        }else{
            model.addAttribute("_page", productSeriesListPage);
            model.addAttribute("page", page);
            model.addAttribute("keyWord", keyWord);
            return "search-result";
        }

    }
    @RequestMapping(value = "/user/cart")
    public ResponseEntity<Cart> cart(HttpSession session) {
        User user=getLoginUser(session);
//        Cart cart=user==null?getCart(session)user.getCart()==null?getCart(session):user.getCart();
        Cart cart=user==null?(getCart(session)==null?null:getCart(session)):(user.getCart()==null?getCart(session):(user.getCart()));
        if (cart!=null && cart.getProductSelectedList()!=null){
            for (ProductSelected productSelected:cart.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                if (productSeries.getProductStore()!=null) productSeries.getProductStore().setInAndOutList(inAndOuts);
            }
        }
        session.setAttribute(Constant.CART,cart);
        return new ResponseEntity<Cart>(cart,HttpStatus.OK);
    }
    /**
     * 把一件商品添加到购物车
     * @param productSelected
     * @param session
     * @return
     */
    @RequestMapping(value = "/index/cart", method = RequestMethod.POST)
    public ResponseEntity<Cart> cart(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
       if (session.getAttribute(Constant.CART)==null){
           cart=new Cart();
       }else{
           cart=(Cart)session.getAttribute(Constant.CART);
       }
        cart.merge(productSelected);
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);
        return cartResponseEntity;
    }
    @RequestMapping(value = "/index/cart2", method = RequestMethod.POST)
    public ResponseEntity<Cart> cart2(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        ProductSeries productSeries=ServiceManager.productSeriesService.findProductSeriesById(productSelected.getProductSeriesId());
        productSelected.setProductSeries(productSeries);
        List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
        for(String productPropertyValueId : productSelected.getProductPropertyValueIds()){
            DBObject ppCon=new BasicDBObject();
            ProductPropertyValue value=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
            ppCon.put("_id",value.getProductProperty().getId());
            ProductProperty productProperty=ServiceManager.productPropertyService.findOne(ppCon);
            value.setProductProperty(productProperty);
            productPropertyValueList.add(value);
        }
//        productSelected.((ProductPropertySelect[])ProductPropertyValueList.toArray(new ProductPropertySelect[ProductPropertyValueList.size()]));
        productSelected.setProductPropertyValueList(productPropertyValueList);
        cart.merge(productSelected);
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);
        return cartResponseEntity;
    }
    @RequestMapping(value = "/index/cart/remove", method = {RequestMethod.POST})
    public ResponseEntity<Cart> cartRemove(Integer selectedIndex, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            ProductSelected productSelected=cart.getProductSelectedList().get(selectedIndex.intValue());

            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);

        return cartResponseEntity;
    }
    @RequestMapping(value = "/cart/remove/{selectedIndex}", method = RequestMethod.GET)
    public String cartRemove2(@PathVariable Integer selectedIndex, ModelMap model, HttpSession session) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        User user= getLoginUser(session);
        user.setCart(cart);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, cart);
        return "redirect:/cart";
    }
    @RequestMapping(value = "/cart/remove_to_interest/{selectedIndex}", method = RequestMethod.GET)
    public String removeToInterest(@PathVariable Integer selectedIndex, ModelMap model, HttpSession session) {
        User user= getLoginUser(session);
        Assert.notNull(user);
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            ProductSelected productSelected=cart.getProductSelectedList().get(selectedIndex.intValue());
            if (!ServiceManager.interestService.alreadyInterested(user,productSelected.getProductSeries())){
                Interest interest=new Interest();
                interest.setProductSeries(productSelected.getProductSeries());
                interest.setUser(user);
                ServiceManager.interestService.insert(interest);
            }

            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        user.setCart(cart);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, cart);
        return "redirect:/cart";
    }


    @RequestMapping(value = "/index/order/submit", method = RequestMethod.POST)
    public String orderSubmit( String  id,String acceptAddress,String payWay,String acceptPersonName, String contactPhone,
                              ModelMap model,RedirectAttributes redirectAttributes,HttpSession session) {
        Order order=getOrder(session);
        if (order==null) order=ServiceManager.orderService.findById(id);
        if (acceptAddress!=null)order.setAcceptAddress(acceptAddress);
        if (payWay!=null)order.setPayWay(payWay);
        if (acceptPersonName!=null)order.setAcceptPersonName(acceptPersonName);
        if (contactPhone!=null)order.setContactPhone(contactPhone);
        order.setSubmitStatus("y");
        ServiceManager.orderService.update(order);
        session.setAttribute("order",order);
        return "redirect:/bill";
    }



    @RequestMapping(value="/pic/user/evaluate/{id}")
    public void showUserEvaluatePic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/user/evaluate";
        requestImage(id, request, response, dirStr);
    }

    @RequestMapping(value="/pic/{id}")
    public void showPic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/product";
        requestImage(id, request, response, dirStr);
    }

    private void requestImage(String id, HttpServletRequest request, HttpServletResponse response, String dirStr) {
        ServletContext context= ProjectContext.getServletContext();
        ServletContextResource dirResource=new ServletContextResource(context,dirStr);

        try {
            File dirFile=dirResource.getFile();
            if (!dirFile.exists() || !dirFile.isDirectory()){
                dirFile.mkdirs();
            }
            String[] files=dirFile.list();
            if (files!=null){
                for (String fileInDir:files){
                    if (fileInDir.indexOf(id)>=0){
                        String path=new ServletContextResource(context,dirStr+"/"+fileInDir).getPath();
                        request.getRequestDispatcher(path+"?"+Math.random()).forward(request,response);
                        return;
                    }
                }
            }
            GridFSDBFile picture = ServiceManager.productSeriesService.findFileById(id);
            if (picture==null) {
                request.getRequestDispatcher("/statics/img/img_not_found.jpg").forward(request,response);
                return;
            }
            String suffix=picture.getFilename().substring(picture.getFilename().lastIndexOf("."));
            ServletContextResource resource=new ServletContextResource(context,dirStr+"/"+id+suffix);
            File file=resource.getFile();
            if (!file.exists()){
                file.createNewFile();
                picture.writeTo(resource.getFile());
            }
            String path=resource.getPath();
            request.getRequestDispatcher(path+"?"+Math.random()).forward(request,response);
            return;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }







    @RequestMapping(value = "/cart/adjust")
    public ResponseEntity adjust(@RequestBody Cart cart,ModelMap model, HttpSession session) {
        Assert.notNull(cart);
        User user=getLoginUser(session);

        user.setCart(cart);
        Order order=ServiceManager.orderService.insertOrder(user);
        user.setCart(null);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, null);
        session.removeAttribute(Constant.CART);
        session.setAttribute(Constant.LOGIN_USER,user);
        model.addAttribute("order", order);
        session.setAttribute("order", order);
        return new ResponseEntity<Order>(order,HttpStatus.OK);
    }
    @RequestMapping(value = "/cart/to_bill")
    public String toBill(ModelMap model, HttpSession session,HttpServletRequest request) {
        Order order=session.getAttribute("order")==null?null:(Order)session.getAttribute("order");
//        Order order=ServiceManager.orderService.findLastOrderByUserId(orderId);
        return "redirect:/to_bill";
    }
    @RequestMapping(value = "/cart/to_bill/{orderId}")
    public String toBill(@PathVariable String orderId,ModelMap model, HttpSession session,HttpServletRequest request) {
//        User user=getLoginUser(session);
        Order order = ServiceManager.orderService.findOrderById(orderId);
        Assert.notNull(order);
        if (order.getProductSelectedList()!=null ){
            for (ProductSelected productSelected:order.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                if (productSeries.getProductStore()!=null){
                    List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                    productSeries.getProductStore().setInAndOutList(inAndOuts);
                }
            }
        }
        session.setAttribute("order",order);
        return "redirect:/to_bill";
    }


    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
    }
}