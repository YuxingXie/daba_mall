package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
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
        return getMongoTemplate().findOne(query,Order.class);
    }

    public Order findOrderById(String orderId) {
        Order order=findById(orderId);
        List<ProductSelected> productSelectedList=order.getProductSelectedList();
        if (productSelectedList!=null){
            for (ProductSelected productSelected:productSelectedList){
//                ProductSeries productSeries= ServiceManager.productSeriesService.findById(productSelected.getProductSeriesId());
                ProductSeries productSeries= productSelected.getProductSeries();
                productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));
//                productSelected.setProductSeries(productSeries);
                List<String> productPropertyValueIds=productSelected.getProductPropertyValueIds();
                if (productPropertyValueIds!=null){
                    List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
                    for (String productPropertyValueId:productPropertyValueIds){
                        ProductPropertyValue productPropertyValue=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
                        productPropertyValueList.add(productPropertyValue);
                    }
                    productSelected.setProductPropertyValueList(productPropertyValueList);
                }
            }
        }
        return order;
    }

    public Order insertOrder(User user) {
        {
            Assert.notNull(user.getCart());
            Order order=new Order();
            order.setUser(user);
            order.setOrderDate(new Date());
            order.setPayStatus("n");
            List<ProductSelected> productSelectedList=user.getCart().getProductSelectedList();
            Assert.notNull(productSelectedList);
            order.setProductSelectedList(productSelectedList);
            getMongoTemplate().insert(order);
            return order;
        }
    }
}
