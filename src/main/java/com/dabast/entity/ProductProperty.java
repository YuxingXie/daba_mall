package com.dabast.entity;

/**
 * Created by Administrator on 2015/6/4.
 */
public class ProductProperty {
    private String id;
    private String propertyName;
    private ProductSeries productSeries;
    private Object[] propertyValues;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public Object[] getPropertyValues() {
        return propertyValues;
    }

    public void setPropertyValues(Object[] propertyValues) {
        this.propertyValues = propertyValues;
    }

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

}
