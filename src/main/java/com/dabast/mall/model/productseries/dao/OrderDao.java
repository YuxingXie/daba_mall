package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.Order;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao extends BaseMongoDao<Order> {
    public Order findLastOrderByUserId(String userId) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("userId",userId);
        Query query=new BasicQuery(dbObject).with(new Sort(Sort.Direction.DESC, "orderDate"));
        return getMongoTemplate().findOne(query,Order.class);
    }
}
