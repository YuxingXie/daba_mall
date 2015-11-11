package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Account;

/**
 * Created by Administrator on 2015/11/11.
 */
public interface IAccountService extends IBaseEntityManager<Account> {
    Account findAccountsByUserIdAndCardNo(String userId, String cardNo);
}
