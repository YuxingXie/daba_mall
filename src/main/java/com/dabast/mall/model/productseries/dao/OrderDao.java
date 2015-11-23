package com.dabast.mall.model.productseries.dao;

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
            order.setUserId(user.getId());
            order.setUser(user);
            order.setOrderDate(new Date());
            order.setPayStatus("n");
//            DBObject orderObject=new BasicDBObject();
//            orderObject.put("user",user);
//            orderObject.put("orderDate",new Date());
//            orderObject.put("payStatus","n");
            List<ProductSelected> productSelectedList=user.getCart().getProductSelectedList();
//            BasicDBList dbProductSelectedList=new BasicDBList();
            for (ProductSelected productSelected:productSelectedList){
//                DBObject productSelectedDbObject=new BasicDBObject();
//                DBRef dbRef=new DBRef("productSeries",productSelected.getProductSeriesId());
//                productSelectedDbObject.put("productSeries",dbRef);
//                productSelectedDbObject.put("amount",productSelected.getRemain());
                ProductSeriesPrice currentPrice =ServiceManager.productSeriesPriceService.findCurrentPriceByProductSeriesId(productSelected.getProductSeriesId());
//                productSelectedDbObject.put("orderPrice",null);
//                dbProductSelectedList.add(productSelectedDbObject);
                ProductSeries productSeries=new ProductSeries();
                productSeries.setId(productSelected.getProductSeriesId());
                productSelected.setProductSeries(productSeries);
                productSelected.setOrderPrice(currentPrice);
            }
            getMongoTemplate().insert(order);
            return order;
        }
    }
}
