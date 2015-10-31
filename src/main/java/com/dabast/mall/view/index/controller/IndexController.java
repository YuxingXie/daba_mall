package com.dabast.mall.view.index.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.MD5;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.Constant;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.model.productseries.dao.UserDao;
import com.dabast.mall.model.productseries.service.impl.CartService;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.domain.Page;
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
import java.util.ArrayList;
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
    @Resource private CartService cartService;
    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, ModelMap model, HttpSession session) {

        Cookie nameCookie = CookieTool.getCookieByName(request, "loginStr");
        Cookie pwdCookie = CookieTool.getCookieByName(request, "password");
        String name = null;
        try {
            name = nameCookie == null ? null : URLDecoder.decode(nameCookie.getValue(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String password = pwdCookie == null ? null : pwdCookie.getValue();
        if (name != null && password != null) {
//            User user = userDao.findByNameAndPwd(name, password);
            User user = userDao.findByEmailOrPhone(name);
            if (user.getPassword().equalsIgnoreCase(password)) {
                session.setAttribute("loginUser", user);
                Cart condition=new Cart();
                condition.setUserId(user.getId());
                DBObject dbCondition=new BasicDBObject();
                dbCondition.put("userId",user.getId());
//                Cart cart=cartService.findOne(condition);
                Cart cart=cartService.findOne(dbCondition);
                if (cart!=null){
                    session.setAttribute(Constant.CART,cart);
                }
            }
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
    @RequestMapping(value = "/index/product/search")
    public String  searchProducts(ModelMap model,String keyWord,Integer page) {
        page=page==null?1:page;
        keyWord=keyWord==null?"":keyWord;
        Page<ProductSeries> productSeriesList=ServiceManager.productSeriesService.findProductSeriesesByKeyWord(keyWord,page);
        model.addAttribute("_page", productSeriesList);
        model.addAttribute("page", page);
        model.addAttribute("keyWord",keyWord);
        return "search-result";
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
    @RequestMapping(value = "/index/cart", method = RequestMethod.POST)
    public ResponseEntity<Cart> login(@RequestBody ProductSelected productSelected, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        //TODO
        Cart cart=null;
       if (session.getAttribute(Constant.CART)==null){
           cart=new Cart();
       }else{
           cart=(Cart)session.getAttribute(Constant.CART);
       }
        ProductSeries productSeries=ServiceManager.productSeriesService.findById(productSelected.getProductSeriesId());
        productSelected.setProductSeries(productSeries);

        List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
       for(String productPropertyValueId : productSelected.getProductPropertyValueIds()){
           DBObject ppCon=new BasicDBObject();
           ProductPropertyValue value=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
           ppCon.put("_id",value.getProductPropertyId());
           ProductProperty productProperty=ServiceManager.productPropertyService.findOne(ppCon);
           value.setProductProperty(productProperty);
           productPropertyValueList.add(value);

//           productPropertyValueId.setProductProperty(productProperty);
//           ProductPropertyValueList.add(productPropertyValueId);
       }
//        productSelected.((ProductPropertySelect[])ProductPropertyValueList.toArray(new ProductPropertySelect[ProductPropertyValueList.size()]));
        productSelected.setProductPropertyValueList(productPropertyValueList);
        cart.merge(productSelected);
//        if (session.getAttribute(Constant.LOGIN_USER)!=null){
//            User user=(User)session.getAttribute(Constant.LOGIN_USER);
//            Cart queryCart=new Cart();
//            queryCart.setUserId(user.getId());
//            ServiceManager.cartService.upsert(queryCart,cart);
//        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);
        System.out.println("executed");
        return cartResponseEntity;
    }
    @RequestMapping(value = "/index/cart/remove", method = {RequestMethod.POST})
    public ResponseEntity<Cart> cartRemove(Integer selectedIndex, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);

        return cartResponseEntity;
    }
    @RequestMapping(value = "/cart/remove/{selectedIndex}", method = RequestMethod.GET)
    public String cartRemove2(@PathVariable Integer selectedIndex, ModelMap model, HttpSession session) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        session.setAttribute(Constant.CART, cart);
        return "cart/cart";
    }
    @RequestMapping(value = "/index/user/login", method = RequestMethod.POST)
    public ResponseEntity<User> login(@RequestBody UserLoginForm form, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        User user = userDao.findByEmailOrPhone(form.getLoginStr());
        if (user==null){
            user=new User();
            user.setLoginStatus("用户不存在");
            return new ResponseEntity<User>(user,HttpStatus.OK);
        }
        //form.password可能是原始密码或者经过一次MD5加密，也可能是两次md5加密
        if (form.getPassword().equalsIgnoreCase(user.getPassword())
                ||form.getPassword().equalsIgnoreCase(MD5.convert(user.getPassword()))
                ||MD5.convert(form.getPassword()).equalsIgnoreCase(user.getPassword())) {
            session.setAttribute("loginUser", user);
            int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
            if (form.isRemember()) {
                CookieTool.addCookie(request, response, "loginStr", form.getLoginStr(), loginMaxAge);
                CookieTool.addCookie(request, response, "password", form.getPassword(), loginMaxAge);
            } else {
                CookieTool.removeCookie(request, response, "loginStr");
                CookieTool.removeCookie(request, response, "password");
            }
            Cart cart=ServiceManager.cartService.getCartByUserId(user.getId());
            session.setAttribute(Constant.CART,cart);
            user.setCart(cart);
            return new ResponseEntity<User>(user, HttpStatus.OK);
        } else {
            user=new User();
            user.setLoginStatus("用户名/密码错误");
            return new ResponseEntity<User>(user,HttpStatus.OK);
        }
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
        session.setAttribute(Constant.CART, null);
        session.removeAttribute(Constant.CART);
        CookieTool.removeCookie(request, response, "loginStr");
//        System.out.println("清除cookie name");
        CookieTool.removeCookie(request, response, "password");
//        System.out.println("清除cookie password");
        return new ResponseEntity("{}", HttpStatus.OK);
    }
    @RequestMapping(value = "/index/login_user")
    public ResponseEntity loginUser(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        return new ResponseEntity<User>(user,HttpStatus.OK);
    }

    @RequestMapping(value = "/index/personal_message")
    public String personalMessage(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
//        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        return "personal_message";
    }
    @RequestMapping(value = "/cart/to_bill")
    public String toBill(@RequestBody Cart cart,ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(cart);
        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        Cart cart1=session.getAttribute("cart")==null?null:(Cart)session.getAttribute(Constant.CART);
        cart1.setProductSelectedList(cart.getProductSelectedList());
        session.setAttribute(Constant.CART,cart1);
        return "to_bill";
    }
    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
//        System.out.println(JSON.parse(jsonStr));
    }


}