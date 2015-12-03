package com.dabast.common.base;


import com.dabast.entity.Cart;
import com.dabast.entity.Order;
import com.dabast.entity.User;
import com.dabast.common.constant.Constant;
import org.springframework.beans.BeanUtils;
import org.springframework.util.ReflectionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;


public class BaseRestSpringController  {
    protected static final String CREATED_SUCCESS = "创建成功";
    protected static final String UPDATE_SUCCESS = "更新成功";
    protected static final String DELETE_SUCCESS = "删除成功";
    
    protected static final String RESULT_STRING = "result";
    protected static final String TOTAL = "total";
    protected static final String RESULT_ACTION = "redirect:/result";

    public static void copyProperties(Object target,Object source) {
        BeanUtils.copyProperties(target, source);
    }

    protected void printRequestParameters(HttpServletRequest request){
        Map<String,String[]> requestMap=request.getParameterMap();
        for (String key:requestMap.keySet()){
            String str=new String();
            str+=key + ":[";
            for (String val:requestMap.get(key)){
                str+=val + ",";
            }
            if (str.endsWith(","))  System.out.print(str.substring(0,str.length()-1)+"]\n");
            else System.out.print(str+"]\n");
        }
    }
    protected User getLoginUser(HttpSession session) {
        return session.getAttribute(Constant.LOGIN_USER)==null?null:((User)(session.getAttribute(Constant.LOGIN_USER)));
    }
    protected Cart getCart(HttpSession session) {
        return session.getAttribute(Constant.CART)==null?null:((Cart)(session.getAttribute(Constant.CART)));
    }
    protected Order getOrder(HttpSession session) {
        return session.getAttribute(Constant.ORDER)==null?null:((Order)(session.getAttribute(Constant.ORDER)));
    }
    public static <T> T getOrCreateRequestAttribute(HttpServletRequest request, String key,Class<T> clazz) {
        Object value = request.getAttribute(key);
        if(value == null) {
            try {
                value = clazz.newInstance();
            } catch (Exception e) {
                ReflectionUtils.handleReflectionException(e);
            }
            request.setAttribute(key, value);
        }
        return (T)value;
    }



}
