package com.dabast.common.util;

import com.dabast.entity.User;

import java.lang.reflect.*;
import java.util.ArrayList;
import java.util.List;

public class ReflectUtil {
    public static <T> boolean methodExists(T t, String methodName) {
        Method[] methods = t.getClass().getMethods();
        for (Method method : methods) {
            if (methodName.equals(method.getName())) {
                return true;
            }
        }
        return false;
    }

    public static boolean isWrapClass(Class clz) {
        try {
            return ((Class) clz.getField("TYPE").get(null)).isPrimitive();
        } catch (Exception e) {
            return false;
        }
    }

    public static String getGetterMethodName(String fieldName) {
        return "get" + firstUpperCase(fieldName);
    }

    public static String getSetterMethodName(String fieldName) {
        return "set" + firstUpperCase(fieldName);
    }

    public static <T> Object invokeGetter(T t, String property) {
        try {
            Method getter = t.getClass().getDeclaredMethod(getGetterMethodName(property));
            return getter.invoke(t);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();

        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String firstLowerCase(String word) {
        return word.substring(0, 1).toLowerCase() + word.substring(1);
    }

    public static String firstUpperCase(String word) {
        return word.substring(0, 1).toUpperCase() + word.substring(1);
    }

    public static <T> boolean isFieldExist(Class<T> clazz, String fieldName) {
        for (Field field : clazz.getDeclaredFields()) {
            if (field.getName().equals(fieldName)) {
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static <T> Object getValue(T t, String property) {
        Class clazz = t.getClass();
        Method method;
        try {
            method = clazz.getDeclaredMethod(getGetterMethodName(property), null);
            return method.invoke(t, null);
        } catch (SecurityException e) {
            e.printStackTrace();
            return null;
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return null;
        } catch (InvocationTargetException e) {
            e.printStackTrace();
            return null;
        }


    }

    public static <E> void invokeSetter(E e, String fieldName, Object value) {

        Class clazz = e.getClass();
        try {
            Method setter = clazz.getDeclaredMethod(getSetterMethodName(fieldName), value.getClass());
            setter.invoke(e, new Object[]{value});
        } catch (NoSuchMethodException e1) {
            e1.printStackTrace();
        } catch (InvocationTargetException e1) {
            e1.printStackTrace();
        } catch (IllegalAccessException e1) {
            e1.printStackTrace();
        }
    }

    /**
     * 解析一个类的所有字段，直到所有元素都为基本数据类型及其包装类或字符串为止
     *
     * @param object
     */
    public static <E> void analysisBean(Object object) throws IllegalAccessException {
        System.out.println("-----begin analysis "+object.getClass().getName()+"--------");
        for (Field field : object.getClass().getDeclaredFields()) {
            String fieldName = field.getName();
            System.out.println("field name:" + fieldName);
            field.setAccessible(true);
            Object fieldValue = field.get(object);
            Type genericType=field.getGenericType();
            if (field.getType().isPrimitive() ||ReflectUtil.isWrapClass(field.getType()) ||field.getType()==String.class){
                System.out.println("field is a primitive type type");
            }else if (field.getType().isArray()){
                if (fieldValue!=null){
                    System.out.print("field is an array,field values are:");

                    Object[] fieldArrayObject=(Object[])fieldValue;
                    for (Object fieldArrayObjectItem:fieldArrayObject){
                        System.out.print(fieldArrayObjectItem + ",class is:" + fieldArrayObjectItem.getClass() + ",");
                    }
                    System.out.println("");
                }else{
                    System.out.println("field is an array,field value is null");
                }
            }else if (genericType instanceof ParameterizedType){

                ParameterizedType parameterizedType=(ParameterizedType)genericType;
                System.out.println("field is a parameterized type:"+parameterizedType);
                Type[] actualTypes=parameterizedType.getActualTypeArguments();
                Type rawType=parameterizedType.getRawType();

                if (rawType==List.class){
                    System.out.println("field is a java.util.List");
                }

                if (actualTypes.length>0){
                    Class class0=(Class<?>)actualTypes[0];
                    System.out.println("field parameterized type:"+class0);
                }
                if (fieldValue!=null&&rawType==List.class){
                    List<?> fieldValueList=(ArrayList)fieldValue;
                    for (Object fieldValueListItem:fieldValueList){
                        analysisBean(fieldValueListItem);
                    }
                }

            }else{
                System.out.println("field is a simple class");
            }

            System.out.println("--------------------------------------------------------------");
        }
    }

    public static void main(String[] args) {
//        System.out.println(isWrapClass(String.class));//false
//        System.out.println(isWrapClass(Integer.class));//true
//        System.out.println(isWrapClass(int.class));//false
//        System.out.println(int.class==Integer.class);//false
//        System.out.println(int.class.isPrimitive());//true
//        System.out.println(Integer.class.isPrimitive());//false
        List<User> users = new ArrayList<User>();
        User user1 = new User();
        User user2 = new User();
        user1.setName("John");
        user2.setName("Marry");
        users.add(user1);
        users.add(user2);
        User user3=new User();
        User user4=new User();
        user3.setName("papa");
        user4.setName("mama");
        User[] papamama=new User[]{user3,user4};
        Person person = new Person();
        person.setChildren(users);
        person.setParents(papamama);
        try {
            analysisBean(person);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

}
