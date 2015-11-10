package com.dabast.entity;

import com.dabast.entity.field.CardSort;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.util.List;

/**
 * Created by Administrator on 2015/11/10.
 */
@Document(collection = "bank")
public class Bank {
    @Id
    private String id;
    @Field(value = "code")
    private String code;
    @Field(value = "name")
    private String name;
    @Field(value = "ico")
    private String ico;
    @Field(value = "cartSorts")
    private List<CardSort> cardSorts;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public List<CardSort> getCardSorts() {
        return cardSorts;
    }

    public void setCardSorts(List<CardSort> cardSorts) {
        this.cardSorts = cardSorts;
    }
}
