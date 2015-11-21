package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.model.productseries.dao.OrderDao;
import com.dabast.mall.model.productseries.service.IOrderService;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/11/2.
 */
@Service
public class OrderService extends BaseEntityManager<Order> implements IOrderService{
    @Resource
    private OrderDao orderDao;
    protected EntityDao<Order> getEntityDao() {
        return this.orderDao;
    }

    @Override
    public Order findLastOrderByUserId(String userId) {
        return orderDao.findLastOrderByUserId(userId);
    }

    @Override
    public Order findOrderById(String orderId) {
        return orderDao.findOrderById(orderId) ;
    }

    @Override
    public Order insertOrder(User user) {
        return orderDao.insertOrder(user);
    }
}
