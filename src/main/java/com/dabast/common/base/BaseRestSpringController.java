package com.dabast.common.base;


import org.springframework.beans.BeanUtils;
import org.springframework.ui.ModelMap;
import org.springframework.util.ReflectionUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
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

    public void printRequestParameters(HttpServletRequest request){
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

    protected Map<String,Object> getParams(HttpServletRequest request){
        Map<String,Object> params = new HashMap();
        //获得POST 过来参数设置到新的params中
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = request.getParameterValues(name);
            StringBuffer valueStr =new StringBuffer();
            for (int i = 0; i < values.length; i++) {
                valueStr.append((i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",");
            }
            params.put(name, valueStr.toString());
        }
        return params;
    }

    public void setSuccess(ModelMap model){
        model.put("success","true");
    }

    public void setFailure(ModelMap model){
        model.put("success","false");
    }
}
