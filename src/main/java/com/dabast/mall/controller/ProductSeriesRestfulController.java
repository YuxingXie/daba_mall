package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.service.IProductSeriesService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/product_series")
public class ProductSeriesRestfulController extends BaseRestSpringController {
    private static Logger logger = LogManager.getLogger();

    @Resource private IProductSeriesService productSeriesService;

    @RequestMapping(value="/popover/{id}")
    public ProductSeries popover(ModelMap model,@PathVariable String id) {
        ProductSeries productSeries=productSeriesService.findProductSeriesById(id);
        return productSeries;
    }
}
