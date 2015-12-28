package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 重大改变：价格变为产品属性而不单独创建集合
 */
//@Document(collection = "productSeriesPrice")
public class ProductSeriesPrice {
//    @Id
//    private String id;
    @NotNull
    @Field(value = "price")
    private double price;
    @NotNull
    @Future
    @Field(value = "beginDate")
    private Date beginDate;
    @Field(value = "endDate")
    private Date endDate;
    @NotNull
    @Field(value = "adjustDate")
    private Date adjustDate;
//    @DBRef
//    private ProductSeriesPrice prevPrice;
//    @DBRef(db = "productSeries")
//    private ProductSeries productSeries;
    @Field(value = "comment")
    private String comment;
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getAdjustDate() {
        return adjustDate;
    }

    public void setAdjustDate(Date adjustDate) {
        this.adjustDate = adjustDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

//    public ProductSeries getProductSeries() {
//        return productSeries;
//    }
//
//    public void setProductSeries(ProductSeries productSeries) {
//        this.productSeries = productSeries;
//    }

//    public ProductSeriesPrice getPrevPrice() {
//        return prevPrice;
//    }
//
//    public void setPrevPrice(ProductSeriesPrice prevPrice) {
//        this.prevPrice = prevPrice;
//    }
}