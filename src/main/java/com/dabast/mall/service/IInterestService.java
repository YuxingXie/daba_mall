package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Interest;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2015/11/26.
 */
public interface  IInterestService extends IBaseEntityManager<Interest> {
    List<Interest> findInterestsOfUser(User user);

    boolean alreadyInterested(User user, ProductSeries productSeries);

    List<Interest> findByUserAndProductSeries(User user, ProductSeries productSeries);
}
