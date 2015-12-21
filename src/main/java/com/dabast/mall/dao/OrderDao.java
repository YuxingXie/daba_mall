package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.text.SimpleDateFormat;
import java.util.*;

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

    public void removeOrderInterval(long ago) {
        DBObject dbObject=new BasicDBObject();
        Calendar agoC=new GregorianCalendar();
        agoC.setTimeInMillis(System.currentTimeMillis() - ago);
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS ", Locale.CHINA);
        dbObject.put("orderDate", new BasicDBObject("$lt", agoC.getTime()));
        dbObject.put("orderDate",new BasicDBObject("$lt",agoC.getTime()));
        dbObject.put("payStatus",new BasicDBObject("$exists",false));
        Query query=new BasicQuery(dbObject);
        List<Order> orders=getMongoTemplate().findAllAndRemove(query, Order.class);
        for (Order order:orders){
            if (order.getUser()==null) continue;
            Notify notify=new Notify();
            notify.setContent("您的订单 "+order.getId()+" 因超过7天未使用，系统已自动删除。");
            Map<String,Object> importantStuff=new HashMap<String, Object>();
            importantStuff.put("订单商品",order.getProductSelectedList());
            notify.setTitle("系统通知");
            notify.setImportantStuffs(importantStuff);
            notify.setDate(new Date());
            notify.setToUser(order.getUser());
            ServiceManager.notifyService.insert(notify);
        }
//        System.out.println("清除了" + orders.size() + "条订单");
    }

}
