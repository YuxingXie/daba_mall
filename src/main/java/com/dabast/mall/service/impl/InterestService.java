package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Interest;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;
import com.dabast.mall.dao.InterestDao;
import com.dabast.mall.service.IInterestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/11/26.
 */
@Service
public class InterestService  extends BaseEntityManager<Interest> implements IInterestService {
    @Resource
    private InterestDao interestDao;
    protected EntityDao< Interest> getEntityDao() {
        return this. interestDao;
    }

    @Override
    public List<Interest> findInterestsOfUser(User user) {
        return interestDao.findInterestsOfUser(user);
    }

    @Override
    public boolean alreadyInterested(User user, ProductSeries productSeries) {
        return interestDao.alreadyInterested(user,productSeries);
    }

    @Override
    public List<Interest> findByUserAndProductSeries(User user, ProductSeries productSeries) {
        return interestDao.findByUserAndProductSeries(user, productSeries);
    }

    @Override
    public List<Interest> findByProductSeries(ProductSeries productSeries) {
        return interestDao.findByProductSeries(productSeries);
    }
}
