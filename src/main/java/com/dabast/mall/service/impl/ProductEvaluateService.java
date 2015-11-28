package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.dao.ProductEvaluateDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ProductEvaluateService extends BaseEntityManager<ProductEvaluate> implements IProductEvaluateService {
    @Resource
    private ProductEvaluateDao productEvaluateDao;
    protected EntityDao<ProductEvaluate> getEntityDao() {
        return this.productEvaluateDao;
    }

    @Override
    public ProductEvaluate findByOrderAndProductSeries(Order order, ProductSeries productSeries) {
        return productEvaluateDao.findByOrderAndProductSeries(order, productSeries);
    }
}
