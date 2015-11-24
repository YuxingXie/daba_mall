package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.User;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/11/6.
 */
@Service
public class UserService extends BaseEntityManager<User> implements IUserService {
    @Resource
    private UserDao userDao;
    protected EntityDao<User> getEntityDao() {
        return this.userDao;
    }
}