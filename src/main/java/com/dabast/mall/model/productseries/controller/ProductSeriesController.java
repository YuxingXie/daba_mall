package com.dabast.mall.model.productseries.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
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
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        ProductSeries productSeries=productSeriesService.findProductSeriesById(new ObjectId(id));
        ResponseEntity<ProductSeries> rt=new ResponseEntity<ProductSeries>(productSeries, HttpStatus.OK);
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
        System.out.println(path);
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
            productSeries.setPictures(new String[]{picture});
            productSeriesService.insert(productSeries);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:admin/product_series/list";
    }


    @RequestMapping("/create_input.do")
    public String createInput(ModelMap model){
        return "admin/product_series/create_input";
    }
} 
