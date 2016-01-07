package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductSeries;

import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
public interface IProductPropertyService  extends IBaseEntityManager<ProductProperty> {
    List<ProductProperty> getProductPropertiesByProductSeriesId(String productSeriesId);

    void removeByProductSeries(ProductSeries productSeries);
}
