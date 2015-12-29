package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Sortable;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.bson.types.ObjectId;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product_series")
public class ProductSeriesController extends BaseRestSpringController {
    protected static final String DEFAULT_SORT_COLUMNS = null;
    protected static final String REDIRECT_ACTION = "";

    @Resource private IProductSeriesService productSeriesService;
    @Resource private Validator validator;


    @InitBinder("productSeries")
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }


    @ModelAttribute
    public void init(ModelMap model) {
//        model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
    }


    @RequestMapping(value="/data/{id}")
    public ResponseEntity<Map> show(@PathVariable String id,String orderId,Integer page,HttpSession session) {
        Map<String,Object> model=new LinkedHashMap<String, Object>();
        if (page==null){
            model.put("activeEvaluate", false);
        }else{
            model.put("activeEvaluate", true);
        }
        page=page==null?1:page;
        ProductSeries productSeries = productSeriesService.findProductSeriesById(id);
        Page<ProductEvaluate> productEvaluateListPage=ServiceManager.productEvaluateService.findProductEvaluatesPageWithoutParentEvaluateByProductSeries(productSeries, page, 5);
        boolean interested=ServiceManager.interestService.alreadyInterested(getLoginUser(session),productSeries);
        model.put("productSeries", productSeries);
        model.put("_page", productEvaluateListPage);
        model.put("page", page);
        model.put("interested", interested);
        if (orderId!=null&&!orderId.equals("")){
            Order order=ServiceManager.orderService.findOrderById(orderId);
            model.put("order", order);
        }
        return new ResponseEntity<Map>(model, HttpStatus.OK);
    }
    @RequestMapping(value="/{id}")
    public String forwardShow(ModelMap model,@PathVariable String id,String orderId,Integer page,HttpServletResponse response) {
        model.addAttribute("id",id);
        if(orderId!=null){
//            response.setHeader("progma","no-cache");
//            response.setHeader("Cache-Control", "no-store");
//            response.setHeader("Cache-Control","no-cache");
//            response.setDateHeader("Expires",0);
            model.addAttribute("orderId",orderId);
        }

        return "item";
    }
    @RequestMapping(value="/sort/{id}")
    public String showSort(ModelMap model,@PathVariable String id) {
        ProductSubCategory productSubCategory = ServiceManager.productSubCategoryService.findProductSubCategoryByIdWithoutProductSeries(id);
        model.addAttribute("productSubCategory",productSubCategory);
        return "product_sort";
    }

    /**
     * 产品分类显示并排序
     * @param model
     * @param id
     * @param sort
     * @param page
     * @return
     */
    @RequestMapping(value="/sort/json/{id}")
    public ResponseEntity<Map> showSortJson(ModelMap model,@PathVariable String id,@RequestBody Sortable sort,Integer page) {
        Map<String,Object> map=new LinkedHashMap<String, Object>();
        page=page==null?1:page.intValue()==0?1:page;
        ProductSubCategory productSubCategory = new ProductSubCategory();
        productSubCategory.setId(id);
        Page<ProductSeries> _page=null;
        if (sort==null||sort.getField().equals("default"))
            _page=ServiceManager.productSeriesService.findProductSeriesPageByProductSubCategory(productSubCategory,page,4);
        else if(sort.getField().equals("price")){
            _page=productSeriesService.findProductSeriesPageByProductSubCategorySortByPrice(productSubCategory, page, 4, sort);
        }else{
            _page=productSeriesService.findProductSeriesPageByProductSubCategoryWithSort(productSubCategory, page, 4, sort);
        }
        map.put("page",page);
        map.put("_page",_page);
        return new ResponseEntity<Map>(map,HttpStatus.OK);
    }

    @RequestMapping(value="/evaluate/reply")
    public ResponseEntity<List<ProductEvaluate>> evaluateReply(@RequestBody ProductEvaluate reply,HttpSession session) {
        Assert.notNull(reply);
//        Assert.notNull(reply.getParent());
//        Assert.notNull(reply.getParent().getId());
        User user=getLoginUser(session);
        Assert.notNull(user);
        reply.setReplyUser(user);
        reply.setDate(new Date());
        reply.setType(Constant.EVALUATETYPE.REPLY);
        ServiceManager.productEvaluateService.insert(reply);
        DBObject childrenDBObject=new BasicDBObject();
        childrenDBObject.put("parent",reply.getParent());
        childrenDBObject.put("type", Constant.EVALUATETYPE.REPLY);
        List<ProductEvaluate> replies=ServiceManager.productEvaluateService.findAll(new BasicQuery(childrenDBObject).with(new Sort(Sort.Direction.DESC, "date")));
        ResponseEntity<List<ProductEvaluate>> rt=new ResponseEntity<List<ProductEvaluate>>(replies, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="/evaluate/praise/{evaluateId}")
    public ResponseEntity<List<ProductEvaluate>> evaluateReply(@PathVariable String evaluateId,HttpSession session) {
        User user=getLoginUser(session);
        Assert.notNull(user);
        ProductEvaluate praise=new ProductEvaluate();
        praise.setReplyUser(user);
        praise.setDate(new Date());
        praise.setType(Constant.EVALUATETYPE.PRAISE);
        ProductEvaluate parent=new ProductEvaluate();
        parent.setId(evaluateId);
        praise.setParent(parent);
        ProductEvaluate praiseInDB=ServiceManager.productEvaluateService.praisedEvaluate(parent,user);
        if (praiseInDB!=null){
            ServiceManager.productEvaluateService.removeById(praiseInDB.getId());
        }else{
            ServiceManager.productEvaluateService.insert(praise);

        }
        DBObject childrenDBObject=new BasicDBObject();
        childrenDBObject.put("parent", parent);
        childrenDBObject.put("type", Constant.EVALUATETYPE.PRAISE);
        List<ProductEvaluate> list=ServiceManager.productEvaluateService.findAll(childrenDBObject);
        ResponseEntity<List<ProductEvaluate>> rt=new ResponseEntity<List<ProductEvaluate>>(list, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="/categories")
    public ResponseEntity<List<ProductCategory>> categories(ModelMap model,HttpSession session) {
       List<ProductCategory> categories=null;
//        if(session.getAttribute("productCategories")!=null){
//            categories=(List<ProductCategory>)(session.getAttribute("productCategories"));
//        }
        categories= ServiceManager.productCategoryService.findAllCategories();
        ResponseEntity<List<ProductCategory>> rt=new ResponseEntity<List<ProductCategory>>(categories, HttpStatus.OK);
//        session.setAttribute("productCategories",categories);
        return rt;
    }
    @RequestMapping(value="/evaluates/{evaluateId}")
    public ResponseEntity<List<ProductEvaluate>> evaluates(ModelMap model,@PathVariable String evaluateId) {
        List<ProductEvaluate> evaluates= ServiceManager.productEvaluateService.findEvaluatesWithParentId(evaluateId);
        ResponseEntity<List<ProductEvaluate>> rt=new ResponseEntity<List<ProductEvaluate>>(evaluates, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value = "/toggle_interest", method = RequestMethod.GET)
    public ResponseEntity<Map> removeToInterest(String productSeriesId, HttpSession session) {
        Map<String,Object> model=new LinkedHashMap<String, Object>();
        User user= getLoginUser(session);
        Assert.notNull(user);
        ProductSeries productSeries=new ProductSeries();
        productSeries.setId(productSeriesId);
        if (!ServiceManager.interestService.alreadyInterested(user,productSeries)){
            Interest interest=new Interest();
            interest.setProductSeries(productSeries);
            interest.setUser(user);
            ServiceManager.interestService.insert(interest);
            model.put("interested", true);
        }else{
            List<Interest> interests=ServiceManager.interestService.findByUserAndProductSeries(user,productSeries);
            ServiceManager.interestService.removeAll(interests);
            model.put("interested", false);
        }
        model.put("productSeriesId", productSeriesId);
        return new ResponseEntity<Map>(model,HttpStatus.OK);
    }
    @RequestMapping("/create_input.do")
    public String createInput(ModelMap model){
        return "admin/product_series/create_input";
    }
}
