package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.TestPosts;

public interface ITestPostsService extends IBaseEntityManager<TestPosts> {
    void insertDBRef(TestPosts testPosts);
}
