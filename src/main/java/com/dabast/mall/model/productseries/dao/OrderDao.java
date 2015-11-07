package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductPropertyValue;
import com.dabast.entity.ProductSelected;
import com.dabast.entity.ProductSeries;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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
                ProductSeries productSeries= ServiceManager.productSeriesService.findById(productSelected.getProductSeriesId());
                productSelected.setProductSeries(productSeries);
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
}
