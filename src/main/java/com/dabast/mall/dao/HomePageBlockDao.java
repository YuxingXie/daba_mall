package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.HomePageBlock;
import com.dabast.entity.ProductSeries;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/12/30.
 */
@Repository
public class HomePageBlockDao extends BaseMongoDao<HomePageBlock> {
    private static Logger logger = LogManager.getLogger();
    public void removeProductSeries(ProductSeries productSeries) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("productSeriesList",new DBRef("productSeries",new ObjectId(productSeries.getId())));
        List<HomePageBlock> homePageBlocks=getMongoTemplate().find(new BasicQuery(dbObject),HomePageBlock.class);
        for (HomePageBlock homePageBlock:homePageBlocks){
            List<ProductSeries> newProductSeriesList=new ArrayList<ProductSeries>();
            List<ProductSeries> productSeriesList=homePageBlock.getProductSeriesList();
            for (ProductSeries blockProductSeries:productSeriesList){
                if (!blockProductSeries.getId().equalsIgnoreCase(productSeries.getId())){
                    newProductSeriesList.add(blockProductSeries);
                }
            }
            HomePageBlock updateHomePageBlock=new HomePageBlock();
            updateHomePageBlock.setId(homePageBlock.getId());
            updateHomePageBlock.setProductSeriesList(newProductSeriesList);
            upsert(updateHomePageBlock);
        }
    }
}
