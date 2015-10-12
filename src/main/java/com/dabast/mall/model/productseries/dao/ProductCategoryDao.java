package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductCategory;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductSubCategory;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/10/12.
 */
@Repository
public class ProductCategoryDao extends BaseMongoDao<ProductCategory> {
    public String getProductCategoryIdByProductSeriesId(String productSeriesId) {
        if (productSeriesId==null) return null;
        ProductSeries productSeries= ServiceManager.productSeriesService.findById(productSeriesId);
        if (productSeries==null) return null;
        ProductSubCategory productSubCategory=ServiceManager.productSubCategoryService.findById(productSeries.getSubCategoryId());
        return productSubCategory==null?null:productSubCategory.getCategoryId();
    }
}
