package com.dabast.support.mapReduce;

import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductSeriesPrice;

/**
 * Created by Administrator on 2015/12/25.
 */
public class ProductPriceMRValue {

    private ProductSeries productSeries;
    private ProductSeriesPrice productSeriesPrice;
    private Double price;

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    public ProductSeriesPrice getProductSeriesPrice() {
        return productSeriesPrice;
    }

    public void setProductSeriesPrice(ProductSeriesPrice productSeriesPrice) {
        this.productSeriesPrice = productSeriesPrice;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
