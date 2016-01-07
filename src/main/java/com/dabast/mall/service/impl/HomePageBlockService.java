package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.HomePageBlock;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.dao.HomePageBlockDao;
import com.dabast.mall.service.IHomePageBlockService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/12/30.
 */
@Service
public class HomePageBlockService extends BaseEntityManager<HomePageBlock> implements IHomePageBlockService {
    @Resource
    private HomePageBlockDao homePageBlockDao;
    protected EntityDao<HomePageBlock> getEntityDao() {
        return this.homePageBlockDao;
    }

    @Override
    public void removeProductSeries(ProductSeries productSeries) {
        homePageBlockDao.removeProductSeries(productSeries);
    }
}
