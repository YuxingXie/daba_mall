package com.dabast.common.base;

import com.dabast.common.util.MongoDocumentUtil;
import com.dabast.common.util.ReflectUtil;
import com.mongodb.*;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import org.bson.types.ObjectId;
import org.springframework.beans.BeanUtils;
import org.springframework.data.annotation.Id;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.*;
import org.springframework.data.mongodb.core.query.*;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.lang.reflect.*;
import java.util.*;

/**
 * Created by Administrator on 2015/5/22.
 */
public abstract class BaseMongoDao<E> implements EntityDao<E> {
    @Resource
    private MongoTemplate mongoTemplate;
    private Class<E> collectionClass;

    public BaseMongoDao() {
        Class typeCls = getClass();
        Type genType = typeCls.getGenericSuperclass();
        while (true) {
            if (!(genType instanceof ParameterizedType)) {
                typeCls = typeCls.getSuperclass();
                genType = typeCls.getGenericSuperclass();
            } else {
                break;
            }
        }
        this.collectionClass = (Class<E>) ((ParameterizedType) genType).getActualTypeArguments()[0];
    }

    public MongoTemplate getMongoTemplate() {
        return mongoTemplate;
    }
    public String saveFile(String fileName,byte[] file){
        GridFS fs=new GridFS(mongoTemplate.getDb());
        GridFSInputFile fsInputFile=fs.createFile(file);
        fsInputFile.put("uploadDate",new Date());
        fsInputFile.put("filename",fileName);
        fsInputFile.save();
        return  fsInputFile.get("_id")==null?null :fsInputFile.get("_id").toString();
    }
    public int upsert(E queryEntity,E updateEntity){
        Query query=getEqualsQuery(queryEntity);
        System.out.println("update:"+getEqualsQuery(updateEntity).toString());
        List<E> list=mongoTemplate.find(query,collectionClass);
        Assert.isTrue(list==null ||list.size()<=1);
        if (list==null||list.size()==0) {
            mongoTemplate.insert(updateEntity);
            return 1;
        }
        else{
            E e=list.get(0);
            BeanUtils.copyProperties(updateEntity,e);
           return mongoTemplate.updateFirst(query, getUpdateFromEntity(updateEntity), collectionClass).getN();

        }

//        Update update=getUpdateFromEntity(updateEntity);
//        return  mongoTemplate.upsert(query,update,collectionClass).getN();
    }

    public GridFSDBFile findFileById(String id){
        GridFS fs=new GridFS(mongoTemplate.getDb());
       GridFSDBFile file=fs.find(new ObjectId(id));
        return file;
    }
    @Override
    public E insert(E e) {
//        System.out.println("invoke insert method......");
        mongoTemplate.insert(e);
        return  e;
    }
    @Override
    public E findById(String id){
        if (id==null) return null;
        return findById(new ObjectId(id));
    }
    @Override
    public List<E> findEquals(E e) {
        Query query = getEqualsQuery(e);
        if(!collectionExists()) return null;
        if (query == null) return findAll();
        return mongoTemplate.find(query, collectionClass);
    }
    @Override
    public List<E> textQuery(String  keyWord) {
        Query textQuery=new TextQuery(keyWord);
        return mongoTemplate.findAll(collectionClass);
//        return mongoTemplate.find(textQuery,collectionClass);
    }

    public List<E> findAll() {
        DB db=mongoTemplate.getDb();
        DBCollection collection=db.getCollection(getCollectionName());
        DBCursor cur = collection.find();
//        BasicDBList basicDBList=new BasicDBList();
        List<E> list=new ArrayList<E>();
        while (cur.hasNext()) {
            DBObject object=cur.next();
            System.out.println(object.get("_id"));
//            basicDBList.add(cur.next());
            list.add(dbObject2EntityBean(object));
        }
//        System.out.println(cur.count());
//        System.out.println(cur.getCursorId());
//        System.out.println(basicDBList.size());
//       for (Object dbObject:basicDBList){
//           System.out.println(dbObject);
//       }
//        System.out.println(JSON.serialize(cur));
//        return mongoTemplate.findAll(collectionClass);
        return list;
    }

    public E findById(ObjectId id) {
        //for test

        return mongoTemplate.findById(id, collectionClass);
    }
    @Override
    public E findOne(E condition) {
        return mongoTemplate.findOne(getEqualsQuery(condition), collectionClass);
    }

