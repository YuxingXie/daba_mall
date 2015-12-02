package com.dabast.entity;

import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.BigDecimalUtil;
import com.mongodb.DBObject;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Document(collection = "productSeries")
public class ProductSeries {
    @Id
    private String id;
    @Length(min=2,max=100)
    @Field(value = "name")
    private String name;
    @Field(value = "pictures")
    private String[] pictures;
//    @Field(value = "commonPrice")

    @Field(value = "description")
    private String description;
//    @Past
//    @NotNull
    @Field(value = "shelvesDate")
    private Date shelvesDate;
    @Field(value = "brand")
    private String brand;
    @Field(value = "productStore")
    private ProductStore productStore;
    @Field
    private String measurementUnit;
    /**
     * 规格参数
     */
    @Field
    private List<InstructionManualItem> instructionManual;
    /**
     * 规格参数
     */
    @Field
    private List<PackageItem> packageItems;
    @Field
    private ProductBrochures productBrochures;
    @DBRef
    private ProductSubCategory productSubCategory;
    @Transient
    private Integer evaluateCount;
    @Field
    private boolean newProduct;
    @Transient
    private List<ProductProperty> productProperties;
    @Transient
    private List<ProductPropertyValue> productPropertyValues;
    @Transient
    private List<ProductSeriesPrice> productSeriesPrices;
    @Transient
    private Double commonPrice;
    @Transient
    private ProductSeriesPrice currentPrice;
    @Transient
    private List<ProductEvaluate> productEvaluateList;
    @Transient
    private Double productSeriesEvaluateGrade;
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }

    public Double getProductSeriesEvaluateGrade() {
        if (productEvaluateList==null) return 0d;
        if (productEvaluateList.size()==0) return 0d;
        Integer totalGrade=0;
        for (ProductEvaluate productEvaluate:productEvaluateList){
            Integer grade=productEvaluate.getGrade();
            totalGrade+=grade;
        }
        this.productSeriesEvaluateGrade=BigDecimalUtil.divide(totalGrade,productEvaluateList.size());
        return this.productSeriesEvaluateGrade;
    }

    public boolean isNewProduct() {
//        long now=System.currentTimeMillis();
//        if (shelvesDate==null) return false;
//        if ((now-shelvesDate.getTime()) <=(30L*24L*60L*60L*1000L)) {
//            return true;
//        }
//        return false;
        return newProduct;
    }

    public ProductStore getProductStore() {
        return productStore;
    }

    public void setProductStore(ProductStore productStore) {
        this.productStore = productStore;
    }

    public List<ProductSeriesPrice> getProductSeriesPrices() {
        return productSeriesPrices;
    }

    public void setProductSeriesPrices(List<ProductSeriesPrice> productSeriesPrices) {
        this.productSeriesPrices = productSeriesPrices;
    }

    public ProductBrochures getProductBrochures() {
        return productBrochures;
    }

    public void setProductBrochures(ProductBrochures productBrochures) {
        this.productBrochures = productBrochures;
    }

    public List<ProductProperty> getProductProperties() {
        return productProperties;
    }

    public void setProductProperties(List<ProductProperty> productProperties) {
        this.productProperties = productProperties;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getPictures() {
        return pictures;
    }

    public void setPictures(String[] pictures) {
        this.pictures = pictures;
    }

    public Double getCommonPrice(){
        return getCurrentPrice()==null?0d:getCurrentPrice().getPrice();
    }
    public ProductSeriesPrice getCurrentPrice(){
        if (productSeriesPrices==null) {
//            productSeriesPrices=ServiceManager.productSeriesPriceService.findByProductSeriesId(id);
            return null;
        }
        Date now=new Date();
        for (ProductSeriesPrice productSeriesPrice:productSeriesPrices){
            Assert.notNull(productSeriesPrice.getBeginDate());
            if (productSeriesPrice.getEndDate()==null){
                if (now.after(productSeriesPrice.getBeginDate())){
                    this.currentPrice=productSeriesPrice;
                    return this.currentPrice;
                }else{
                    continue;
                }
            }else{
                if (now.after(productSeriesPrice.getBeginDate()) &&now.before(productSeriesPrice.getEndDate())){
                    return productSeriesPrice;
                }else {
                    continue;
                }
            }
        }
        return null;//这里表示定价的所有时间段都在未来
    }




    public void setProductEvaluateList(List<ProductEvaluate> productEvaluateList) {
        this.productEvaluateList = productEvaluateList;
    }

    public List<ProductEvaluate> getProductEvaluateList() {
        return productEvaluateList;
    }

    public Integer getEvaluateCount() {
        if (productEvaluateList==null) return 0;
        return productEvaluateList.size();
    }

//    public void setEvaluateCount(Integer evaluateCount) {
//        this.evaluateCount = evaluateCount;
//    }

    public Date getShelvesDate() {
        return shelvesDate;
    }

    public void setShelvesDate(Date shelvesDate) {
        this.shelvesDate = shelvesDate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductSubCategory getProductSubCategory() {
        return productSubCategory;
    }

    public void setProductSubCategory(ProductSubCategory productSubCategory) {
        this.productSubCategory = productSubCategory;
    }

    public List<ProductPropertyValue> getProductPropertyValues() {
        return productPropertyValues;
    }

    public void setProductPropertyValues(List<ProductPropertyValue> productPropertyValues) {
        this.productPropertyValues = productPropertyValues;
    }

    public String getMeasurementUnit() {
        return measurementUnit;
    }

    public void setMeasurementUnit(String measurementUnit) {
        this.measurementUnit = measurementUnit;
    }

    public List<InstructionManualItem> getInstructionManual() {
        return instructionManual;
    }

    public void setInstructionManual(List<InstructionManualItem> instructionManual) {
        this.instructionManual = instructionManual;
    }

    @Override
    public boolean equals(Object obj) {
        if(this.id == null){return false;}
        if(!(obj instanceof ProductSeries)) return false;
        if(this == obj) return true;
        ProductSeries other = (ProductSeries)obj;
        return new EqualsBuilder() .append(id,other.getId()) .isEquals();
    }
}
