package com.dabast.common.util;


import com.dabast.common.base.annotation.mongo.MongoArray;
import com.dabast.common.base.annotation.mongo.MongoBean;
import com.dabast.common.base.annotation.mongo.MongoField;

import java.lang.reflect.Field;

/**
 * Created by Administrator on 2015/9/16.
 */
public class MongoDbUtil {
    public static StringBuffer buildJSON(Object object){
        if (object==null) return null;
        return buildJSON(new StringBuffer(),object);
    }
    private static StringBuffer buildJSON(StringBuffer stringBuffer,Object object){
        stringBuffer.append("{");
        for (Field field:object.getClass().getDeclaredFields()){
            if (field.isAnnotationPresent(MongoField.class)){
                stringBuffer=addField(stringBuffer,field,object);
            }
//            if (field.isAnnotationPresent(MongoBean.class)){
//                stringBuffer=addBean(stringBuffer,field,object);
//            }
//            if (field.isAnnotationPresent(MongoArray.class)){
//                stringBuffer=addArray(stringBuffer, field,object);
//            }
        }
        stringBuffer.append("}");
        if(stringBuffer.toString().equals("{}")) return null;
        return  stringBuffer;
    }

    private static StringBuffer addBean(StringBuffer stringBuffer, Field field,Object object) {

        return null;
    }

    private static StringBuffer addArray(StringBuffer stringBuffer, Field field,Object object) {
        return null;
    }

    private static StringBuffer addField(StringBuffer stringBuffer, Field field,Object object) {
        try {
            Object fieldValue=field.get(object);
            if (fieldValue==null) return stringBuffer;
            if (stringBuffer.toString().endsWith("\"")){
                stringBuffer.append(",");
            }
            stringBuffer.append("\"").append(field.getName()).append("\":\"").append(fieldValue).append("\",");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}
