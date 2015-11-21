package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductSeriesPrice;
import com.mongodb.BasicDBObject;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/11/16.
 */
@Repository
public class ProductSeriesPriceDao  extends BaseMongoDao<ProductSeriesPrice> {
    public List<ProductSeriesPrice> findByProductSeriesId(String id) {
        DBRef dbRef=new DBRef("productSeries",new ObjectId(id));
        Query query=new BasicQuery(new BasicDBObject("productSeries",dbRef));
        return getMongoTemplate().find(query,ProductSeriesPrice.class);

    }
}
