package com.dabast.mall.view.index.controller;

import com.dabast.common.code.EmailEnum;
import com.dabast.entity.User;
import com.dabast.mall.model.productseries.dao.UserDao;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import org.apache.avalon.framework.service.ServiceException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;

/**
 * Created by Administrator on 2015/7/6.
 */
@Controller
@RequestMapping("/user")
public class RegisterController {

    @Resource
    private RegisterValidateService registerValidateService;
    @Resource
    private UserDao userDao;
    @RequestMapping(value = "/register/validate_code/email", method = {RequestMethod.POST})
    public ResponseEntity emailValidateCode(ModelMap map, HttpServletRequest request, String email) throws ParseException {
        //注册
        String msg=registerValidateService.processRegister(email);//发邮箱激活
        String code=email.indexOf("@")>=0?email.substring(email.indexOf("@")+1):"";
        String validUrl= EmailEnum.getUrlByCode(code);
        return new ResponseEntity("{\"message\":\""+msg+"\",\"url\":\""+validUrl+"\"}", HttpStatus.OK);
    }

    @RequestMapping(value = "/email/validate")
    public ResponseEntity exist(ModelMap model,@RequestBody User user) {
        System.out.println("email:"+user.getEmail());
        System.out.println("code:"+user.getValidateCode());
        ResponseEntity responseEntity=null;
        User dbUser=userDao.findByEmail(user.getEmail());
        System.out.println("code in request is:" + user.getValidateCode() + ",code in db is:" + dbUser.getValidateCode());
        boolean codeValid=dbUser.getValidateCode().equals(user.getValidateCode());
        System.out.println("code valid:"+codeValid);
        if (codeValid){
            return new ResponseEntity("{\"codeInvalid\":false}",HttpStatus.OK);
        }
        return new ResponseEntity("{\"codeInvalid\":true}",HttpStatus.OK);

    }


}
