package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.User;
import com.mongodb.WriteResult;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/5/22.
 */
@Repository
public class UserDao extends BaseMongoDao<User> implements IUserDao {
    //单个插入
    @Resource
    private MongoOperations mongoTemplate;

    /**
     * 获得所有的user
     */
    @Override
    public List<User> getAllObjects() {
        return mongoTemplate.findAll(User.class);
    }

    /**
     * 保存一个user对象
     */
    @Override
    public void saveObject(User user) {
        mongoTemplate.insert(user);
    }

    /**
     * 通过id进行查找
     */

    @Override
    public User getObject(String id) {
        return mongoTemplate.findOne(new Query(Criteria.where(id).is(id)),
                User.class);
    }

    /**
     * 根据id和name进行查找
     */
    @Override
    public WriteResult updateObject(String id, String name) {
        return mongoTemplate.updateFirst(
                new Query(Criteria.where(id).is(id)),
                Update.update(name, name), User.class);
    }

    /**
     * 根据id删除user
     */
    @Override
    public void deleteObject(String id) {
        mongoTemplate
                .remove(new Query(Criteria.where(id).is(id)), User.class);
    }

    /**
     * 如果collection不存在则建立
     */
    @Override
    public void createCollection() {
        if (!mongoTemplate.collectionExists(User.class))
            mongoTemplate.createCollection(User.class);
    }

    /**
     * 如果collection存在则删除之
     */

    @Override
    public void dropCollection() {
        if (mongoTemplate.collectionExists(User.class)) {
            mongoTemplate.dropCollection(User.class);
        }
    }

    @Override
    public User findByNameAndPwd(String loginName, String loginPwd) {
        User user=new User();
        user.setName(loginName);
        user.setPassword("202cb962ac59075b964b07152d234b70");//密码123
        user.setSex("男");
        user.setHeight(187);
//        return findEquals(user).get(0);
        return user;
    }

    @Override
    public User findByEmail(String email) {
        User user=new User();
        user.setEmail(email);
        return findEquals(user).get(0);
    }
}
