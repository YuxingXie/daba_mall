package com.dabast.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lxd
 * Date: 11-5-19
 * Time: 下午1:49
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class EmptyHander {
    @RequestMapping
    public void doRedirect(HttpServletRequest request){
//        Map<String ,String[]> map=request.getParameterMap();
//        for (String key:map.keySet()){
//            System.out.println("key:"+key+",value:"+map.get(key)[0]);
//        }
    }
}
