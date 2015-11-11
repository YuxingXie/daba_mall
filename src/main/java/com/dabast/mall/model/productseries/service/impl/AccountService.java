package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Account;
import com.dabast.mall.model.productseries.dao.AccountDao;
import com.dabast.mall.model.productseries.service.IAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/11/11.
 */
@Service
public class AccountService extends BaseEntityManager<Account> implements IAccountService{
    @Resource
    private AccountDao accountDao;
    protected EntityDao<Account> getEntityDao() {
        return this.accountDao;
    }

    @Override
    public Account findAccountsByUserIdAndCardNo(String userId, String cardNo) {
        return accountDao.findAccountsByUserId(userId,cardNo);
    }
}
