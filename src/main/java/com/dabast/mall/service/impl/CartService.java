package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Cart;
import com.dabast.mall.dao.CartDao;
import com.dabast.mall.service.ICartService;
import com.mongodb.DBObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/7/29.
 */
@Service
public class CartService extends BaseEntityManager<Cart> implements ICartService {
    @Resource
    private CartDao cartDao;
    protected EntityDao<Cart> getEntityDao() {
        return this.cartDao;
    }

    @Override
    public Cart getCartByUserId(String id) {
        return cartDao.getCartByUserId(id);
    }

    @Override
    public Cart findOne(DBObject condition) {
        return cartDao.findOne(condition);
    }
}
