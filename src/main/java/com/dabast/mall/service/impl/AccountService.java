package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Account;
import com.dabast.mall.dao.AccountDao;
import com.dabast.mall.service.IAccountService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/11/11.
 */
@Service
public class AccountService extends BaseEntityManager<Account> implements IAccountService{
    private static Logger logger = LogManager.getLogger();
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
