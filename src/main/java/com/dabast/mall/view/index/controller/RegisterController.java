package com.dabast.mall.view.index.controller;

import com.dabast.common.code.EmailEnum;
import com.dabast.entity.User;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import org.apache.avalon.framework.service.ServiceException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import java.text.ParseException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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

    @RequestMapping(value = "/register/validate_code/email", method = {RequestMethod.POST})
    public ResponseEntity emailValidateCode(ModelMap map, HttpServletRequest request, String email) throws ParseException {
        String url = request.getScheme()+"://"+ request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/user/activate";
        System.out.println(url);
        //注册
        String msg=registerValidateService.processRegister(url, email);//发邮箱激活
        System.out.println(msg);
        String code=email.indexOf("@")>=0?email.substring(email.indexOf("@")+1):"";
        String validUrl= EmailEnum.getUrlByCode(code);
        return new ResponseEntity("{\"message\":\""+msg+"\",\"url\":\""+validUrl+"\"}", HttpStatus.OK);
    }

    @RequestMapping(value = "/email/validate")
    public ResponseEntity exist(ModelMap model,@RequestBody User user) {
        System.out.println("user:"+user.getEmail());
        ResponseEntity responseEntity=null;


//        System.out.println("is unique");
        return new ResponseEntity("",HttpStatus.OK);
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
