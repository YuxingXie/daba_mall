package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSubCategory;
import com.dabast.mall.model.productseries.dao.ProductSubCategoryDao;
import com.dabast.mall.model.productseries.service.IProductSubCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/10/12.
 */
@Service
public class ProductSubCategoryService  extends BaseEntityManager<ProductSubCategory> implements IProductSubCategoryService {
    @Resource
    private ProductSubCategoryDao productSubCategoryDao;
    protected EntityDao<ProductSubCategory> getEntityDao() {
        return this.productSubCategoryDao;
    }
}
