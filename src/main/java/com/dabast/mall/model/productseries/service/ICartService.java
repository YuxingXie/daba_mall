package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Cart;
import com.mongodb.DBObject;

/**
 * Created by Administrator on 2015/7/29.
 */
public interface ICartService extends IBaseEntityManager<Cart> {
    Cart getCartByUserId(String id);

    Cart findOne(DBObject condition);
}
