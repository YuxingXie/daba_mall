package com.dabast.entity;

import org.springframework.data.annotation.Transient;

/**
 * Created by Administrator on 2015/11/10.
 */
public class CardSort {
    private String noStart;
    private String cardSort;
    private String cardName;
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

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }
}
