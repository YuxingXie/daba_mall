package com.dabast.mail.model.productseries.dao;

import com.dabast.entity.User;
import com.mongodb.WriteResult;

import java.util.List;

/**
 * Created by Administrator on 2015/5/23.
 */
public interface IUserDao {
    List<User> getAllObjects();

    void saveObject(User user);

    User getObject(String id);

    WriteResult updateObject(String id, String name);

    void deleteObject(String id);

    void createCollection();

    void dropCollection();
}
