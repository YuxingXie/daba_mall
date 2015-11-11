package com.dabast.entity;

import com.dabast.entity.Bank;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "cardSort")
public class CardSort {
    @Id
    private String id;
    @Field(value = "noStart")
    private String noStart;//信用卡或储蓄卡
    @Field(value = "cardSort")
    private String cardSort;
    @Field(value = "cardName")
    private String cardName;
    @Field(value = "bankId")
    private String bankId;
    @Transient
    private Bank bank;
    public String getNoStart() {
        return noStart;
    }

    public void setNoStart(String noStart) {
        this.noStart = noStart;
    }

    public String getCardSort() {
        return cardSort;
    }

    public void setCardSort(String cardSort) {
        this.cardSort = cardSort;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }
}
