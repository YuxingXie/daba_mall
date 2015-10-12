package com.dabast.entity;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Administrator on 2015/10/12.
 */
@Document(collection = "productCategory")
public class ProductCategory {
    private String id;
    private String categoryName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
