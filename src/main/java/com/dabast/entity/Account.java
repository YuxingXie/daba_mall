package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
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
    @Field(value = "cardUserName")
    private String cardUserName;
    @Field
    private String cardValidateCode;
    @Field
    private String cardValidDate;
    @DBRef
    private Bank bank;
    @DBRef(db = "users")
    private User user;
    @Transient
    private String cardSortString;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getCardUserName() {
        return cardUserName;
    }

    public void setCardUserName(String cardUserName) {
        this.cardUserName = cardUserName;
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

    public String getCardValidateCode() {
        return cardValidateCode;
    }

    public void setCardValidateCode(String cardValidateCode) {
        this.cardValidateCode = cardValidateCode;
    }

    public String getCardValidDate() {
        return cardValidDate;
    }

    public void setCardValidDate(String cardValidDate) {
        this.cardValidDate = cardValidDate;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public String getCardSortString() {
        if (cardSort==null) return null;
        if (cardSort.equals("1")) return "信用卡";
        if (cardSort.equals("2")) return "储蓄卡";
        return cardSort;
    }
    @Transient
    private CardSort bankCardSort;

    /**
     * 最长匹配
     * @return
     */
    public CardSort getBankCardSort(){
        if (this.cardNo==null) return null;
        if (this.bank==null) return null;
        CardSort maybe=null;
        for (CardSort bankCardSort:bank.getCardSorts()){
            if (bankCardSort.getNoStart()==null ||bankCardSort.getNoStart().length()==0) continue;
            if (!cardNo.startsWith(bankCardSort.getNoStart())) continue;
            if (maybe==null){
                maybe=bankCardSort;
                continue;
            }
            if (bankCardSort.getNoStart().length()<maybe.getNoStart().length()) continue;
            maybe=bankCardSort;
        }
        this.bankCardSort=maybe;
        return maybe;
    }

}
