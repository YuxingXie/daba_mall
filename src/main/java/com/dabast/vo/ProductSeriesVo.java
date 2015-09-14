package com.dabast.vo;

import com.dabast.entity.ProductProperty;

import java.util.List;

/**
 * Created by Administrator on 2015/9/14.
 */
public class ProductSeriesVo {
    private ProductProperty[] productProperties;
    public ProductProperty[] getProductProperties() {
        return productProperties;
    }

    public void setProductProperties(ProductProperty[] productProperties) {
        this.productProperties = productProperties;
    }
}
