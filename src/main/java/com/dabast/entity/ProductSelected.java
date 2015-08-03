package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Document(collection = "productSelected")
public class ProductSelected {
    @Id
    private String id;
    @Field(value = "productSeriesId")
    @DBRef(db = "productSeries")
    private String productSeriesId;
    @Field(value = "productPropertySelects")
    private ProductPropertySelect[] productPropertySelects;
    @Field(value = "amount")
    private Integer amount;
    private ProductSeries productSeries;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ProductPropertySelect[] getProductPropertySelects() {
        return productPropertySelects;
    }

    public void setProductPropertySelects(ProductPropertySelect[] productPropertySelects) {
        this.productPropertySelects = productPropertySelects;
    }

    public String getProductSeriesId() {
        return productSeriesId;
    }

    public void setProductSeriesId(String productSeriesId) {
        this.productSeriesId = productSeriesId;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    @Override
    public boolean equals(Object obj) {
        Assert.notNull(obj);
        if(this == obj) return true;
        if(obj == null)  return false;
        if(getClass() != obj.getClass() ) return false;
        ProductSelected other = (ProductSelected)obj;
        Assert.notNull(this.productSeriesId);
        Assert.notNull(other.productSeriesId);
        if (!this.productSeriesId.equalsIgnoreCase(other.productSeriesId)) return false;
        if (other.getProductPropertySelects()==null && this.getProductPropertySelects()==null) return true;
        if (other.getProductPropertySelects()==null && this.getProductPropertySelects()!=null) return false;
        if (other.getProductPropertySelects()!=null && this.getProductPropertySelects()==null) return false;
        if (other.getProductPropertySelects().length!=this.getProductPropertySelects().length) return false;
        for (ProductPropertySelect thisProductPropertySelect:this.getProductPropertySelects()){
            for (ProductPropertySelect otherProductPropertySelect:other.getProductPropertySelects()){
                if (thisProductPropertySelect.getProductPropertyId().equalsIgnoreCase(otherProductPropertySelect.getProductPropertyId())){
                    if (thisProductPropertySelect.getSelectIndex()!=otherProductPropertySelect.getSelectIndex()){
                        return false;
                    }
                }
            }
        }
        return true;
    }
//    public void merge(ProductSelected another){
//        if (!this.equals(another)) return;
//        if (another.getProductPropertySelects()==null && this.getProductPropertySelects()==null) return;
//        this.amount+=another.amount;
//    }
}
