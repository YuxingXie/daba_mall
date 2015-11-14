package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 参与活动的某个产品的折扣
 */
@Document(collection = "productSeriesRate")
public class ProductSeriesRate {
    @Id
    private String id;
    @DBRef
    private SalesCampaign salesCampaign;
    @DBRef
    private ProductSeries productSeries;
    @Field(value = "rate")
    private Double rate;

    public SalesCampaign getSalesCampaign() {
        return salesCampaign;
    }

    public void setSalesCampaign(SalesCampaign salesCampaign) {
        this.salesCampaign = salesCampaign;
    }

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }
}
