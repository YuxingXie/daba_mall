package com.dabast.entity;

import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.util.Assert;
import java.util.List;

/**
 * 这不是一个持久化了，是一个持久化中间类(作为Cart的一个field)
 */

public class ProductSelected {
    private String productSeriesId;
    private Integer amount;
    private List<String> productPropertyValueIds;
    @Transient
    private List<ProductPropertyValue> productPropertyValueList;
    @Transient
    private ProductSeries productSeries;

    public List<ProductPropertyValue> getProductPropertyValueList() {
        return productPropertyValueList;
    }

    public void setProductPropertyValueList(List<ProductPropertyValue> productPropertyValueList) {
        this.productPropertyValueList = productPropertyValueList;
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

    public List<String> getProductPropertyValueIds() {
        return productPropertyValueIds;
    }

    public void setProductPropertyValueIds(List<String> productPropertyValueIds) {
        this.productPropertyValueIds = productPropertyValueIds;
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
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        ProductSelected other = (ProductSelected) obj;
        Assert.notNull(this.productSeriesId);
        Assert.notNull(other.productSeriesId);
        if (!this.productSeriesId.equalsIgnoreCase(other.productSeriesId)) return false;
        if (other.getProductPropertyValueIds() == null && this.getProductPropertyValueIds() == null) return true;
        if (other.getProductPropertyValueIds() == null && this.getProductPropertyValueIds() != null) return false;
        if (other.getProductPropertyValueIds() != null && this.getProductPropertyValueIds() == null) return false;
        if (other.getProductPropertyValueIds().size() != this.getProductPropertyValueIds().size()) return false;
        for (String productPropertyValueId : this.getProductPropertyValueIds()) {
            boolean equals=false;
            for (String otherProductPropertyValueId : other.getProductPropertyValueIds()) {
                if (productPropertyValueId.equalsIgnoreCase(otherProductPropertyValueId)) {
                    equals=true;
                }
            }
            if (!equals) return false;
        }
        return true;
    }
//    public void merge(ProductSelected another){
//        if (!this.equals(another)) return;
//        if (another.getProductPropertySelects()==null && this.getProductPropertySelects()==null) return;
//        this.amount+=another.amount;
//    }
}
