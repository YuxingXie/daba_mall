package com.dabast.entity;

/**
 * Created by Administrator on 2015/7/3.
 */
public class ProductPropertySelect {
    private String productPropertyId;
    private int selectIndex;
    private ProductProperty productProperty;
    public String getProductPropertyId() {
        return productPropertyId;
    }
    public void setProductPropertyId(String productPropertyId) {
        this.productPropertyId = productPropertyId;
    }

    public int getSelectIndex() {
        return selectIndex;
    }

    public void setSelectIndex(int selectIndex) {
        this.selectIndex = selectIndex;
    }

    public ProductProperty getProductProperty() {
        return productProperty;
    }

    public void setProductProperty(ProductProperty productProperty) {
        this.productProperty = productProperty;
    }
}
