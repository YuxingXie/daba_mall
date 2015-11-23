package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.util.Assert;

import java.util.List;

public class ProductStore{
    @Transient
    private Integer remain;
    @Field(value = "warningAmount")
    private Integer warningAmount;
    @Transient
    private List<ProductStoreInAndOut> inAndOutList;

    public Integer getRemain() {
        if (inAndOutList==null) return 0;
        Integer remain=0;
        for (ProductStoreInAndOut inAndOut :inAndOutList){
            String type=inAndOut.getType();
            Assert.notNull(type);
            Assert.notNull(inAndOut.getAmount());
            if (type.equals("in"))
            remain+=inAndOut.getAmount();
            else remain-=inAndOut.getAmount();
        }
        return remain;
    }

    public Integer getWarningAmount() {
        return warningAmount;
    }

    public void setWarningAmount(Integer warningAmount) {
        this.warningAmount = warningAmount;
    }

    public List<ProductStoreInAndOut> getInAndOutList() {
        return inAndOutList;
    }

    public void setInAndOutList(List<ProductStoreInAndOut> inAndOutList) {
        this.inAndOutList = inAndOutList;
    }

}
