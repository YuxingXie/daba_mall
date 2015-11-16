package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductSubCategory;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
@Repository
public class ProductSubCategoryDao  extends BaseMongoDao<ProductSubCategory> {
    public List<ProductSubCategory> getProductSubCategoriesByCategoryId(String categoryId) {
//        ProductSubCategory productSubCategory=new ProductSubCategory();
        //TODO
//        productSubCategory.setCategoryId(categoryId);
        com.mongodb.DBRef dbRef=new com.mongodb.DBRef("productCategory", new ObjectId(categoryId));
        DBObject dbObject=new BasicDBObject();
        dbObject.put("productCategory",dbRef);
        return getMongoTemplate().find(new BasicQuery(dbObject),ProductSubCategory.class);
    }
}
