package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.bson.types.ObjectId;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    public ResponseEntity<ModelMap> show(ModelMap model,@PathVariable String id,String orderId,Integer page) {
        if (page==null){
            model.addAttribute("activeEvaluate",false);
        }else{
            model.addAttribute("activeEvaluate",true);
        }
        page=page==null?1:page;
        ProductSeries productSeries = productSeriesService.findProductSeriesById(id);
        Page<ProductEvaluate> productEvaluateListPage=ServiceManager.productEvaluateService.findProductEvaluatesPageWithoutParentEvaluateByProductSeries(productSeries, page, 6);
        model.addAttribute("productSeries",productSeries);
        model.addAttribute("_page",productEvaluateListPage);
        model.addAttribute("page",page);
        if (orderId!=null&&!orderId.equals("")){
            Order order=ServiceManager.orderService.findOrderById(orderId);
            model.addAttribute("order",order);
        }

        return new ResponseEntity<ModelMap>(model, HttpStatus.OK);
    }
    @RequestMapping(value="/{id}")
    public String forwardShow(ModelMap model,@PathVariable String id,String orderId,Integer page) {
        if (page==null){
            model.addAttribute("activeEvaluate",false);
        }else{
            model.addAttribute("activeEvaluate",true);
        }
        page=page==null?1:page;
        ProductSeries productSeries = productSeriesService.findProductSeriesById(id);
        Page<ProductEvaluate> productEvaluateListPage=ServiceManager.productEvaluateService.findProductEvaluatesPageWithoutParentEvaluateByProductSeries(productSeries, page, 6);
        model.addAttribute("productSeries",productSeries);
        model.addAttribute("_page",productEvaluateListPage);
        model.addAttribute("page",page);
        if (orderId!=null&&!orderId.equals("")){
            Order order=ServiceManager.orderService.findOrderById(orderId);
            model.addAttribute("order",order);
        }
        return "item";
    }
    @RequestMapping(value="/sort/{id}")
    public String showSort(ModelMap model,@PathVariable String id) {
        ProductSubCategory productSubCategory = ServiceManager.productSubCategoryService.findProductSubCategoryByIdWithoutProductSeries(id);
        model.addAttribute("productSubCategory",productSubCategory);
        Page<ProductSeries> _page=ServiceManager.productSeriesService.findProductSeriesPageByProductSubCategory(productSubCategory,1,2);
        model.addAttribute("_page",_page);
        return "product_sort";
    }
    @RequestMapping(value="/sort/json/{id}")
    public ResponseEntity<Page<ProductSeries>> showSortJson(ModelMap model,@PathVariable String id,Integer page) {
        page=page==null?1:page.intValue()==0?1:page;
        ProductSubCategory productSubCategory = new ProductSubCategory();
        productSubCategory.setId(id);
        Page<ProductSeries> _page=ServiceManager.productSeriesService.findProductSeriesPageByProductSubCategory(productSubCategory,page,2);
        return new ResponseEntity<Page<ProductSeries>>(_page,HttpStatus.OK);
    }
    @RequestMapping(value="/popover/{id}")
    public ResponseEntity<ProductSeries> popover(ModelMap model,@PathVariable java.lang.String id) {
        ProductSeries productSeries=productSeriesService.findProductSeriesById(new ObjectId(id));
        ResponseEntity<ProductSeries> rt=new ResponseEntity<ProductSeries>(productSeries, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="/evaluate/reply")
    public ResponseEntity <List<ProductEvaluate>> evaluateReply(@RequestBody ProductEvaluate reply,HttpSession session) {
        Assert.notNull(reply);
        Assert.notNull(reply.getParent());
        Assert.notNull(reply.getParent().getId());
        User user=getLoginUser(session);
        Assert.notNull(user);
        reply.setReplyUser(user);
        reply.setDate(new Date());
        reply.setType(Constant.EVALUATETYPE.REPLY);
        ServiceManager.productEvaluateService.insert(reply);
        DBObject childrenDBObject=new BasicDBObject();
        childrenDBObject.put("parent",reply.getParent());
        childrenDBObject.put("type", Constant.EVALUATETYPE.REPLY);
        List<ProductEvaluate> list=ServiceManager.productEvaluateService.findAll(childrenDBObject);
        ResponseEntity<List<ProductEvaluate>> rt=new ResponseEntity<List<ProductEvaluate>>(list, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="/evaluate/praise/{evaluateId}")
    public ResponseEntity <List<ProductEvaluate>> evaluateReply(@PathVariable String evaluateId,HttpSession session) {
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
//            return new ResponseEntity<List<ProductCategory>>(categories,HttpStatus.OK);
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
    @RequestMapping("/create_input.do")
    public String createInput(ModelMap model){
        return "admin/product_series/create_input";
    }
} 
