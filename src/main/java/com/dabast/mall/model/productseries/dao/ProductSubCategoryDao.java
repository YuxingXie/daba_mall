package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductSubCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
@Repository
public class ProductSubCategoryDao  extends BaseMongoDao<ProductSubCategory> {
    public List<ProductSubCategory> getProductSubCategoriesByCategoryId(String categoryId) {
        ProductSubCategory productSubCategory=new ProductSubCategory();
        productSubCategory.setCategoryId(categoryId);
        return findEquals(productSubCategory);
    }
}
