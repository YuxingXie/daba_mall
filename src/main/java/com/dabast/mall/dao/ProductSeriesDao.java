package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.*;
import org.bson.types.ObjectId;
import org.springframework.data.domain.*;
import org.springframework.data.mongodb.core.aggregation.*;
import org.springframework.data.mongodb.core.aggregation.AggregationOptions;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

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


    public List<ProductSeries> getAll() {
        return getAll(null);
    }
    public List<ProductSeries> getAll(Integer limit) {
        List<ProductSeries> productSeriesList=findAll(limit);
        getStoresAndPrices(productSeriesList);
        return productSeriesList;
    }
    public void getStoresAndPrices(List<ProductSeries> productSeriesList) {
//        for (ProductSeries productSeries:productSeriesList){
//            getStoreAndPrice(productSeries);
//        }
    }
    public void getStoresAndPricesAndEvaluates(List<ProductSeries> productSeriesList) {
        for (ProductSeries productSeries:productSeriesList){
//            getStoreAndPrice(productSeries);
            List<ProductEvaluate> productEvaluateList=ServiceManager.productEvaluateService.findAll(new BasicDBObject("productSeries",productSeries));
            productSeries.setProductEvaluateList(productEvaluateList);
        }
    }


//    public void getStoreAndPrice(ProductSeries productSeries) {
//        List<ProductSeriesPrice> productSeriesPrices = getProductSeriesPrices(productSeries);
//        productSeries.setProductSeriesPrices(productSeriesPrices);
//        ProductStore store=productSeries.getProductStore();
//        if (store!=null){
//            productSeries.getProductStore().setInAndOutList(ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries));
//        }
//    }

