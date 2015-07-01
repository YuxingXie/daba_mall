package com.dabast.mall.view.product.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.model.productseries.dao.ProductSeriesDao;
import com.dabast.mall.view.product.service.IProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/7/1.
 */
@Service
public class ProductService extends BaseEntityManager<ProductSeries> implements IProductService {
    @Resource
    private ProductSeriesDao productSeriesDao;
    protected EntityDao<ProductSeries> getEntityDao() {
        return this.productSeriesDao;
    }
}
