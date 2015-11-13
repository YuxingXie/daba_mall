package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.TestPosts;
import com.dabast.mall.model.productseries.dao.TestPostsDao;
import com.dabast.mall.model.productseries.service.ITestPostsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TestPostsService extends BaseEntityManager<TestPosts> implements ITestPostsService {
    @Resource
    private TestPostsDao testPostsDao;
    protected EntityDao<TestPosts> getEntityDao() {
        return this.testPostsDao;
    }

}
