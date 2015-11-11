package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.Account;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/11/11.
 */
@Repository
public class AccountDao extends BaseMongoDao<Account> {
    public Account findAccountsByUserId(String userId, String cardNo) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("userId",userId);
        dbObject.put("cardNo",cardNo);
        return getMongoTemplate().findOne(new BasicQuery(dbObject),Account.class);
    }
}
