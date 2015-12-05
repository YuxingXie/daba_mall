package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Order;
import com.dabast.entity.User;

/**
 * Created by Administrator on 2015/11/2.
 */
public interface IOrderService  extends IBaseEntityManager<Order> {
    Order findLastOrderByUserId(String userId);

    Order findOrderById(String orderId);

    Order insertOrder(User user);
}
