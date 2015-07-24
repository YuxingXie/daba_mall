package com.dabast.mall.view.index.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.MD5;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.User;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.model.productseries.dao.UserDao;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import org.bson.types.ObjectId;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/")
//@SessionAttributes("loginUser")
public class IndexController extends BaseRestSpringController {
    @Resource(name = "userDao")
    UserDao userDao;
    @Resource
    private RegisterValidateService registerValidateService;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, ModelMap model, HttpSession session) {

        Cookie nameCookie = CookieTool.getCookieByName(request, "name");
        Cookie pwdCookie = CookieTool.getCookieByName(request, "password");
        String name = null;
        try {
            name = nameCookie == null ? null : URLDecoder.decode(nameCookie.getValue(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String password = pwdCookie == null ? null : pwdCookie.getValue();
        if (name != null && password != null) {
            User user = userDao.findByNameAndPwd(name, password);
            if (user != null) session.setAttribute("loginUser", user);
        }
        List<String[]> top3 = ServiceManager.productSeriesService.getTop3ProductSeries();
        model.addAttribute("top3", top3);
        List<ProductSeries> hotSells = ServiceManager.productSeriesService.getHotSell();
        model.addAttribute("hotSells", hotSells);
        return "index";
    }

    //    @ModelAttribute
//    public void init(ModelMap model) {
//        model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
//    }
    @RequestMapping(value = "/index/user/{id}")
    public ResponseEntity<User> get(ModelMap model, @PathVariable String id) {
        User user = new User();
        user.setName("Tom" + id);
        user.setHeight(100);
        user.setSex("f");
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    @RequestMapping(value = "/index/user/register")
    public String userRegister(ModelMap model) {
        return "register";
    }

    @RequestMapping(value = "/index/user/exist_email")
    public ResponseEntity existEmail(ModelMap model, @RequestBody User user) {
//        System.out.println("email:"+user.getEmail());
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isEmailUsed(user.getEmail());
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }

//        System.out.println("is unique");
        return responseEntity;
    }

    @RequestMapping(value = "/index/user/exist_phone")
    public ResponseEntity existPhone(ModelMap model, @RequestBody User user) {
//        System.out.println("email:"+user.getEmail());
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isPhoneUsed(user.getPhone());
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }

//        System.out.println("is unique");
        return responseEntity;
    }

    @RequestMapping(value = "/index/user/login", method = RequestMethod.POST)
    public ResponseEntity<User> login(@RequestBody UserLoginForm form, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        User user = userDao.findByEmailOrPhone(form.getName());
        if (user==null){
            user=new User();
            user.setLoginStatus("用户不存在");
            return new ResponseEntity<User>(user,HttpStatus.OK);
        }
        //form.password可能是原始密码经过一次MD5加密，也可能是两次md5加密
        if (form.getPassword().equalsIgnoreCase(user.getPassword())) {//如果密码经过一次MD5加密，会直接相等
            session.setAttribute("loginUser", form);
            int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
            if (form.isRemember()) {
                CookieTool.addCookie(request, response, "name", form.getName(), loginMaxAge);
                CookieTool.addCookie(request, response, "password", form.getPassword(), loginMaxAge);
            } else {
                CookieTool.removeCookie(request, response, "name");
                CookieTool.removeCookie(request, response, "password");
            }
        } else if (form.getPassword().equalsIgnoreCase(MD5.convert(user.getPassword()))) {//如果密码经过两次MD5加密
            session.setAttribute("loginUser", form);
            int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
            if (form.isRemember()) {
                CookieTool.addCookie(request, response, "name", form.getName(), loginMaxAge);
                CookieTool.addCookie(request, response, "password", user.getPassword(), loginMaxAge);
            } else {
                CookieTool.removeCookie(request, response, "name");
                CookieTool.removeCookie(request, response, "password");
            }
        } else {
            return new ResponseEntity("{\"name\":\"用户名或密码错误\"}", HttpStatus.OK);
        }


        return new ResponseEntity<User>(form, HttpStatus.OK);

    }

    @RequestMapping(value = "/index/user/login/direct/{id}")
    public String loginDirect(@PathVariable String id, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User user = userDao.findById(id);
        int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
        CookieTool.addCookie(request, response, "name", user.getName(), loginMaxAge);
        CookieTool.addCookie(request, response, "password", user.getPassword(), loginMaxAge);

        return "redirect:/index";
    }

    @RequestMapping(value = "/index/user/logout")
    public ResponseEntity logout(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        session.setAttribute("loginUser", null);
        session.removeAttribute("loginUser");
        CookieTool.removeCookie(request, response, "name");
//        System.out.println("清除cookie name");
        CookieTool.removeCookie(request, response, "password");
//        System.out.println("清除cookie password");
        return new ResponseEntity("{}", HttpStatus.OK);

    }


    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
//        System.out.println(JSON.parse(jsonStr));
    }

    private String validUser(HttpServletRequest request, HttpServletResponse response) {
        String user_name = request.getParameter("name");
        String user_pwd = request.getParameter("password");
        String str = null;
        UserDao usersDao = new UserDao();
        User user = usersDao.findByNameAndPwd(user_name, user_pwd);
        if (user == null) {//登录验证失败
//            System.out.println("登录失败");
            request.getSession().setAttribute("errorInfo", "用户名或密码错误，请重新登录！");
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//            response.sendRedirect(basePath+"self/logOn.do");
        } else {
            int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
            String rememberPwd = request.getParameter("rememberPwd") == null ? "" : request.getParameter("rememberPwd").toString();
            if ("rememberPwd".equals(rememberPwd)) {
                CookieTool.addCookie(request, response, "name", user_name, loginMaxAge); //将姓名加入到cookie中
                CookieTool.addCookie(request, response, "password", user_pwd, loginMaxAge);   //将密码加入到cookie中
            }
            //将UtcUsers放到session中
            request.getSession().setAttribute("utcUsers", user);
            str = "self/index";
        }
        return str;
    }
}