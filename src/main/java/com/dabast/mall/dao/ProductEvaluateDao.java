package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

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
        System.out.println(query);
        ProductEvaluate productEvaluate= getMongoTemplate().findOne(query, ProductEvaluate.class);
        return productEvaluate;
    }
}
