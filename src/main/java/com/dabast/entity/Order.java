package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
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
     * 支付成功:y，支付失败n，为空表示未进行支付
     */
    private String payStatus;
    @Field(value = "payWay")
    /**
     * 支付方式，货到付款1，在线支付2，公司转账3，邮局汇款4
     */
    private String payWay;
    @Transient
    private String payWayString;
    @Field(value = "orderDate")
    private Date orderDate;
    @Field(value = "userId")
    private String userId;
    @Field(value = "acceptAddress")
    private String acceptAddress;

    @Field(value = "submitStatus")
    private String submitStatus;

    @Field(value = "acceptPersonName")
    private String acceptPersonName;
    @Field(value = "contactPhone")
    private String contactPhone;
    @Field(value = "payAccountId")
    private String payAccountId;
    @Transient
    private Double totalPrice;
    @Transient
    private Integer totalAmount;
    @DBRef(db = "users")
    private User user;
    @DBRef(db = "account")
    private Account payAccount;

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Double getTotalPrice() {
        Double price=0d;
        if (productSelectedList==null) return price;
        for (ProductSelected productSelected:productSelectedList){
            Double thePrice=productSelected.getProductSeries()==null?0:(productSelected.getProductSeries().getCommonPrice()==null?0:productSelected.getProductSeries().getCommonPrice());
            price+=thePrice*productSelected.getAmount();
        }
        return price;
    }

    public Integer getTotalAmount() {
        Integer totalAmount=0;
        if (productSelectedList==null) return totalAmount;
        for (ProductSelected productSelected:productSelectedList){
            totalAmount+=productSelected.getAmount();
        }
        return totalAmount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<ProductSelected> getProductSelectedList() {
        return productSelectedList;
    }

    public String getAcceptPersonName() {
        return acceptPersonName;
    }

    public void setAcceptPersonName(String acceptPersonName) {
        this.acceptPersonName = acceptPersonName;
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

    public String getAcceptAddress() {
        return acceptAddress;
    }

    public void setAcceptAddress(String acceptAddress) {
        this.acceptAddress = acceptAddress;
    }

    public String getSubmitStatus() {
        return submitStatus;
    }

    public void setSubmitStatus(String submitStatus) {
        this.submitStatus = submitStatus;
    }


    public String getPayAccountId() {
        return payAccountId;
    }

    public void setPayAccountId(String payAccountId) {
        this.payAccountId = payAccountId;
    }

    public Account getPayAccount() {
        return payAccount;
    }

    public void setPayAccount(Account payAccount) {
        this.payAccount = payAccount;
    }

    //货到付款1，在线支付2，公司转账3，邮局汇款4
    public String getPayWayString() {
        return payWayString==null?null:(payWayString.equals("1")?"货到付款":(payWayString.equals("2")?"在线支付":(payWayString.equals("3")?"公司转账":(payWayString.equals("4")?"邮局汇款":null))));
    }
}
