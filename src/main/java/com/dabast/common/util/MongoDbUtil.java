package com.dabast.common.util;


import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.data.annotation.Id;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

public class MongoDbUtil {

    /**
     * 把实体bean对象转换成DBObject
     *
     * @param bean
     * @return
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    public static <T> DBObject bean2DBObject(T bean) throws IllegalArgumentException,
            IllegalAccessException {
        if (bean == null) {
            return null;
        }
        DBObject dbObject = new BasicDBObject();
        // 获取对象对应类中的所有属性域
        Field[] fields = bean.getClass().getDeclaredFields();
        for (Field field : fields) {
            // 获取属性名
            String varName = field.getName();
            // 修改访问控制权限
            boolean accessFlag = field.isAccessible();
            if (!accessFlag) {
                field.setAccessible(true);
            }
            Object param = field.get(bean);
            if (param == null) {
                continue;
            } else if (param instanceof Integer) {//判断变量的类型
                int value = ((Integer) param).intValue();
                dbObject.put(varName, value);
            } else if (param instanceof String) {
                String value = (String) param;
                dbObject.put(varName, value);
            } else if (param instanceof Double) {
                double value = ((Double) param).doubleValue();
                dbObject.put(varName, value);
            } else if (param instanceof Float) {
                float value = ((Float) param).floatValue();
                dbObject.put(varName, value);
            } else if (param instanceof Long) {
                long value = ((Long) param).longValue();
                dbObject.put(varName, value);
            } else if (param instanceof Boolean) {
                boolean value = ((Boolean) param).booleanValue();
                dbObject.put(varName, value);
            } else if (param instanceof Date) {
                Date value = (Date) param;
                dbObject.put(varName, value);
            }
            // 恢复访问控制权限
            field.setAccessible(accessFlag);
        }
        return dbObject;
    }

    /**
     * 把DBObject转换成bean对象
     *
     * @param dbObject
     * @param bean
     * @return
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     */
    public static <T> T dbObject2Bean(DBObject dbObject, T bean) throws IllegalAccessException,
            InvocationTargetException, NoSuchMethodException {
        if (bean == null)  return null;
        if (dbObject==null) return null;
        Field[] fields = bean.getClass().getDeclaredFields();
        for (Field field : fields) {
            String dbFieldName = null;
            if (field.isAnnotationPresent(org.springframework.data.mongodb.core.mapping.Field.class)) {
                dbFieldName = field.getAnnotation(org.springframework.data.mongodb.core.mapping.Field.class).value();
            } else if (field.isAnnotationPresent(Id.class)) {
                dbFieldName = "_id";
            } else {
                dbFieldName = field.getName();
            }
            Object object = dbObject.get(dbFieldName);
            if (object != null) {
                BeanUtils.setProperty(bean, field.getName(), object);
            }
        }
        return bean;
    }

    public static <T> boolean isKeyExists(Class<T> clazz, String key) {
        if (clazz == null) return false;
        if (key == null) return false;
        for (java.lang.reflect.Field classField : clazz.getDeclaredFields()) {
            org.springframework.data.mongodb.core.mapping.Field documentField = clazz.getAnnotation(org.springframework.data.mongodb.core.mapping.Field.class);
            if (documentField == null) continue;
            String documentFieldValue = documentField.value();
            if (documentFieldValue.equals(key)) {
                return true;
            }
        }
        return ReflectUtil.isFieldExist(clazz, key);
    }

    public static <T> String getId(T t) {
        Class<?> clazz = t.getClass();
        if (clazz == null) return null;
        for (java.lang.reflect.Field classField : clazz.getDeclaredFields()) {
            if (!classField.isAnnotationPresent(Id.class)) continue;
            Object idValue = ReflectUtil.getValue(t, classField.getName());
            return idValue == null ? null : idValue.toString();
        }
        return null;
    }
}