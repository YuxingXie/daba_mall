package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * Created by Administrator on 2015/6/4.
 */
@Document(collection = "productProperty")
public class ProductProperty {
    @Id
    private String id;
    @Field(value = "propertyName")
    private String propertyName;
    @Field(value = "productSeries")
    private ProductSeries productSeriesId;

    private PropertyValues propertyValues;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public PropertyValues getPropertyValues() {
        return propertyValues;
    }

    public void setPropertyValues(PropertyValues propertyValues) {
        this.propertyValues = propertyValues;
    }

    public ProductSeries getProductSeriesId() {
        return productSeriesId;
    }

    public void setProductSeriesId(ProductSeries productSeriesId) {
        this.productSeriesId = productSeriesId;
    }
}
