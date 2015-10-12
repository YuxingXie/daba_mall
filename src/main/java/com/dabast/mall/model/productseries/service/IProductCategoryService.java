package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductCategory;

/**
 * Created by Administrator on 2015/10/12.
 */
public interface IProductCategoryService extends IBaseEntityManager<ProductCategory> {
    String getProductCategoryIdByProductSeriesId(String productSeriesId);
}