    @Override
    public List<E> findRange(String key, Object min, Object max) {
        if (!MongoDocumentUtil.isKeyExists(collectionClass, key)) return null;
        Criteria criteria = Criteria.where(key);
        if (min != null) criteria.gte(min);
        if (max != null) criteria.lte(max);
        Query query = Query.query(criteria);
        return mongoTemplate.find(query, collectionClass);
    }

    @Override
    public List<E> findNotEquals(E e) {
        if (e == null) return findAll();
        Query query = getNotEqualsQuery(e);
//        System.out.println(query);
        CommandResult commandResult=mongoTemplate.executeCommand("");
        commandResult.toString();
        return mongoTemplate.find(query, collectionClass);
    }


    public List<E> findKeyIn(String key, Collection collection) {
        Criteria criteria = Criteria.where(key).in(collection);
        Query query = Query.query(criteria);
        return mongoTemplate.find(query, collectionClass);
    }

    @Override
    public List<E> findKeyNotIn(String key, Collection collection) {
        Criteria criteria = Criteria.where(key).nin(collection);
        Query query = Query.query(criteria);
//        System.out.println(query);

        return mongoTemplate.find(query, collectionClass);
    }

    @Override
    public List<E> findKeyIsNull(String key) {
        Criteria criteria = Criteria.where(key).is(null);
        Query query = Query.query(criteria);
//        System.out.println(query);
        return mongoTemplate.find(query, collectionClass);
    }

    public List<E> findByRegex(String key, String regex) {
        Criteria criteria = Criteria.where(key).regex(regex);
        Query query = Query.query(criteria);
//        System.out.println(query);
        return mongoTemplate.find(query, collectionClass);
    }

    @Override
    public List<E> findInArray(String key, Object[] values) {
        Criteria criteria = Criteria.where(key).all(values);
        Query query = Query.query(criteria);
//        System.out.println(query);
        return mongoTemplate.find(query, collectionClass);
    }

    @Override
    public List<E> findRef(String refKey, Object value) {
//        Criteria criteria=Criteria.where("address.country").is("China").and("address.provence").is("Hunan");
        Criteria criteria = Criteria.where("address").elemMatch(Criteria.where("country").is("China").and("provence").is("Hunan"));
        Query query = Query.query(criteria);
//        System.out.println(query);
        //why result is empty???
        return mongoTemplate.find(query, collectionClass);
    }

    public Page<E> findPage(int pageIndex) {
        Criteria criteria = new Criteria();
        Query query = Query.query(criteria);
        Long count = mongoTemplate.count(query, collectionClass);
        int pageSize = 5;
        Pageable pageable = new PageRequest(pageIndex, pageSize);
        query = query.limit(pageSize).skip((pageIndex - 1) * pageSize);
//        System.out.println(query);
        List<E> list = mongoTemplate.find(query, collectionClass);
        Page<E> page = new PageImpl<E>(list, pageable, count);
        return page;
    }
    @Deprecated
    public E update(E e) {
        String id = MongoDocumentUtil.getId(e);
        if (null == id || "".equals(id.trim())) {
        //如果主键为空,则不进行修改
            return null;
        }
        E qe=null;
        try {
            qe=collectionClass.newInstance();
            ReflectUtil.invokeSetter(qe, "id",id);
        } catch (InstantiationException e1) {
            e1.printStackTrace();
        } catch (IllegalAccessException e1) {
            e1.printStackTrace();
        }
        Update update = getUpdateFromEntity(e);
        mongoTemplate.updateFirst(getEqualsQuery(qe),update,collectionClass);
        return e;
    }
    public CommandResult runCommand(String command){

        CommandResult commandResult= mongoTemplate.executeCommand(command);
        return commandResult;
    }

