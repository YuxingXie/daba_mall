package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import com.mongodb.*;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/11/28.
 */
@Repository
public class ProductEvaluateDao extends BaseMongoDao<ProductEvaluate> {
    public ProductEvaluate findByOrderAndProductSeries(Order order, ProductSeries productSeries) {
        DBObject dbObject=new BasicDBObject();
//        DBObject orderDBObject=new BasicDBObject();
//        orderDBObject.put("$id",new ObjectId(order.getId()));
//        orderDBObject.put("$ref","order");
//        DBObject productSeriesDBObject=new BasicDBObject();
//        productSeriesDBObject.put("$id",new ObjectId(productSeries.getId()));
//        productSeriesDBObject.put("$ref","productSeries");
//        dbObject.put("order",orderDBObject);
//        dbObject.put("productSeries",productSeriesDBObject);
        DBRef orderDBRef=new DBRef("order",order.getId());
        DBRef productSeriesDBRef=new DBRef("productSeries",productSeries.getId());
        dbObject.put("order",orderDBRef);
        dbObject.put("productSeries",productSeriesDBRef);
        Query query=new BasicQuery(dbObject);
//        System.out.println(query);
        ProductEvaluate productEvaluate= getMongoTemplate().findOne(query, ProductEvaluate.class);
        return productEvaluate;
    }

    public Page<ProductEvaluate> findProductEvaluatesPageByProductSeries(ProductSeries productSeries, Integer page, int pageSize) {

        return findProductEvaluatesPageByProductSeries(productSeries,page,pageSize,true);
    }
    public Page<ProductEvaluate> findProductEvaluatesPageByProductSeries(ProductSeries productSeries, Integer page, int pageSize,boolean withParentEvaluate) {
        DBObject queryCondition=new BasicDBObject("productSeries",new DBRef("productSeries",new ObjectId(productSeries.getId())));
        if (!withParentEvaluate){
            BasicDBList dbList=new BasicDBList();
            dbList.add(new BasicDBObject("parent",new BasicDBObject("$exists",false)));
            dbList.add(new BasicDBObject("parent",new BasicDBObject("$ne",null)));
            queryCondition.put("$or",dbList);
        }
        Pageable pageable = new PageRequest(page-1, pageSize);
        Long count = getMongoTemplate().count(new BasicQuery(queryCondition),"productEvaluate");
        List<ProductEvaluate> list = getMongoTemplate().find(new BasicQuery(queryCondition).limit(pageSize).skip((page - 1) * pageSize), ProductEvaluate.class);
        if (list!=null &&list.size()>0){
            for (ProductEvaluate productEvaluate:list){
                DBObject childrenDBObject=new BasicDBObject();
                childrenDBObject.put("parent",productEvaluate);
                productEvaluate.setChildren(findAll(new BasicQuery(childrenDBObject)));
            }
        }
        Page<ProductEvaluate> _page = new PageImpl<ProductEvaluate>(list, pageable, count);
        return _page;
    }

    public Page<ProductEvaluate> findProductEvaluatesPageWithoutParentEvaluateByProductSeries(ProductSeries productSeries, Integer page, int pageSize) {
       return findProductEvaluatesPageByProductSeries(productSeries,page,pageSize,false);
    }

    public List<ProductEvaluate> findEvaluatesWithParentId(String evaluateId) {
        DBObject queryCondition=new BasicDBObject("parent",new DBRef("productEvaluate",new ObjectId(evaluateId)));
        return getMongoTemplate().find(new BasicQuery(queryCondition),ProductEvaluate.class);
    }
}