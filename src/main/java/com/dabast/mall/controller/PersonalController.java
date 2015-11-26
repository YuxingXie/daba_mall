package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.CustomServletRequestWrapper;
import com.dabast.common.util.LocationUtil;
import com.dabast.common.util.MD5;
import com.dabast.common.util.ThirdPartPayUtil;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.Constant;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.service.impl.CartService;
import com.dabast.mall.service.impl.RegisterValidateService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/personal")
//@SessionAttributes("loginUser")
public class PersonalController extends BaseRestSpringController {
    @RequestMapping(value = "/cart/text")
    public ResponseEntity<Cart> cart( HttpSession session) {
        Cart cart=getCart(session);
        return new ResponseEntity<Cart>(cart,HttpStatus.OK);
    }
    @RequestMapping(value = "/interests/json")
    public ResponseEntity<List<Interest>> interest( HttpSession session) {
        User user=getLoginUser(session);
        List<Interest> interests=ServiceManager.interestService.findInterestsOfUser(user);
        return new ResponseEntity<List<Interest>>(interests,HttpStatus.OK);
    }
    @RequestMapping(value = "/interests/remove/{id}")
    public String interestRemove( @PathVariable String id) {
        ServiceManager.interestService.removeById(id);
        return "redirect:/my_interests";
    }
}