    @Override
    public Object find(Object parse) {
        Query query=Query.query(Criteria.where("中国名").is("谢宇星"));
        DBObject dbObject=query.getQueryObject();
        DBCollection collection= getDBCollection();

        DBCursor cursor= collection.find(dbObject);
        while (cursor.hasNext()){
//            System.out.println(cursor.next());
        }
    return null;
    }
    private String getCollectionName(){
        Document document=collectionClass.getAnnotation(Document.class);
        if (document==null) return collectionClass.getSimpleName();
        return document.collection();
    }
    private DBCollection getDBCollection(){
        return mongoTemplate.getDb().getCollection(getCollectionName());
    }
    private E dbObject2EntityBean(DBObject dbObject) {
        //TODO
        E e=null;
        try {
            e=collectionClass.newInstance();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        }
        for (java.lang.reflect.Field field:collectionClass.getDeclaredFields()){
            if (!field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)) continue;
            String setterMethodName=ReflectUtil.getSetterMethodName(field.getName());
            Class fieldType=field.getType();
            //基本数据类型可以这样做，如果是复杂数据类型呢?
            Object fieldValue= dbObject.get(field.getName());
            if (fieldType.isPrimitive()||ReflectUtil.isWrapClass(fieldType)||fieldType==String.class){

            }
            try {
                Method setter= collectionClass.getDeclaredMethod(setterMethodName, fieldType);
                setter.invoke(e,fieldValue);
            } catch (NoSuchMethodException e1) {
                e1.printStackTrace();
            } catch (InvocationTargetException e1) {
                e1.printStackTrace();
            } catch (IllegalAccessException e1) {
                e1.printStackTrace();
            }

        }
        return e;
    }
    private List<E> writeResult2List(WriteResult writeResult){
        DBCursor cursor = getDBCollection().find();
        try {
            List<E> result = new ArrayList<E>();
            while (cursor.hasNext()) {
                DBObject object = cursor.next();
                result.add(dbObject2EntityBean(object));
            }
            return result;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }
    private boolean collectionExists(){
        return mongoTemplate.getDb().collectionExists(getCollectionName());
    }
    private Query getEqualsQuery(E e) {
        if (e==null) return null;
        Query query = null;
        Criteria criteria = null;
        boolean firstCriteriaAdded = false;
        for (java.lang.reflect.Field field : collectionClass.getDeclaredFields()) {
            if (!field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)&& !field.isAnnotationPresent(Id.class)) continue;
            String fieldName = field.getName();
            Object fieldValue = ReflectUtil.getValue(e, fieldName);
            if (fieldValue == null) continue;
            if (fieldValue.toString().trim().equals("")) continue;
            if (field.isAnnotationPresent(Id.class)){
                String key = "_id";
                criteria = null;
                criteria = Criteria.where(key).is(fieldValue);
                break;
            }else{
                String key = field.getAnnotation(org.springframework.data.mongodb.core.mapping.Field.class).value();
                if (key == null || key.equals("")) key = fieldName;
                if (firstCriteriaAdded == false) {
                    criteria = Criteria.where(key).is(fieldValue);
                    firstCriteriaAdded = true;
                } else {
                    criteria.and(key).is(fieldValue);
                }
            }

        }
        if (criteria == null) return null;
        query = Query.query(criteria);
//        System.out.println(query);
        return query;
    }
    private Query getNotEqualsQuery(E e) {
        Query query = null;
        Criteria criteria = null;
        boolean firstCriteriaAdded = false;
        for (java.lang.reflect.Field field : collectionClass.getDeclaredFields()) {
            if (!field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)) continue;
            String fieldName = field.getName();

            Object fieldValue = ReflectUtil.getValue(e, fieldName);
            if (fieldValue == null) continue;
            if (fieldValue.toString().trim().equals("")) continue;
            String key = field.getAnnotation(org.springframework.data.mongodb.core.mapping.Field.class).value();
            if (key == null || key.equals("")) key = fieldName;
            if (firstCriteriaAdded == false) {
                criteria = Criteria.where(key).ne(fieldValue);
                firstCriteriaAdded = true;
            } else {
                criteria.and(key).ne(fieldValue);
            }
        }
        if (criteria == null) return null;
        query = Query.query(criteria);
//        System.out.println(query);
        return query;

    }
    private Update getUpdateFromEntity(E e) {
        Update update=new Update();
        for (java.lang.reflect.Field field:collectionClass.getDeclaredFields()){
            if (!field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)&&!field.isAnnotationPresent(Id.class)) continue;
            String setterMethodName=ReflectUtil.getSetterMethodName(field.getName());
            Class fieldType=field.getType();
            try {
                field.setAccessible(true);
                Object fieldValue= field.get(e);
                if (fieldValue==null) continue;
                if (field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)){
                    org.springframework.data.mongodb.core.mapping.Field docField=field.getAnnotation(org.springframework.data.mongodb.core.mapping.Field.class);
                    String fieldName=docField.value()==null||docField.value().equals("")?field.getName():docField.value();
                    update.set(fieldName,fieldValue);
                }
                if (field.isAnnotationPresent(Id.class)){
                    Id id=field.getAnnotation(Id.class);
                    update.set("_id",fieldValue);
                }
            } catch (IllegalAccessException e1) {
                e1.printStackTrace();
            }
        }
        return update;
    }
}
