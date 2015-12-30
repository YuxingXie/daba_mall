package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.Administrator;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;


@Repository
public class AdministratorDao  extends BaseMongoDao<Administrator> {
    public Administrator findByNameAndPassword(String name, String password) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("name",name);
        dbObject.put("password",password);
        return getMongoTemplate().findOne(new BasicQuery(dbObject),Administrator.class);
    }
}
