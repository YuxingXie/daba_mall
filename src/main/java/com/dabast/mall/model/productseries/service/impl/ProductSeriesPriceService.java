package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeriesPrice;
import com.dabast.mall.model.productseries.dao.ProductSeriesPriceDao;
import com.dabast.mall.model.productseries.service.IProductSeriesPriceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProductSeriesPriceService  extends BaseEntityManager<ProductSeriesPrice> implements IProductSeriesPriceService {
    @Resource
    private ProductSeriesPriceDao productSeriesPriceDao;
    protected EntityDao<ProductSeriesPrice> getEntityDao() {
        return this.productSeriesPriceDao;
    }
}
