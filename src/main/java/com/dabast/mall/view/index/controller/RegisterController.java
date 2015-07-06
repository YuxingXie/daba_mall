package com.dabast.mall.view.index.controller;

import com.dabast.entity.User;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import org.apache.avalon.framework.service.ServiceException;
import org.springframework.stereotype.Controller;

import java.text.ParseException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2015/7/6.
 */
@Controller
@RequestMapping("/user")
public class RegisterController {

    @Resource
    private RegisterValidateService service;

    @RequestMapping(value = "/register", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView register(ModelMap map, HttpServletRequest request, @ModelAttribute User user) throws ParseException {
        String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI();
        ModelAndView model = new ModelAndView();
        //注册
        String email = request.getParameter("email");
        service.processRegister(email, user);//发邮箱激活
        model.addObject("text", "注册成功");
        model.setViewName("register/register_success");
        return model;
    }

    @RequestMapping(value = "/activate", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView activate(ModelMap map, HttpServletRequest request, @ModelAttribute User user) throws ParseException {
        ModelAndView model = new ModelAndView();
        //激活
        String email = request.getParameter("email");//获取email
        String validateCode = request.getParameter("validateCode");//激活码
        try {
            service.processActivate(email, validateCode);//调用激活方法
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        model.setViewName("register/activate_success");
        return model;
    }
}
