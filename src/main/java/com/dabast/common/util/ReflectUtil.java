package com.dabast.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
public class ReflectUtil {
    public static <T>boolean methodExists(T t,String methodName){
        Method[] methods=t.getClass().getMethods();
        for(Method method:methods){
            if(methodName.equals(method.getName())){
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
    public static <T> Object invokeGetter(T t,String property){
        try {
            Method getter=t.getClass().getDeclaredMethod(getGetterMethodName(property)) ;
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
        return  word.substring(0, 1).toLowerCase()+ word.substring(1);
    }
    public static String firstUpperCase(String word) {
        return  word.substring(0, 1).toUpperCase()+ word.substring(1);
    }
    public static <T> boolean isFieldExist(Class<T> clazz, String fieldName) {
        for (Field field : clazz.getDeclaredFields()) {
            if (field.getName().equals(fieldName)) {
                return true;
            }
        }
        return false;
    }
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public static<T> Object getValue(T t,String property){
    	Class clazz=t.getClass();
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
		}catch (IllegalArgumentException e) {
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

        Class clazz=e.getClass();
        try {
            Method setter=clazz.getDeclaredMethod(getSetterMethodName(fieldName),value.getClass());
            setter.invoke(e,new Object[]{value});
        } catch (NoSuchMethodException e1) {
            e1.printStackTrace();
        } catch (InvocationTargetException e1) {
            e1.printStackTrace();
        } catch (IllegalAccessException e1) {
            e1.printStackTrace();
        }
    }
    public static void main(String[] args){
        System.out.println(isWrapClass(String.class));//false
        System.out.println(isWrapClass(Integer.class));//true
        System.out.println(isWrapClass(int.class));//false
        System.out.println(int.class==Integer.class);//false
        System.out.println(int.class.isPrimitive());//true
        System.out.println(Integer.class.isPrimitive());//false
    }
}
