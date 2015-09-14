package com.dabast.vo;

import com.dabast.entity.ProductSelected;
import com.dabast.entity.ProductSeries;

/**
 * Created by Administrator on 2015/9/14.
 */
public class ProductSelectedVo extends ProductSelected {
    private ProductSeries productSeries;
    public ProductSeries getProductSeries() {
        return productSeries;
    }
    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }
}
