package com.dabast.entity.field;

import com.dabast.entity.Bank;
import org.springframework.data.annotation.Transient;

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
