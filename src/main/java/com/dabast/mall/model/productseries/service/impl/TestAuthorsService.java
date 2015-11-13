package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.TestAuthors;
import com.dabast.mall.model.productseries.dao.TestAuthorsDao;
import com.dabast.mall.model.productseries.service.ITestAuthorsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/11/13.
 */
@Service
public class TestAuthorsService extends BaseEntityManager<TestAuthors> implements ITestAuthorsService {
    @Resource
    private TestAuthorsDao testAuthorsDao;
    protected EntityDao<TestAuthors> getEntityDao() {
        return this.testAuthorsDao;
    }

}
