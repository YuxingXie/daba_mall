package com.dabast.mall.listener;

import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Cart;
import com.dabast.mall.Constant;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by Administrator on 2015/7/29.
 */
public class CartListener implements HttpSessionAttributeListener{

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println("session attribute "+event.getName()+" added");
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {

        System.out.println("session attribute "+event.getName()+" removed");

//        ServletContext ctx = event.getSession( ).getServletContext( );
//        Object loginUser=ctx.getAttribute(Constant.LOGIN_USER);
//        Object cart = ctx.getAttribute(Constant.CART);
//        if (cart!=null &&loginUser!=null){
//            ServiceManager.cartService.upsert(null, (Cart) cart);
//        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        System.out.println("session attribute "+event.getName()+" replaced");
    }
}