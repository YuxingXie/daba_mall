package com.dabast.mall.filter;

import com.dabast.common.web.HttpsToHttpKeepSessionRequestWarp;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/1/21.
 */
public final class HttpsToHttpKeepSessionFilter  implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest=(HttpServletRequest)request;
        if(httpServletRequest.getRequestURI().indexOf("layerslider/skins/fullwidth/skin")>=0){//屏蔽一个不知道从哪里来的请求
//            System.out.println("i got it");
            return;
        }
        HttpsToHttpKeepSessionRequestWarp myrequest = new HttpsToHttpKeepSessionRequestWarp(httpServletRequest);
        myrequest.setResponse((HttpServletResponse)response);
        chain.doFilter(myrequest, response);
    }

    @Override
    public void destroy() {

    }
}