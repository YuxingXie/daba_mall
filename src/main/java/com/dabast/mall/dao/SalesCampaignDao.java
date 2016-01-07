package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductSeriesRate;
import com.dabast.entity.SalesCampaign;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/1/7.
 */
@Repository
public class SalesCampaignDao extends BaseMongoDao<SalesCampaign> {
    public void removeProductSeries(ProductSeries productSeries) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("productSeriesRates.productSeries",new DBRef("productSeries",new ObjectId(productSeries.getId())));
        List<SalesCampaign> salesCampaignList=getMongoTemplate().find(new BasicQuery(dbObject),SalesCampaign.class);
        for (SalesCampaign salesCampaign:salesCampaignList){
            List<ProductSeriesRate> newRates=new ArrayList<ProductSeriesRate>();
            for(ProductSeriesRate rate:salesCampaign.getProductSeriesRates()){
                ProductSeries rateProductSeries=rate.getProductSeries();
                if (!rateProductSeries.getId().equalsIgnoreCase(productSeries.getId())){
                    newRates.add(rate);
                }
            }
            SalesCampaign updateSalesCampaign=new SalesCampaign();
            updateSalesCampaign.setId(salesCampaign.getId());
            updateSalesCampaign.setProductSeriesRates(newRates);
            upsert(updateSalesCampaign);
        }
    }
}
