package com.dabast.entity;

import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2015/6/2.
 */
@Document(collection = "productSeries")
public class ProductSeries {
    @Length(min=2,max=100)
    @Field(value = "name")
    private String name;
    @Field(value = "picture")
    private String picture;
    private Double minPrice;
    private Integer evaluateCount;
    @Past
    @NotNull
    @Field(value = "shelvesDate")
    private Date shelvesDate;
    @Field(value = "brand")
    private String brand;
    @Id
    private String id;
    @DBRef
    private Set<Product> products;

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Double getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Double minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getEvaluateCount() {
        return evaluateCount;
    }

    public void setEvaluateCount(Integer evaluateCount) {
        this.evaluateCount = evaluateCount;
    }

    public Date getShelvesDate() {
        return shelvesDate;
    }

    public void setShelvesDate(Date shelvesDate) {
        this.shelvesDate = shelvesDate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
