package com.dabast.mall.model.productseries.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.model.productseries.service.IProductSeriesService;
import com.mongodb.gridfs.GridFSDBFile;
import org.bson.types.ObjectId;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2015/6/11.
 */
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
    public String show(ModelMap model,@PathVariable java.lang.Integer id) {
        ProductSeries productSeries = null;//(ProductSeries)productSeriesService.getById(id);
        model.addAttribute("productSeries",productSeries);

        
        return "baseInfo/rm_baseInfo_update_input";
    }
    @RequestMapping(value="/popover/{id}")
    public ResponseEntity<ProductSeries> popover(ModelMap model,@PathVariable java.lang.String id) {
//        ProductSeries productSeries = ServiceManager.productSeriesService.findById(new ObjectId(id));
        System.out.println("popover...");
        ProductSeries productSeries2=new ProductSeries();
        productSeries2.setId(id);
        productSeries2.setBrand("大坝");
        productSeries2.setEvaluateCount(101);
        productSeries2.setCommonPrice(100.36);
        productSeries2.setName("豆腐乳");
        productSeries2.setPicture("statics/assets/temp/products/model2.jpg");
        productSeries2.setDescription("豆腐乳真的很好吃哦！");
        productSeries2.setShelvesDate(new Date());
        Set<ProductProperty> productPropertySet=new HashSet<ProductProperty>();
        ProductProperty property1=new ProductProperty();
        property1.setId("prop-00001");
        property1.setPropertyName("包装");
        property1.setPropertyValues(new String[]{"袋装","散装"});
        productPropertySet.add(property1);

        ProductProperty property2=new ProductProperty();
        property2.setId("prop-00002");
        property2.setPropertyName("辣度");
        property2.setPropertyValues(new String[]{"微辣","中辣","辣","麻辣"});
        productPropertySet.add(property2);

        productSeries2.setProductProperties(productPropertySet);
        ResponseEntity<ProductSeries> rt=new ResponseEntity<ProductSeries>(productSeries2, HttpStatus.OK);
        return rt;
    }
    @RequestMapping(value="pic/{id}")
    public String showPic(ModelMap model,@PathVariable java.lang.String id) {
       GridFSDBFile picture =productSeriesService.findFileById(id);
        String suffix=picture.getFilename().substring(picture.getFilename().lastIndexOf("."));
        ServletContext context=ProjectContext.getServletContext();
        ServletContextResource resource=new ServletContextResource(context,"img/product/"+id+suffix);
        try {
            File file=resource.getFile();
            if (!file.exists()){
                file.createNewFile();
                picture.writeTo(resource.getFile());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path=resource.getPath();
        String pathWithContext=resource.getPathWithinContext();
//        model.addAttribute("uri",path);
        return path;
    }
    @RequestMapping(value="/new.do")
    public String create(ModelMap model,@Valid ProductSeries productSeries,BindingResult errors,MultipartFile file)  {
        if(errors.hasErrors()) {
            this.setFailure(model);
            return  "admin/product_series/create_input";
        }
        setSuccess(model);

        try {

            String picture=productSeriesService.saveFile(file.getOriginalFilename(),file.getBytes());
            productSeries.setPicture(picture);
            productSeriesService.insert(productSeries);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:admin/product_series/list";
    }


//    @RequestMapping(value="/{id}",method=RequestMethod.PUT)
//    public String update(ModelMap model,@PathVariable java.lang.Integer id,@Valid ProductSeries productSeries,BindingResult errors,HttpServletRequest request,HttpServletResponse response)  {
//        productSeriesValidator.validate(productSeries, errors);
//        if(errors.hasErrors()) {
//            this.setFailure(model);
//            model.addAttribute("errors", errors.getModel());
//            List<RmSortInfo> rmSortInfos=ServiceManager.rmSortInfoService.findAll();
//            model.put("rmSortInfos", rmSortInfos);
//            return "baseInfo/rm_baseInfo_update_input";
//        }
//        productSeriesService.update(productSeries);
//        setSuccess(model);
//        return REDIRECT_ACTION;
//    }


//    @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
//    public String delete(ModelMap model,@PathVariable java.lang.Integer id) {
//        productSeriesService.removeById(id);
//        setSuccess(model);
//        return REDIRECT_ACTION;
//    }

//    @RequestMapping(method=RequestMethod.DELETE)
//    public String batchDelete(ModelMap model,@RequestParam("items") java.lang.Integer[] items) {
//        for(int i = 0; i < items.length; i++) {
//            productSeriesService.removeById(items[i]);
//        }
//        setSuccess(model);
//        return REDIRECT_ACTION;
//    }
////    @RequestMapping(value="/list.do",method={RequestMethod.POST,RequestMethod.GET})
////    public String list(ModelMap model,Integer page) {
////        page=page==null?0:page;
////        Page<ProductSeries> pages=productSeriesService.findPageCaseCade(new ProductSeries(), page, 20);
////        model.put("page", pages);
////
////        return "baseInfo/rm_baseInfo_list";
////    }
//    @RequestMapping(value="/search.do",method={RequestMethod.POST,RequestMethod.GET})
//    public String search(ModelMap model,ProductSeries productSeries,Integer page) {
//        page=page==null?0:page;
//        Page<ProductSeries> pages=productSeriesService.findPageCaseCade(productSeries, page, 20);
//        model.put("page", pages);
//        return "baseInfo/rm_baseInfo_list";
//    }
//    @RequestMapping(value="/create_input.do",method={RequestMethod.GET,RequestMethod.POST})
//    public String createInput(ModelMap model){
//        List<RmSortInfo> rmSortInfos=ServiceManager.rmSortInfoService.findAll();
//        model.put("rmSortInfos", rmSortInfos);
//        return "baseInfo/rm_baseInfo_create_input";
//    }
//
//    @RequestMapping(value="/from_plan.do",method={RequestMethod.POST})
//    public void getProductSeriesFromPurchasePlan(ModelMap model,Integer purchasePlanId,HttpServletRequest request,HttpServletResponse response){
//
//
//        List<ProductSeries> list=productSeriesService.getProductSeriesFromPurchasePlan(purchasePlanId);
//
//        JSONArray jsonArray=new JSONArray();
//        for(ProductSeries productSeries:list){
//            JSONObject jsonObject=new JSONObject();
//            jsonObject.put("rmId", productSeries.getRmId());
//            jsonObject.put("rmName", productSeries.getRmName());
//            jsonArray.add(jsonObject);
//        }
//        try {
//            response.setContentType("text/html");
//            response.setCharacterEncoding("utf-8");
//            response.getWriter().write(URLDecoder.decode(jsonArray.toString()+"","utf8"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
    @RequestMapping("/create_input.do")
    public String createInput(ModelMap model){
        return "admin/product_series/create_input";
    }
} 
