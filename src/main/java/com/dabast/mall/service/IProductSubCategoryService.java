package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSubCategory;

import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
public interface IProductSubCategoryService extends IBaseEntityManager<ProductSubCategory> {
    List<ProductSubCategory> getProductSubCategoriesByCategoryId(String categoryId);
}