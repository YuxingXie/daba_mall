package com.dabast.entity;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
@Document(collection = "order")
public class Order {
    private String id;
    private List<String> productSeriesIds;
    private String payStatus;
    private Date orderDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<String> getProductSeriesIds() {
        return productSeriesIds;
    }

    public void setProductSeriesIds(List<String> productSeriesIds) {
        this.productSeriesIds = productSeriesIds;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
