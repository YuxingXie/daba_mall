package com.dabast.entity;

import com.dabast.common.helper.service.ServiceManager;
import com.mongodb.DBObject;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.List;

@Document(collection = "productSeries")
public class ProductSeries {
    @Id
    private String id;
    @Length(min=2,max=100)
    @Field(value = "name")
    private String name;
    @Field(value = "pictures")
    private String[] pictures;
//    @Field(value = "commonPrice")

    @Field(value = "description")
    private String description;
//    @Past
//    @NotNull
    @Field(value = "shelvesDate")
    private Date shelvesDate;
    @Field(value = "brand")
    private String brand;

    @DBRef
    private ProductSubCategory productSubCategory;
    private Integer evaluateCount;
    @Transient
    private boolean newProduct;
    @Transient
    private List<ProductProperty> productProperties;
    @Transient
    private List<ProductSeriesPrice> productSeriesPrices;
    @Transient
    private Double commonPrice;
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }


    public boolean isNewProduct() {
        long now=System.currentTimeMillis();
        if (shelvesDate==null) return false;
        if ((now-shelvesDate.getTime()) <=(30L*24L*60L*60L*1000L)) {
            return true;
        }
        return false;
    }

    public List<ProductSeriesPrice> getProductSeriesPrices() {
        return productSeriesPrices;
    }

    public void setProductSeriesPrices(List<ProductSeriesPrice> productSeriesPrices) {
        this.productSeriesPrices = productSeriesPrices;
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

    public Double getCommonPrice(){
        if (productSeriesPrices==null) {
//            productSeriesPrices=ServiceManager.productSeriesPriceService.findByProductSeriesId(id);
            return null;
        }
        Date now=new Date();
        for (ProductSeriesPrice productSeriesPrice:productSeriesPrices){
            Assert.notNull(productSeriesPrice.getBeginDate());
            if (productSeriesPrice.getEndDate()==null){
                if (now.after(productSeriesPrice.getBeginDate())){
                    return productSeriesPrice.getPrice();
                }else{
                    continue;
                }
            }else{
                if (now.after(productSeriesPrice.getBeginDate()) &&now.before(productSeriesPrice.getEndDate())){
                    return productSeriesPrice.getPrice();
                }else {
                    continue;
                }
            }
        }
        return null;//这里表示定价的所有时间段都在未来
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductSubCategory getProductSubCategory() {
        return productSubCategory;
    }

    public void setProductSubCategory(ProductSubCategory productSubCategory) {
        this.productSubCategory = productSubCategory;
    }
}
