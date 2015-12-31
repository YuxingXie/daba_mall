package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Order;
import com.dabast.entity.User;
import com.dabast.mall.dao.OrderDao;
import com.dabast.mall.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    public void removeOrderInterval(long ago) {
        orderDao.removeOrderInterval(ago);
    }

    @Override
    public void removeOrderById(String id) {
        orderDao.removeOrderById(id);
    }

    @Override
    public long findUnHandlerOrdersCount() {
        return orderDao.findUnHandlerOrdersCount();
    }

    @Override
    public List<Order> findUnHandlerOrders() {
        return orderDao.findUnHandlerOrders();
    }

}
