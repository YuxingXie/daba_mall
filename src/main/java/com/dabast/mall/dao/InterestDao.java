package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InterestDao  extends BaseMongoDao<Interest> {
    public List<Interest> findInterestsOfUser(User user) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("user",user);
        List<Interest> interests=findAll(dbObject);
        if (interests!=null){
            for (Interest interest:interests){
                ProductSeries productSeries=interest.getProductSeries();
                if (productSeries!=null){
                    List<ProductSeriesPrice> prices= ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId());
                    productSeries.setProductSeriesPrices(prices);
                    List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                    if(inAndOuts!=null){
                        productSeries.getProductStore().setInAndOutList(inAndOuts);
                    }
                    List<ProductProperty> productProperties=ServiceManager.productPropertyService.getProductPropertiesByProductSeriesId(productSeries.getId());
                    if (productProperties!=null){
                        for (ProductProperty productProperty:productProperties){
                            List<ProductPropertyValue> values=ServiceManager.productPropertyValueService.findAll(new BasicDBObject("productProperty",productProperty));
                            productProperty.setPropertyValues(values);
                        }
                    }
                    productSeries.setProductProperties(productProperties);
                }
            }
        }
        return interests;
    }

    public boolean alreadyInterested(User user,ProductSeries productSeries) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("productSeries",productSeries);
        dbObject.put("user",user);
        List<Interest> interests=findAll(dbObject);
        if (interests==null) return false;
        if (interests.size()==0) return false;
        return true;
    }
}
