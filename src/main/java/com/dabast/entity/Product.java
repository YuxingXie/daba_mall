package com.dabast.entity;

import java.util.Set;

/**
 * Created by Administrator on 2015/7/2.
 */
public class Product {
    private String id;
    private ProductProperty productProperty;
    private int propertyValueIndex;
    private ProductSeries productSeries;

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ProductProperty getProductProperty() {
        return productProperty;
    }

    public void setProductProperty(ProductProperty productProperty) {
        this.productProperty = productProperty;
    }

    public int getPropertyValueIndex() {
        return propertyValueIndex;
    }

    public void setPropertyValueIndex(int propertyValueIndex) {
        this.propertyValueIndex = propertyValueIndex;
    }
}
