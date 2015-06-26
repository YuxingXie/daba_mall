package com.dabast.entity;

import org.springframework.data.annotation.Id;

import java.util.List;

/**
 * Created by Administrator on 2015/6/4.
 */
public class Product {
    @Id private String id;
    private ProductSeries productSeries;
    private String price;
    private String picture;
    private List<ProductProperty> properties;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public List<ProductProperty> getProperties() {
        return properties;
    }

    public void setProperties(List<ProductProperty> properties) {
        this.properties = properties;
    }
}
