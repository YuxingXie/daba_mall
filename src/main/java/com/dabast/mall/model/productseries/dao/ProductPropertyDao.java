package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductPropertyValue;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
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
}
