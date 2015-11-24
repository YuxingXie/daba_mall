package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.TestPosts;
import com.dabast.mall.dao.TestPostsDao;
import com.dabast.mall.service.ITestPostsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TestPostsService extends BaseEntityManager<TestPosts> implements ITestPostsService {
    @Resource
    private TestPostsDao testPostsDao;
    protected EntityDao<TestPosts> getEntityDao() {
        return this.testPostsDao;
    }

    @Override
    public void insertDBRef(TestPosts testPosts) {
        testPostsDao.insertDBRef(testPosts);
    }
}
