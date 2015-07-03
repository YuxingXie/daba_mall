package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * Created by Administrator on 2015/7/3.
 */
@Document(collection = "propertyValues")
public class PropertyValues {
    @Id
    private String id;
    @Field(value = "values")
    private Object[] values;
    @Field(value = "productPropertyId")
    private String productPropertyId;
    private ProductProperty productProperty;

    public PropertyValues(String id, Object[] values) {
        this.id = id;
        this.values = values;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setValues(Object[] values) {
        this.values = values;
    }
    public Object[] getValues() {
        return values;
    }

    public String getProductPropertyId() {
        return productPropertyId;
    }

    public void setProductPropertyId(String productPropertyId) {
        this.productPropertyId = productPropertyId;
    }

    public ProductProperty getProductProperty() {
        return productProperty;
    }

    public void setProductProperty(ProductProperty productProperty) {
        this.productProperty = productProperty;
    }
}
