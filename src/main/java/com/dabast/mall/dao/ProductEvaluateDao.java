package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.constant.Constant;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.data.domain.*;
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
        List<ProductEvaluate> list = getMongoTemplate().find(new BasicQuery(queryCondition).with(new Sort(Sort.Direction.ASC, "date")).limit(pageSize).skip((page - 1) * pageSize), ProductEvaluate.class);
        if (list!=null &&list.size()>0){
            for (ProductEvaluate productEvaluate:list){
                DBObject repliesDBObject=new BasicDBObject();
                repliesDBObject.put("parent", productEvaluate);
                repliesDBObject.put("type", Constant.EVALUATETYPE.REPLY);
                productEvaluate.setReplies(findAll(new BasicQuery(repliesDBObject)));
                DBObject praiseDBObject=new BasicDBObject();
                praiseDBObject.put("parent", productEvaluate);
                praiseDBObject.put("type", Constant.EVALUATETYPE.PRAISE);
                productEvaluate.setPraises(findAll(new BasicQuery(praiseDBObject)));
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
        return getMongoTemplate().find(new BasicQuery(queryCondition).with(new Sort(Sort.Direction.DESC, "date")),ProductEvaluate.class);
    }

    public boolean praised(ProductEvaluate parent, User praiseUser) {
        ProductEvaluate praise=praisedEvaluate(parent,praiseUser);
        if(praise==null) return false;
        return true;
    }

    public ProductEvaluate praisedEvaluate(ProductEvaluate parent, User praiseUser) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("parent",parent);
        dbObject.put("type",Constant.EVALUATETYPE.PRAISE);
        dbObject.put("replyUser",praiseUser);
        return getMongoTemplate().findOne(new BasicQuery(dbObject), ProductEvaluate.class);
    }
}