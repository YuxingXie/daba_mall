package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.Date;

@Document(collection = "productStoreInAndOut")
public class ProductStoreInAndOut {
    @Id
    private String id;

    @Field
    private String type;//in,out
    @Field
    private Integer amount;
    @Field
    private Date date;
    @DBRef(db = "productSeries")
    private ProductSeries productSeries;
    @DBRef
    private ProductPropertyValue productPropertyValue;
    @DBRef
    private User operator;

    public ProductPropertyValue getProductPropertyValue() {
        return productPropertyValue;
    }

    public void setProductPropertyValue(ProductPropertyValue productPropertyValue) {
        this.productPropertyValue = productPropertyValue;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public User getOperator() {
        return operator;
    }

    public void setOperator(User operator) {
        this.operator = operator;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }
}
