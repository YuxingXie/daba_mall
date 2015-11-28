package com.dabast.entity;

import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.util.Assert;
import java.util.List;

/**
 * 这不是一个持久化document，是一个持久化中间类(作为Cart,Interest和order的一个field)
 */

public class ProductSelected {
    @Transient
    private String productSeriesId;
    private Integer amount;
    @Transient
    private ProductEvaluate productEvaluate;

    @Transient
    private List<String> productPropertyValueIds;
    @DBRef
    private List<ProductPropertyValue> productPropertyValueList;
    @DBRef
    private ProductSeries productSeries;

    private String receiveStatus;

    @DBRef
    private ProductSeriesPrice orderPrice;

    public ProductSeriesPrice getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(ProductSeriesPrice orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getReceiveStatus() {
        return receiveStatus;
    }

    public void setReceiveStatus(String receiveStatus) {
        this.receiveStatus = receiveStatus;
    }
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

    public ProductEvaluate getProductEvaluate() {
        return productEvaluate;
    }

    public void setProductEvaluate(ProductEvaluate productEvaluate) {
        this.productEvaluate = productEvaluate;
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
        Assert.notNull(this.productSeries.getId());
        Assert.notNull(other.productSeries.getId());
//        if (!this.productSeries.getId().equalsIgnoreCase(other.productSeries.getId())) return false;
//        if (other.getProductPropertyValueIds() == null && this.getProductPropertyValueIds() == null) return true;
//        if (other.getProductPropertyValueIds() == null && this.getProductPropertyValueIds() != null) return false;
//        if (other.getProductPropertyValueIds() != null && this.getProductPropertyValueIds() == null) return false;
//        if (other.getProductPropertyValueIds().size() != this.getProductPropertyValueIds().size()) return false;
        if ((other.getProductPropertyValueList() == null||other.getProductPropertyValueList().size()==0) && (this.getProductPropertyValueList() == null||this.getProductPropertyValueList().size()==0)) return true;
        if ((other.getProductPropertyValueList() == null||other.getProductPropertyValueList().size()==0) && this.getProductPropertyValueList().size()>0) return false;
        if (other.getProductPropertyValueList().size()>0 && (this.getProductPropertyValueList() == null||this.getProductPropertyValueList().size()==0)) return false;
        if (other.getProductPropertyValueList().size()!= this.getProductPropertyValueList().size()) return false;
//        for (String productPropertyValueId : this.getProductPropertyValueIds()) {
//            boolean equals=false;
//            for (String otherProductPropertyValueId : other.getProductPropertyValueIds()) {
//                if (productPropertyValueId.equalsIgnoreCase(otherProductPropertyValueId)) {
//                    equals=true;
//                }
//            }
//            if (!equals) return false;
//        }
        for (ProductPropertyValue thisProductPropertyValue : this.getProductPropertyValueList()) {
            boolean equals=false;
            for (ProductPropertyValue otherProductPropertyValue : other.getProductPropertyValueList()) {
                if (thisProductPropertyValue.getId().equalsIgnoreCase(otherProductPropertyValue.getId())) {
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
