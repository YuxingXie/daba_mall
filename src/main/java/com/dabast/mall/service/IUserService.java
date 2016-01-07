package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2015/11/6.
 */
public interface IUserService extends IBaseEntityManager<User> {
    User findByEmailOrPhone(String name);

    void clearCart(User user);

    List<User> findUsersByProductSeriesInCart(ProductSeries productSeries);
}
