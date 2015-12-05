package com.dabast.mall.controller;

import com.dabast.common.code.EmailEnum;
import com.dabast.common.util.MD5;
import com.dabast.entity.User;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.service.impl.RegisterValidateService;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.Date;

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
    @RequestMapping(value = "/register/validate_code/phone", method = {RequestMethod.POST})
    public ResponseEntity phoneValidateCode(ModelMap map, HttpServletRequest request, String phone) throws ParseException {
        //注册
        String msg=registerValidateService.processRegister(phone);//发邮箱激活
        String code= phone.indexOf("@")>=0? phone.substring(phone.indexOf("@")+1):"";
        String validUrl= EmailEnum.getUrlByCode(code);
        return new ResponseEntity("{\"message\":\""+msg+"\",\"url\":\""+validUrl+"\"}", HttpStatus.OK);
    }
    @RequestMapping(value = "/email/validate")
    public ResponseEntity checkValidateCode(ModelMap model,@RequestBody User user) {
//        System.out.println("phone:"+user.getEmail());
//        System.out.println("code:"+user.getValidateCode());
        ResponseEntity responseEntity=null;
        User dbUser=userDao.findByEmail(user.getEmail());
//        System.out.println("code in request is:" + user.getValidateCode() + ",code in db is:" + dbUser.getValidateCode());
        boolean codeValid=dbUser.getValidateCode().equals(user.getValidateCode());
//        System.out.println("code valid:"+codeValid);
        if (codeValid){
            return new ResponseEntity("{\"codeValid\":true}",HttpStatus.OK);
        }
        return new ResponseEntity("{\"codeValid\":false}",HttpStatus.OK);

    }

    @RequestMapping(value = "/register/email",method = RequestMethod.POST)
    public String emailRegister(@Valid @ModelAttribute UserLoginForm form,BindingResult errors,RedirectAttributesModelMap modelMap) {

        if (errors.hasErrors()){
            modelMap.addFlashAttribute("form", form);
            modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
//            modelMap.addAttribute("modelMap", modelMap);
//            modelMap.addAttribute("BindingResult", errors);
            return "redirect:/index/user/register";
        }else{
            User dbUser=userDao.findByEmail(form.getEmail());
            if (!dbUser.getValidateCode().equals(form.getValidateCode())){
                errors.rejectValue("validateCode","user.signup.validateCode.error");
                if (!form.getPassword().equals(form.getRePassword())){
                    errors.rejectValue("rePassword","user.signup.rePassword.error");
                }
                modelMap.addFlashAttribute("form", form);
                modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
                return "redirect:/index/user/register";
            }else{
                if (!form.getPassword().equals(form.getRePassword())){
                    errors.rejectValue("rePassword","user.signup.rePassword.error");
                    modelMap.addFlashAttribute("form", form);
                    modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
                    return "redirect:/index/user/register";
                }
                BeanUtils.copyProperties(form,dbUser,new String[]{"id"});
                dbUser.setStatus(1);
                Date now = new Date();
                dbUser.setRegisterTime(now);
                dbUser.setLastActivateTime(now);
                dbUser.setPassword(MD5.convert(dbUser.getPassword()));
                userDao.update(dbUser);
                modelMap.addFlashAttribute("form", dbUser);
                modelMap.addFlashAttribute("message", "注册成功!");
                return "redirect:/user/register/success";
            }

        }

    }
    @RequestMapping("/register/success")
    public String registerSuccess(){
        return "register/register_success";
    }
}
