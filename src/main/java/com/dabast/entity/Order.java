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
    /**
     * 已支付:y，未支付n
     */
    private String payStatus;
    @Field(value = "payWay")
    /**
     * 支付方式，货到付款1，在线支付2，公司转账3，邮局汇款4
     */
    private String payWay;
    @Field(value = "orderDate")
    private Date orderDate;
    @Field(value = "userId")
    private String userId;
    @Field(value = "addressId")
    private String addressId;
    @Field(value = "submitStatus")
    private String submitStatus;
    @Field(value = "postAddress")
    private String postAddress;
    @Transient
    private Double totalPrice;

    public Double getTotalPrice() {
        Double price=0d;
        for (ProductSelected productSelected:productSelectedList){
            Double thePrice=productSelected.getProductSeries()==null?0:(productSelected.getProductSeries().getCommonPrice()==null?0:productSelected.getProductSeries().getCommonPrice());
            price+=thePrice*productSelected.getAmount();
        }
        return price;
    }

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
            if (productPropertyValueList==null) continue;
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

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public String getPostAddress() {
        return postAddress;
    }

    public void setPostAddress(String postAddress) {
        this.postAddress = postAddress;
    }

    public String getSubmitStatus() {
        return submitStatus;
    }

    public void setSubmitStatus(String submitStatus) {
        this.submitStatus = submitStatus;
    }
}
