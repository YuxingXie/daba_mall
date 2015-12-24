package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.mongodb.*;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

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

    private User findByName(String name) {
        return findOne(new BasicDBObject("name",name));
    }
    public User findByEmail(String email) {
        return findOne(new BasicDBObject("email",email));
    }
    public User findByPhone(String phone) {
        return findOne(new BasicDBObject("phone",phone));
    }
    private User findByName(String name,boolean activated) {
        DBObject dbObject=new BasicDBObject("name",name);
        dbObject.put("activated",activated);
        return findOne(dbObject);
    }
    public User findByEmail(String email,boolean activated) {
        DBObject dbObject=new BasicDBObject("email",email);
        if (!activated){
            BasicDBList dbList=new BasicDBList();
            dbList.add(new BasicDBObject("activated",activated));
            dbList.add(new BasicDBObject("activated",new BasicDBObject("$exists",false)));
            dbObject.put("$or",dbList);
        }else {
            dbObject.put("activated",activated);
        }
        return findOne(dbObject);
    }
    public User findByPhone(String phone,boolean activated) {
        DBObject dbObject=new BasicDBObject("phone",phone);
        dbObject.put("activated",activated);
        return findOne(dbObject);
    }
    public boolean isNameUsed(String name) {
        User user=findByName(name,true);
        if (user==null) return false;
        return true;
    }

    /**
     * 用户改昵称时判断昵称是否可用
     * @param name 新昵称
     * @param userId 用户Id
     * @return
     */
    public boolean isNameUsed(String name, String userId) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("_id", new BasicDBObject("$ne",userId));
        dbObject.put("activated", true);
        dbObject.put("name", name);
        List<User> users=mongoTemplate.find(new BasicQuery(dbObject),User.class);
        return users!=null&&users.size()>0;
    }

    /**
     * 用户邮箱称时判断邮箱是否可用
     * @param email
     * @param userId
     * @return
     */
    public boolean isEmailUsed(String email, String userId) {
        DBObject dbObject=new BasicDBObject();
        dbObject.put("_id", new BasicDBObject("$ne",userId));
        dbObject.put("activated", true);
        dbObject.put("email", email);
        List<User> users=mongoTemplate.find(new BasicQuery(dbObject),User.class);
        return users!=null&&users.size()>0;
    }

    public boolean isEmailUsed(String email) {
        User user=findByEmail(email,true);
        if (user==null) return false;
//        if (user.getStatus()!=null && user.getStatus()==0) return false;
        return true;
    }

    public boolean isPhoneUsed(String phone) {
        User user=findByPhone(phone,true);
        if (user==null) return false;
        if (!user.isActivated()) return false;
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
//                        productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));

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


    public void clearCart(User user) {
        Assert.notNull(user.getId());
        Update update=new Update();
        update.set("cart", null);
        mongoTemplate.updateFirst(new BasicQuery(new BasicDBObject("_id",user.getId())), update, User.class);
    }



}
