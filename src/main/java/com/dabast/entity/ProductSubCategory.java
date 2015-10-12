package com.dabast.entity;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Administrator on 2015/10/12.
 */
@Document(collection = "productSubCategory")
public class ProductSubCategory {
    private String id;
    private String categoryId;
    private String subCategoryName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }
}
