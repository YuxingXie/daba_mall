package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductPropertyValue;
import com.dabast.entity.ProductSeries;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Repository
public class ProductPropertyDao extends BaseMongoDao<ProductProperty> {
    public List<ProductProperty> getProductPropertiesByProductSeriesId(String productSeriesId) {
        DBObject condition=new BasicDBObject();
        condition.put("productSeries",productSeriesId);
        List<ProductProperty> productProperties = findAll(condition);
        for (ProductProperty productProperty:productProperties){
            DBObject condition2=new BasicDBObject();
            condition2.put("productPropertyId",productProperty.getId());
            List<ProductPropertyValue> propertyValues= ServiceManager.productPropertyValueService.findAll(condition2);
            productProperty.setPropertyValues(propertyValues);
        }
        return productProperties;
    }

    public void removeByProductSeries(ProductSeries productSeries) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("productSeries",new DBRef("productSeries",new ObjectId(productSeries.getId())));
        List<ProductProperty> productProperties=getMongoTemplate().find(new BasicQuery(dbObject),ProductProperty.class);
        for (ProductProperty productProperty:productProperties){
            DBObject propertyValueDBObject=new BasicDBObject();
            propertyValueDBObject.put("productProperty",new DBRef("productProperty",new ObjectId(productProperty.getId())));
            getMongoTemplate().findAllAndRemove(new BasicQuery(propertyValueDBObject), ProductPropertyValue.class);
        }
        getMongoTemplate().findAllAndRemove(new BasicQuery(dbObject),ProductProperty.class);
    }
}
