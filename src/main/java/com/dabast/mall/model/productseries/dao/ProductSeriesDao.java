package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductPropertySelect;
import com.dabast.entity.ProductSeries;
import com.dabast.vo.ProductSeriesVo;
import org.bson.types.ObjectId;
import org.springframework.beans.BeanUtils;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.TextQuery;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Repository
public class ProductSeriesDao extends BaseMongoDao<ProductSeries> {
    public List<String[]> getTop3ProductSeries() {
        List<String[]> list=new ArrayList<String[]>();
        String[] product1={"11111122228x1","statics/assets/temp/sliders/slide2/bg.jpg","黄材水产","新品上市","中华鲟","优惠价","25"};
        String[] product2={"0x1451112ffb","statics/assets/temp/sliders/slide5/bg.jpg","本地<br>生态腊鱼","货源充足，放心购买"};
        String[] product3={"4512f44d003f","statics/assets/temp/sliders/slide3/bg.jpg","正宗乡里腊肉","源自宁乡","您购买的不二选择","最新优惠价","149"};
        list.add(product1);
        list.add(product2);
        list.add(product3);
        return list;
    }

    public List<ProductSeries> getHotSell() {
        //可规定热卖商品数量
        List<ProductSeries> productSeriesList=findAll();

//        ProductSeries productSeries1=new ProductSeries();
//        productSeries1.setId("5595f39fe7c7fa5690325b11");
//        productSeries1.setBrand("大坝");
//        productSeries1.setEvaluateCount(888);
//        productSeries1.setCommonPrice(100.36);
//        productSeries1.setName("帝王蟹");
//        productSeries1.setPictures(new String[]{"statics/assets/temp/products/model1.jpg","statics/assets/temp/products/model2.jpg"});
//        String[] pattern = new String[]{"yyyy-MM","yyyyMM","yyyy/MM",
//                "yyyyMMdd","yyyy-MM-dd","yyyy/MM/dd",
//                "yyyyMMddHHmmss",
//                "yyyy-MM-dd HH:mm:ss",
//                "yyyy/MM/dd HH:mm:ss"};
//        try {
//            productSeries1.setShelvesDate(DateUtils.parseDate("2014-10-12",pattern).getTime());
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//
//        ProductSeries productSeries2=new ProductSeries();
//        productSeries2.setId("1111112");
//        productSeries2.setBrand("大坝");
//        productSeries2.setEvaluateCount(101);
//        productSeries2.setCommonPrice(100.36);
//        productSeries2.setName("豆腐乳");
//        productSeries2.setPictures(new String[]{"statics/assets/temp/products/model2.jpg"});
//        productSeries2.setShelvesDate(new Date().getTime());
//
//        ProductSeries productSeries3=new ProductSeries();
//        productSeries3.setId("1111113");
//        productSeries3.setBrand("大坝");
//        productSeries3.setEvaluateCount(1081);
//        productSeries3.setCommonPrice(100.36);
//        productSeries3.setName("酱板鸭");
//        productSeries3.setPictures(new String[]{"statics/assets/temp/products/model6.jpg"});
//        productSeries3.setShelvesDate(new Date().getTime());
//
//        ProductSeries productSeries4=new ProductSeries();
//        productSeries4.setId("1111114");
//        productSeries4.setBrand("大坝");
//        productSeries4.setEvaluateCount(11);
//        productSeries4.setCommonPrice(100.36);
//        productSeries4.setName("黄材中华鲟");
//        productSeries4.setPictures(new String[]{"statics/assets/temp/products/model4.jpg"});
//        productSeries4.setShelvesDate(new Date().getTime());
//
//        ProductSeries productSeries5=new ProductSeries();
//        productSeries5.setId("1111115");
//        productSeries5.setBrand("大坝");
//        productSeries5.setEvaluateCount(1001);
//        productSeries5.setCommonPrice(100.36);
//        productSeries5.setName("大龙虾");
//        productSeries5.setPictures(new String[]{"statics/assets/temp/products/model5.jpg"});
//        productSeries5.setShelvesDate(new Date().getTime());
//
//        ProductSeries productSeries6=new ProductSeries();
//        productSeries6.setId("1111116");
//        productSeries6.setBrand("大坝");
//        productSeries6.setEvaluateCount(999);
//        productSeries6.setCommonPrice(100.36);
//        productSeries6.setName("乡里腊肉");
//        productSeries6.setPictures(new String[]{"statics/assets/temp/products/model3.jpg"});
//        productSeries6.setShelvesDate(new Date().getTime());
//
//        ProductSeries productSeries7=new ProductSeries();
//        productSeries7.setId("1111117");
//        productSeries7.setBrand("大坝");
//        productSeries7.setEvaluateCount(10050);
//        productSeries7.setCommonPrice(100.36);
//        productSeries7.setName("生态干鱼");
//        productSeries7.setPictures(new String[]{"statics/assets/temp/products/model7.jpg"});
//        productSeries7.setShelvesDate(new Date().getTime());
//
//        productSeriesList.add(productSeries1);
//        productSeriesList.add(productSeries2);
//        productSeriesList.add(productSeries3);
//        productSeriesList.add(productSeries4);
//        productSeriesList.add(productSeries5);
//        productSeriesList.add(productSeries6);
//        productSeriesList.add(productSeries7);
        return productSeriesList;
    }

    public ProductSeriesVo findProductSeriesById(ObjectId objectId) {
        ProductSeries productSeries=findById(objectId);
        ProductProperty queryEntity=new ProductProperty();
        queryEntity.setProductSeriesId(objectId.toString());
        List<ProductProperty> productProperties= ServiceManager.productPropertyService.findEquals(queryEntity);
//        for(ProductProperty productProperty:productProperties){
//            productProperty.getId();
//        }
//        productSeries.setProductProperties(productProperties);
        ProductSeriesVo productSeriesVo=new ProductSeriesVo();
        BeanUtils.copyProperties(productSeries,productSeriesVo);
        productSeriesVo.setProductProperties((ProductProperty[])productProperties.toArray(new ProductProperty[productProperties.size()]));
        return productSeriesVo;
    }

    public List<ProductSeries> findProductSeriesesByKeyWord(String keyWord) {
        Query query = new Query();
        Criteria cr = new Criteria();
        query.addCriteria(cr.orOperator(
                Criteria.where("name").regex(".*?" + keyWord + ".*")
                , Criteria.where("description").regex(".*?" + keyWord + ".*")
        ));
        return getMongoTemplate().find(query.limit(9), ProductSeries.class);
//        return textQuery(keyWord) ;
    }
}
