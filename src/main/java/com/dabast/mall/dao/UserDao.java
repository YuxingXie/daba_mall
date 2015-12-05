package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/5/22.
 */
@Repository
public class UserDao extends BaseMongoDao<User>  {
    //单个插入
    @Resource
    private MongoOperations mongoTemplate;

    /**
     * 获得所有的user
     */

    public List<User> getAllObjects() {
        return mongoTemplate.findAll(User.class);
    }

    /**
     * 保存一个user对象
     */

    public void saveObject(User user) {
        mongoTemplate.insert(user);
    }

    /**
     * 通过id进行查找
     */


    public User getObject(String id) {
        return mongoTemplate.findOne(new Query(Criteria.where(id).is(id)),
                User.class);
    }

    /**
     * 根据id和name进行查找
     */

    public WriteResult updateObject(String id, String name) {
        return mongoTemplate.updateFirst(
                new Query(Criteria.where(id).is(id)),
                Update.update(name, name), User.class);
    }

    /**
     * 根据id删除user
     */

    public void deleteObject(String id) {
        mongoTemplate
                .remove(new Query(Criteria.where(id).is(id)), User.class);
    }

    /**
     * 如果collection不存在则建立
     */

    public void createCollection() {
        if (!mongoTemplate.collectionExists(User.class))
            mongoTemplate.createCollection(User.class);
    }

    /**
     * 如果collection存在则删除之
     */


    public void dropCollection() {
        if (mongoTemplate.collectionExists(User.class)) {
            mongoTemplate.dropCollection(User.class);
        }
    }


    public User findByNameAndPwd(String loginName, String loginPwd) {
        User user=new User();
        user.setName(loginName);
        user.setPassword(loginPwd);//密码123
        return findOne(user);
    }


    public User findByEmail(String email) {
        User user=new User();
        user.setEmail(email);
        List<User> users=findEquals(user);
        return users==null||users.size()==0?null:users.get(0);
    }
    public User findByPhone(String phone) {
        User user=new User();
        user.setPhone(phone);
        List<User> users=findEquals(user);
        return users==null||users.size()==0?null:users.get(0);
    }
    public boolean isEmailUsed(String email) {
        User user=findByEmail(email);
        if (user==null) return false;
        if (user.getStatus()==0) return false;
        return true;
    }

    public boolean isPhoneUsed(String phone) {
        User user=findByPhone(phone);
        if (user==null) return false;
        if (user.getStatus()==0) return false;
        return true;
    }

    public User findByEmailOrPhone(String name) {
        DBObject queryCondition = new BasicDBObject();
        queryCondition = new BasicDBObject();
        BasicDBList values = new BasicDBList();
        values.add(new BasicDBObject("phone", name));
        values.add(new BasicDBObject("email", name));
        queryCondition.put("$or", values);
        Query query=new BasicQuery(queryCondition);
//        return mongoTemplate.findOne(query,User.class);
//        User user=findOne(queryCondition);
        User user=mongoTemplate.findOne(query,User.class);
        if (user!=null){
            Cart cart=user.getCart();
            if (cart!=null){
                List<ProductSelected> productSelectedList=cart.getProductSelectedList();
                if (productSelectedList!=null){
                    for (ProductSelected productSelected:productSelectedList){
                        ProductSeries productSeries= productSelected.getProductSeries();
                        if (productSeries==null) continue;
                        productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));

//                        productSelected.setProductSeries(productSeries);
                        List<String> productPropertyValueIds=productSelected.getProductPropertyValueIds();
                        if (productPropertyValueIds!=null){
                            List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
                            for (String productPropertyValueId:productPropertyValueIds){
                                ProductPropertyValue productPropertyValue=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
                                productPropertyValueList.add(productPropertyValue);
                            }
                            productSelected.setProductPropertyValueList(productPropertyValueList);
                        }
                    }
                }
            }

        }
        return user;
    }
}
