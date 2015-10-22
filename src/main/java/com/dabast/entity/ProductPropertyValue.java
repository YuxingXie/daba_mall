package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * Created by Administrator on 2015/6/4.
 */
@Document(collection = "productPropertyValue")
public class ProductPropertyValue {
    @Id
    private String id;
    @Field(value = "value")
    private String value;
    @Field(value = "productPropertyId")
    private String productPropertyId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getProductPropertyId() {
        return productPropertyId;
    }

    public void setProductPropertyId(String productPropertyId) {
        this.productPropertyId = productPropertyId;
    }
}
