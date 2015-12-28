package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Sortable;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
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

@RestController
@RequestMapping("/product_series")
public class ProductSeriesRestfulController extends BaseRestSpringController {


    @Resource private IProductSeriesService productSeriesService;

    @RequestMapping(value="/popover/{id}")
    public ProductSeries popover(ModelMap model,@PathVariable String id) {
        ProductSeries productSeries=productSeriesService.findProductSeriesById(id);
        return productSeries;
    }
}
