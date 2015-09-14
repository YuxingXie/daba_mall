package com.dabast.vo;

import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductPropertySelect;

/**
 * Created by Administrator on 2015/9/14.
 */
public class ProductPropertySelectVo extends ProductPropertySelect {
    private ProductProperty productProperty;
    public ProductProperty getProductProperty() {
        return productProperty;
    }

    public void setProductProperty(ProductProperty productProperty) {
        this.productProperty = productProperty;
    }
}
