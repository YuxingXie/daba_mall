package com.dabast.entity;

/**
 * Created by Administrator on 2015/6/4.
 */
public class ProductProperty {
    private String id;
    private String name;
    private Product product;
    private Object productPropertyValue;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Object getProductPropertyValue() {
        return productPropertyValue;
    }

    public void setProductPropertyValue(Object productPropertyValue) {
        this.productPropertyValue = productPropertyValue;
    }
}
