package com.dabast.support.vo;

import com.dabast.entity.ProductSeries;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2016/1/6.
 */
public class ProductSeriesCreate {
    private ProductSeries productSeries;
    private MultipartFile[] files;

    public ProductSeries getProductSeries() {
        return productSeries;
    }

    public void setProductSeries(ProductSeries productSeries) {
        this.productSeries = productSeries;
    }

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }
}
