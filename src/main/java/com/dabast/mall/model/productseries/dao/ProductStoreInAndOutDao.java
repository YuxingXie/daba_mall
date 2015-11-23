package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductStore;
import com.dabast.entity.ProductStoreInAndOut;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductStoreInAndOutDao extends BaseMongoDao<ProductStoreInAndOut> {
    public List<ProductStoreInAndOut> findByProductSeries(ProductSeries productSeries) {
        if (productSeries==null) return null;
        if (productSeries.getProductStore()==null) return null;
        DBObject dbObject=new BasicDBObject();
        DBRef dbRef=new DBRef("productSeries",productSeries.getId());
        dbObject.put("productSeries",dbRef);
        return getMongoTemplate().find(new BasicQuery(dbObject),ProductStoreInAndOut.class);
    }
}
