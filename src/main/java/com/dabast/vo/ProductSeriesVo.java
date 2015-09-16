package com.dabast.vo;

import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductSeries;

import java.util.List;

/**
 * Created by Administrator on 2015/9/14.
 */
public class ProductSeriesVo extends ProductSeries{
    private ProductProperty[] productProperties;
    public ProductProperty[] getProductProperties() {
        return productProperties;
    }

    public void setProductProperties(ProductProperty[] productProperties) {
        this.productProperties = productProperties;
    }
}
