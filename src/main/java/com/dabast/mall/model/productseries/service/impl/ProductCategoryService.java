package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductCategory;
import com.dabast.mall.model.productseries.dao.ProductCategoryDao;
import com.dabast.mall.model.productseries.service.IProductCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/10/12.
 */
@Service
public class ProductCategoryService extends BaseEntityManager<ProductCategory> implements IProductCategoryService {
    @Resource
    private ProductCategoryDao productCategoryDao;
    protected EntityDao<ProductCategory> getEntityDao() {
        return this.productCategoryDao;
    }

    @Override
    public String getProductCategoryIdByProductSeriesId(String productSeriesId) {
        return productCategoryDao.getProductCategoryIdByProductSeriesId(productSeriesId);
    }
}
