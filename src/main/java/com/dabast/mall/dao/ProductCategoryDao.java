package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductCategory;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductSubCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
@Repository
public class ProductCategoryDao extends BaseMongoDao<ProductCategory> {
    public String getProductCategoryIdByProductSeriesId(String productSeriesId) {
        if (productSeriesId==null) return null;
        ProductSeries productSeries= ServiceManager.productSeriesService.findById(productSeriesId);
        if (productSeries==null) return null;
        ProductSubCategory productSubCategory=ServiceManager.productSubCategoryService.findById(productSeries.getProductSubCategory().getId());
        return productSubCategory==null?null:productSubCategory.getId();
    }

    public List<ProductCategory> findAllCategories() {
        List<ProductCategory> productCategories=findAll();
        for (ProductCategory productCategory:productCategories){
//            System.out.println("大类名称："+productCategory.getCategoryName());
            List<ProductSubCategory> productSubCategories=ServiceManager.productSubCategoryService.getProductSubCategoriesByCategoryId(productCategory.getId());
            for (ProductSubCategory productSubCategory:productSubCategories){
//                System.out.println("小类名称："+productSubCategory.getSubCategoryName());
            }
            productCategory.setProductSubCategories(productSubCategories);
        }
        return productCategories;
    }
}
