package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "account")
public class Account {
    @Id
    private String id;
    @Field(value = "cardUserIdCardNo")
    private String cardUserIdCardNo;
    @Field(value = "cardNo")
    private String cardNo;
    @Field(value = "cardSort")
    private String cardSort;//1信用卡，2储蓄卡
    @Field(value = "cardUserPhone")
    private String cardUserPhone;
    @Field (value = "userId")
    private String userId;
    @Field(value = "cardUserName")
    private String cardUserName;
    @Transient
    private User user;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public String getCardUserName() {
        return cardUserName;
    }

    public void setCardUserName(String cardUserName) {
        this.cardUserName = cardUserName;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCardUserIdCardNo() {
        return cardUserIdCardNo;
    }

    public void setCardUserIdCardNo(String cardUserIdCardNo) {
        this.cardUserIdCardNo = cardUserIdCardNo;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardSort() {
        return cardSort;
    }

    public void setCardSort(String cardSort) {
        this.cardSort = cardSort;
    }

    public User getUser() {
        return user;
    }

    public String getCardUserPhone() {
        return cardUserPhone;
    }

    public void setCardUserPhone(String cardUserPhone) {
        this.cardUserPhone = cardUserPhone;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
