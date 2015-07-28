package com.dabast.entity;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

/**
 * Created by Administrator on 2015/7/28.
 */
@Document(collection = "cart")
public class Cart {
    private String id;
    private String userId;
    private List<ProductSelected> productSelectedList;
    private String productSeriesId;
    private Integer amount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<ProductSelected> getProductSelectedList() {
        return productSelectedList;
    }

    public void setProductSelectedList(List<ProductSelected> productSelectedList) {
        this.productSelectedList = productSelectedList;
    }

    public String getProductSeriesId() {
        return productSeriesId;
    }

    public void setProductSeriesId(String productSeriesId) {
        this.productSeriesId = productSeriesId;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }
}
