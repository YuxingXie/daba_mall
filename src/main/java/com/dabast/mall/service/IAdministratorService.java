package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Administrator;

/**
 * Created by Administrator on 2015/12/30.
 */
public interface IAdministratorService extends IBaseEntityManager<Administrator> {
    Administrator findByNameAndPassword(String name, String password);
}
