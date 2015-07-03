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
    @Id
    private String id;
    @Length(min=2,max=100)
    @Field(value = "name")
    private String name;
    @Field(value = "pictures")
    private String[] pictures;
    @Field(value = "commonPrice")
    private Double commonPrice;
    @Field(value = "description")
    private String description;
//    @Past
//    @NotNull
    @Field(value = "shelvesDate")
    private Long shelvesDate;
    @Field(value = "brand")
    private String brand;


    @DBRef(db = "")
    private List<ProductProperty> productProperties;
    private boolean newProduct;
    private Integer evaluateCount;
    public boolean isNewProduct() {
        long now=System.currentTimeMillis();
        if (shelvesDate==null) return false;
        if ((now-shelvesDate) <=(30L*24L*60L*60L*1000L)) {
            return true;
        }
        return false;
    }

    public List<ProductProperty> getProductProperties() {
        return productProperties;
    }

    public void setProductProperties(List<ProductProperty> productProperties) {
        this.productProperties = productProperties;
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

    public String[] getPictures() {
        return pictures;
    }

    public void setPictures(String[] pictures) {
        this.pictures = pictures;
    }

    public Double getCommonPrice() {
        return commonPrice;
    }

    public void setCommonPrice(Double commonPrice) {
        this.commonPrice = commonPrice;
    }

    public Integer getEvaluateCount() {
        return evaluateCount;
    }

    public void setEvaluateCount(Integer evaluateCount) {
        this.evaluateCount = evaluateCount;
    }

    public Long getShelvesDate() {
        return shelvesDate;
    }

    public void setShelvesDate(Long shelvesDate) {
        this.shelvesDate = shelvesDate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
