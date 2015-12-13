package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class OrderDao extends BaseMongoDao<Order> {
    public Order findLastOrderByUserId(String userId) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("userId",userId);
        Query query=new BasicQuery(dbObject).with(new Sort(Sort.Direction.DESC, "orderDate"));
        Order order= getMongoTemplate().findOne(query,Order.class);
        getDBRefs(order);
        return order;
    }

    public Order findOrderById(String orderId) {
        Order order=findById(orderId);
        getDBRefs(order);
        return order;
    }

    public void getDBRefs(Order order) {
        if (order==null) return;
        List<ProductSelected> productSelectedList=order.getProductSelectedList();
//        List<ProductSeries> productSeriesList=new ArrayList<ProductSeries>();
        if (productSelectedList!=null){
            for (ProductSelected productSelected:productSelectedList){
                ProductSeries productSeries= productSelected.getProductSeries();
//
               ProductEvaluate productEvaluate= ServiceManager.productEvaluateService.findByOrderAndProductSeries(order, productSeries);
               productSelected.setProductEvaluate(productEvaluate);
                productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));
                List<String> productPropertyValueIds=productSelected.getProductPropertyValueIds();
                if (productPropertyValueIds!=null){
                    List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
                    for (String productPropertyValueId:productPropertyValueIds){
                        ProductPropertyValue productPropertyValue=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
                        productPropertyValueList.add(productPropertyValue);
                    }
                    productSelected.setProductPropertyValueList(productPropertyValueList);
                }
                if (productSeries.getProductStore()!=null){
                    List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                    productSeries.getProductStore().setInAndOutList(inAndOuts);
                }
            }
        }
    }

//    public void insertOrder(User user) {
//
//        Assert.notNull(user.getCart());
//
//        getMongoTemplate().insert(order);
////        return order;
//
//    }
}
