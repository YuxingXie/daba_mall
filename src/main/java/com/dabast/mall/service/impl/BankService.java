package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Bank;
import com.dabast.mall.dao.BankDao;
import com.dabast.mall.service.IBankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/12/15.
 */
@Service
public class BankService extends BaseEntityManager<Bank> implements IBankService{
    @Resource
    private BankDao bankDao;
    protected EntityDao<Bank> getEntityDao() {
        return this.bankDao;
    }

}
