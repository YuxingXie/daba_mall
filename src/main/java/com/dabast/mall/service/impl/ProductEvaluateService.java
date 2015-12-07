package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;
import com.dabast.mall.dao.ProductEvaluateDao;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public Page<ProductEvaluate> findProductEvaluatesPageByProductSeries(ProductSeries productSeries, Integer page, int pageSize) {
        return productEvaluateDao.findProductEvaluatesPageByProductSeries(productSeries, page, pageSize) ;
    }

    @Override
    public Page<ProductEvaluate> findProductEvaluatesPageWithoutParentEvaluateByProductSeries(ProductSeries productSeries, Integer page, int pageSize) {
        return productEvaluateDao.findProductEvaluatesPageWithoutParentEvaluateByProductSeries(productSeries, page, pageSize);
    }

    @Override
    public List<ProductEvaluate> findEvaluatesWithParentId(String evaluateId) {
        return productEvaluateDao.findEvaluatesWithParentId(evaluateId);
    }

    @Override
    public boolean praised(ProductEvaluate parent, User praiseUser) {
        return productEvaluateDao.praised(parent, praiseUser);
    }

    @Override
    public ProductEvaluate praisedEvaluate(ProductEvaluate parent, User praiseUser) {
        return productEvaluateDao.praisedEvaluate(parent,praiseUser);
    }
}