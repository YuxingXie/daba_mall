package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Cart;
import com.dabast.entity.Interest;
import com.dabast.entity.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/personal")
//@SessionAttributes("loginUser")
public class PersonalController extends BaseRestSpringController {
    private static Logger logger = LogManager.getLogger();
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