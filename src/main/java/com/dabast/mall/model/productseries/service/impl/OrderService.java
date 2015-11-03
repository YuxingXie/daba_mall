package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Order;
import com.dabast.mall.model.productseries.dao.OrderDao;
import com.dabast.mall.model.productseries.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