//    public List<ProductSeriesPrice> getProductSeriesPrices(ProductSeries productSeries) {
//        DBRef dbRef=new DBRef("productSeries",new ObjectId(productSeries.getId()));
//        DBObject dbObject=new BasicDBObject();
//        dbObject.put("productSeries",dbRef);
//        return ServiceManager.productSeriesPriceService.findAll(dbObject);
//    }
    public ProductSeries findProductSeriesByIdButEvaluate(ObjectId objectId,boolean ignoreEvaluate) {

        ProductSeries productSeries=findById(objectId);
        DBObject productPropertyDbObject=new BasicDBObject();
        productPropertyDbObject.put("productSeries", new DBRef("productSeries", objectId));
        List<ProductProperty> productProperties= ServiceManager.productPropertyService.findAll(productPropertyDbObject);
        for (ProductProperty productProperty :productProperties){
            DBObject cond=new BasicDBObject();
            cond.put("productProperty", new DBRef("productProperty",productProperty.getId()));
            List<ProductPropertyValue> propertyValues=ServiceManager.productPropertyValueService.findAll(cond);
            productProperty.setPropertyValues(propertyValues);
        }
        productSeries.setProductProperties(productProperties);
//        productSeries.setProductSeriesPrices(getProductSeriesPrices(productSeries));
//        if (productSeries.getProductStore()!=null){
//            List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
//            productSeries.getProductStore().setInAndOutList(inAndOuts);
//        }
       if (!ignoreEvaluate){
           List<ProductEvaluate> productEvaluateList=ServiceManager.productEvaluateService.findAll(new BasicDBObject("productSeries",productSeries));
           productSeries.setProductEvaluateList(productEvaluateList);
       }
        return productSeries;
    }
    public ProductSeries findProductSeriesById(ObjectId objectId) {
        return findProductSeriesByIdButEvaluate(objectId,false);
    }
    public ProductSeries findProductSeriesById(String id) {
        return findProductSeriesById(new ObjectId(id));
    }
    public Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord,int currentPage,int pageSize) {
//        Criteria criteria = new Criteria().orOperator(Criteria.where("name").regex(".*?" + keyWord + ".*"), Criteria.where("description").regex(".*?" + keyWord + ".*"));
        Pattern pattern = Pattern.compile(".*?" + keyWord + ".*");
        DBObject queryCondition=new BasicDBObject();
        BasicDBList values = new BasicDBList();
        values.add(new BasicDBObject("name", pattern));
        values.add(new BasicDBObject("description", pattern));
        queryCondition.put("$or", values);
        DB db = getMongoTemplate().getDb();
        DBCollection collection = db.getCollection("productSeries");
        Pageable pageable = new PageRequest(currentPage-1, pageSize);
        Long count = collection.count(queryCondition);
        List<ProductSeries> list = getMongoTemplate().find(new BasicQuery(queryCondition).limit(pageSize).skip((currentPage - 1) * pageSize), ProductSeries.class);
        getStoresAndPricesAndEvaluates(list);
        Page<ProductSeries> page = new PageImpl<ProductSeries>(list, pageable, count);
        return page;
    }
    public Page<ProductSeries> findProductSeriesPageByProductSubCategory(ProductSubCategory productSubCategory,int currentPage,int pageSize) {
        DBObject queryCondition=new BasicDBObject();
        queryCondition.put("productSubCategory",productSubCategory);
        Pageable pageable = new PageRequest(currentPage-1, pageSize);
        Long count = getMongoTemplate().count(new BasicQuery(queryCondition), ProductSeries.class);
        List<ProductSeries> list = getMongoTemplate().find(new BasicQuery(queryCondition).limit(pageSize).skip((currentPage - 1) * pageSize), ProductSeries.class);
        getStoresAndPricesAndEvaluates(list);
        Page<ProductSeries> page = new PageImpl<ProductSeries>(list, pageable, count);
        return page;
    }
    public List<ProductSeries> findProductSeriesAllRef(DBObject dbObject) {
            List<ProductSeries> list = getMongoTemplate().find(new BasicQuery(dbObject), ProductSeries.class);
         getStoresAndPricesAndEvaluates(list);
        return list;
    }

    public List<ProductSeries> getLowPrices(int count) {
//        DBObject productSeriesPriceDBObject=new BasicDBObject();
//        productSeriesPriceDBObject.put("prevPrice",new BasicDBObject("$exists",true));
//        BasicDBList dbList=new BasicDBList();
//        DBObject cond1=new BasicDBObject();
//        Date now=new Date();
//        cond1.put("endDate",null);
//        cond1.put("beginDate",new BasicDBObject("$lt",now));
//        DBObject cond2=new BasicDBObject();
//        cond2.put("endDate",new BasicDBObject("$gt",now));
//        cond2.put("beginDate", new BasicDBObject("$lt", now));
//        dbList.add(cond1);
//        dbList.add(cond2);
////        DBObject orDBObject=new BasicDBObject("$or",dbList);
//        productSeriesPriceDBObject.put("$or",dbList);
////        String queryString=" {\"prevPrice\":{\"$exists\":true},\"$or\":[{\"endDate\" : null,\"beginDate\":{\"$lt\": new Date()}},{\"endDate\": {\"$gt\" : new Date()},\"beginDate\":{\"$lt\": new Date()}}]}";
////        Query query=new BasicQuery(queryString);
////        System.out.println(new BasicQuery(productSeriesPriceDBObject));
//        List<ProductSeriesPrice> productSeriesPriceList=ServiceManager.productSeriesPriceService.findAll(productSeriesPriceDBObject);
//        List<ProductSeries> list=new ArrayList<ProductSeries>();
//        int i=0;
//        for (ProductSeriesPrice productSeriesPrice:productSeriesPriceList){
//            if (productSeriesPrice==null) continue;
//            if (productSeriesPrice.getPrice()==null) continue;
//            ProductSeriesPrice prevPrice=productSeriesPrice.getPrevPrice();
//            if (prevPrice==null) continue;
//            ProductSeries productSeries=productSeriesPrice.getProductSeries();
//            if (productSeries==null) continue;
//            if (prevPrice.getPrice()==null) continue;
//            if (productSeriesPrice.getPrice()<prevPrice.getPrice()){
//                list.add(productSeries);
//                i++;
//                if (i+1>=count) break;
//            }
//        }
//        return list.size()==0?null:list;
        return null;
    }

    public List<ProductSeries> getNewProducts(int count) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("newProduct",true);
        List<ProductSeries> productSeriesList=getMongoTemplate().find(new BasicQuery(dbObject).limit(count), ProductSeries.class);
        getStoresAndPrices(productSeriesList);
        return productSeriesList;
    }

    public List<ProductSeries> getHotSell(int count) {
        //可规定热卖商品数量

        return getAll(count);
    }

    public Page<ProductSeries> orderByPrice(ProductSubCategory subCategory,int currentPage,int pageSize){
        //1:投射
        AggregationOperation project=Aggregation.project("productSeries","price");
        AggregationOperation match = Aggregation.match(Criteria.where("service").is("EFT").and("source").is("MARKUP"));
        AggregationOperation group = Aggregation.group("card_acceptor").sum("amount").as("amount_sum").count().as("tran_count");
        AggregationOperation sort = Aggregation.sort(new Sort(Sort.Direction.ASC,"price"));
        Aggregation aggregation = Aggregation.newAggregation(match,project, group,sort);
        AggregationResults<ProductSeries> result = getMongoTemplate().aggregate(aggregation, "eft_transactions", ProductSeries.class);
        return null;
    }

}
