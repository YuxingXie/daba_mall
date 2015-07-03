package com.dabast.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * Created by Administrator on 2015/7/3.
 */
@Document(collection = "productSelected")
public class ProductSelected {
    @Id
    private String id;
//    @Field(value = "productProperties")
    @Field(value = "productPropertySelect")
    private ProductPropertySelect[] productPropertySelect;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public ProductPropertySelect[] getProductPropertySelect() {
        return productPropertySelect;
    }

    public void setProductPropertySelect(ProductPropertySelect[] productPropertySelect) {
        this.productPropertySelect = productPropertySelect;
    }
}
