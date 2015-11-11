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
    @Field(value = "userId")
    private String userId;
    @Field(value = "cardNo")
    @Indexed
    private String cardNo;
    @Field(value = "cardSortId")
    private String cardSortId;
    @Transient
    private CardSort cardSort;
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

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCardSortId() {
        return cardSortId;
    }

    public void setCardSortId(String cardSortId) {
        this.cardSortId = cardSortId;
    }

    public CardSort getCardSort() {
        return cardSort;
    }

    public void setCardSort(CardSort cardSort) {
        this.cardSort = cardSort;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
