package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
@Document(collection = "order")
public class Order {
    @Id
    private String id;
    @Field(value = "productSelectedList")
    private List<ProductSelected> productSelectedList;
    @Field(value = "payStatus")
    private String payStatus;
    @Field(value = "orderDate")
    private Date orderDate;
    @Field(value = "userId")
    private String userId;
    @Transient
    private User user;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<ProductSelected> getProductSelectedList() {
        return productSelectedList;
    }

    public void setProductSelectedList(List<ProductSelected> productSelectedList) {

        for (ProductSelected productSelected:productSelectedList){
            List<String> productPropertyValueIds=new ArrayList<String>();
            List<ProductPropertyValue> productPropertyValueList=productSelected.getProductPropertyValueList();
            for (ProductPropertyValue productPropertyValue:productPropertyValueList){
                productPropertyValueIds.add(productPropertyValue.getId());
            }
            productSelected.setProductPropertyValueIds(productPropertyValueIds);
        }
        this.productSelectedList = productSelectedList;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
