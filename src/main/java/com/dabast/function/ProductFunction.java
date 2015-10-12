package com.dabast.function;

import com.dabast.common.helper.service.ProjectContext;
import com.dabast.entity.ProductCategory;
import com.dabast.entity.ProductProperty;
import com.dabast.mall.model.productseries.service.IProductCategoryService;
import com.dabast.mall.model.productseries.service.impl.ProductPropertyService;

import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
public class ProductFunction {
    public static List<ProductProperty> getProductPropertiesByProductSeriesId(String productSeriesId){
        if (productSeriesId==null) return null;
        ProductPropertyService productPropertyService=ProjectContext.getBean("productPropertyService");
        ProductProperty productProperty=new ProductProperty();
        productProperty.setProductSeriesId(productSeriesId);
        return productPropertyService.findEquals(productProperty);
    }
    public static List<ProductCategory> getProductCategories(){
        IProductCategoryService productCategoryService=ProjectContext.getBean("productCategoryService");
        return productCategoryService.findAll();
    }
    public static String getProductCategoryIdByProductSeriesId(String productSeriesId){
        IProductCategoryService productCategoryService=ProjectContext.getBean("productCategoryService");
        return productCategoryService.getProductCategoryIdByProductSeriesId(productSeriesId);
    }
}
