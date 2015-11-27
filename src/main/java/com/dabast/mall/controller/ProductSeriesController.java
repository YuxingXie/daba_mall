package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductCategory;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.service.IProductSeriesService;
import org.bson.types.ObjectId;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
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
        model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
    }


    @RequestMapping(value="/{id}")
    public String show(ModelMap model,@PathVariable String id,String orderId) {
        ProductSeries productSeries = productSeriesService.findProductSeriesById(id);
        model.addAttribute("productSeries",productSeries);
        if (orderId!=null){
            Order order=ServiceManager.orderService.findOrderById(orderId);
            model.addAttribute("order",order);
        }
        return "item";
    }
    @RequestMapping(value="/popover/{id}")
    public ResponseEntity<ProductSeries> popover(ModelMap model,@PathVariable java.lang.String id) {
        ProductSeries productSeries=productSeriesService.findProductSeriesById(new ObjectId(id));
        ResponseEntity<ProductSeries> rt=new ResponseEntity<ProductSeries>(productSeries, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="/categories")
    public ResponseEntity<List<ProductCategory>> popover(ModelMap model) {
        List<ProductCategory> productCategories= ServiceManager.productCategoryService.findAllCategories();
        ResponseEntity<List<ProductCategory>> rt=new ResponseEntity<List<ProductCategory>>(productCategories, HttpStatus.OK);
        return rt;
    }

    @RequestMapping("/create_input.do")
    public String createInput(ModelMap model){
        return "admin/product_series/create_input";
    }
} 
