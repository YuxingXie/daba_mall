package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2015/11/2.
 */
public interface IOrderService  extends IBaseEntityManager<Order> {
    Order findLastOrderByUserId(String userId);

    Order findOrderById(String orderId);
    void removeOrderInterval(long ago);

    void removeOrderById(String id);

    long findUnHandlerOrdersCount();

    List<Order> findUnHandlerOrders();

    List<Order> findOrdersByProductSeries(ProductSeries productSeries);

    long findOrdersCountByProductSeries(ProductSeries productSeries);

    List<Order> findReturnExchangeOrders();
//    void insertOrder(User user);
}
