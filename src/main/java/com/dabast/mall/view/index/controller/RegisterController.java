package com.dabast.mall.view.index.controller;

import com.dabast.entity.User;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import org.apache.avalon.framework.service.ServiceException;
import org.springframework.stereotype.Controller;

import java.text.ParseException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
    private RegisterValidateService registerValidateService;

    @RequestMapping(value = "/register/email", method = {RequestMethod.POST})
    public String register(ModelMap map, HttpServletRequest request, @ModelAttribute User user) throws ParseException {
        String url = request.getScheme()+"://"+ request.getServerName()+":"+request.getServerPort()+"/user/activate";
        ModelAndView model = new ModelAndView();
        //注册
        registerValidateService.processRegister(url, user);//发邮箱激活
        return "register/register_success";
    }

    @RequestMapping(value = "/activate", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView activate(ModelMap map, HttpServletRequest request, @ModelAttribute User user) throws ParseException {
        ModelAndView model = new ModelAndView();
        //激活
        String email = request.getParameter("email");//获取email
        String validateCode = request.getParameter("validateCode");//激活码
        try {
            registerValidateService.processActivate(email, validateCode);//调用激活方法
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        model.setViewName("register/activate_success");
        return model;
    }
}
