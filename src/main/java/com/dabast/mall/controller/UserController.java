package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.code.EmailEnum;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.MD5;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.service.impl.CartService;
import com.dabast.mall.service.impl.RegisterValidateService;
import com.dabast.mall.service.impl.UserService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBRef;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseRestSpringController {
    @Resource(name = "userService")
    UserService userService;
    @Resource private CartService cartService;
    @Resource
    private RegisterValidateService registerValidateService;
    @Resource
    private UserDao userDao;


    @RequestMapping(value = "/exist_name")
    public ResponseEntity existName(ModelMap model, @RequestBody User user) {
        Assert.notNull(user);
        Assert.notNull(user.getName());
        System.out.println(user.getName());
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isNameUsed(user.getName());
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }
        return responseEntity;
    }
    @RequestMapping(value = "/exist_email")
    public ResponseEntity existEmail(ModelMap model, @RequestBody User user) {
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isEmailUsed(user.getEmail());
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }
        return responseEntity;
    }

    /**
     * 验证手机是否被使用
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/exist_phone")
    public ResponseEntity existPhone(ModelMap model, @RequestBody User user) {
        ResponseEntity responseEntity = null;
        Assert.notNull(user);
        Assert.notNull(user.getPhone());
        boolean used = registerValidateService.isPhoneUsed(user.getPhone());
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }
        return responseEntity;
    }


    @RequestMapping(value = "/{id}")
    public ResponseEntity<User> get(ModelMap model, @PathVariable String id,HttpServletRequest request) {
        return new ResponseEntity<User>(userService.findById(id), HttpStatus.OK);
    }

    @RequestMapping(value = "/order/delete/{id}", method = RequestMethod.GET)
    public String orderRemove(@PathVariable String id, ModelMap model, HttpSession session) {
        Assert.notNull(id);
        ServiceManager.orderService.removeById(id);
        return myOrders(model,session);
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<User> login(@RequestBody User form, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        User user = userService.findByEmailOrPhone(form.getLoginStr());
        if (user==null){
            user=new User();
            user.setLoginStatus("用户不存在");
            return new ResponseEntity<User>(user,HttpStatus.OK);
        }
        //form.password可能是原始密码或者经过一次MD5加密，也可能是两次md5加密
        if (form.getPassword().equalsIgnoreCase(user.getPassword())
                ||form.getPassword().equalsIgnoreCase(MD5.convert(user.getPassword()))
                ||MD5.convert(form.getPassword()).equalsIgnoreCase(user.getPassword()))
            return doLogin(form, session, request, response, user);
        else {
            user=new User();
            user.setLoginStatus("用户名/密码错误");
            return new ResponseEntity<User>(user,HttpStatus.OK);
        }
    }

    private ResponseEntity<User> doLogin(User form, HttpSession session, HttpServletRequest request, HttpServletResponse response, User user) {
        session.setAttribute("loginUser", user);
        int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
        if (form.isRemember()) {
            CookieTool.addCookie(request, response, "loginStr", form.getLoginStr(), loginMaxAge);
            CookieTool.addCookie(request, response, "password", form.getPassword(), loginMaxAge);
        } else {
            CookieTool.removeCookie(request, response, "loginStr");
            CookieTool.removeCookie(request, response, "password");
        }
        Cart sessionCart=session.getAttribute(Constant.CART)==null?null:((Cart)(session.getAttribute(Constant.CART)));
//        if (form.isMergeCart()){
            if (user.getCart()==null){
                user.setCart(sessionCart);
            }else{
                Cart userCart=user.getCart();
                for (ProductSelected productSelected:userCart.getProductSelectedList()){
                    ProductSeries productSeries=productSelected.getProductSeries();
                    if(productSeries.getProductStore()==null) continue;
                    List<ProductStoreInAndOut> inAndOuts= ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                    productSeries.getProductStore().setInAndOutList(inAndOuts);
                }
                userCart.merge(sessionCart);
            }
            if (sessionCart!=null){
                ServiceManager.userService.update(user);
            }
//        }
        session.setAttribute(Constant.CART,user.getCart());
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    @RequestMapping(value = "/login/direct/{id}")
    public String loginDirect(@PathVariable String id, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User user = userService.findById(id);
        int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
        CookieTool.addCookie(request, response, "name", user.getName(), loginMaxAge);
        CookieTool.addCookie(request, response, "password", user.getPassword(), loginMaxAge);
        return "redirect:/index";
    }

    @RequestMapping(value = "/logout")
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
    @RequestMapping(value = "/login_user")
    public ResponseEntity loginUser(HttpSession session) {
        User user=getLoginUser(session);
//        System.out.println(new ResponseEntity<User>(user,HttpStatus.OK));
//        User test=new User();
//        test.setName("John");
//        user.setCart(null);
        return new ResponseEntity<User>(user,HttpStatus.OK);
    }

    @RequestMapping(value = "/personal_message")
    public String personalMessage(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
//        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        return "personal_message";
    }

    @RequestMapping(value = "/my_orders")
    public String myOrders(ModelMap model, HttpSession session) {
        User user=getLoginUser(session);
        Order order=new Order();
        if (user==null){
            return null;
        }
        order.setUser(user);
        List<Order> orders=ServiceManager.orderService.findAll(new BasicDBObject("user",user));
        if (orders==null){
            model.addAttribute("orders",orders);
            return "my_orders";
        }
        for (Order order1:orders){
            List<ProductSelected> productSelectedList=order1.getProductSelectedList();
            for (ProductSelected productSelected:productSelectedList){
                ProductSeries productSeries=productSelected.getProductSeries();
                if (productSeries!=null){
                    productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));
                }

            }
        }
        model.addAttribute("orders",orders);
        return "my_orders";
    }

    /**
     * 发送邮件验证码并保存用户
     * @param map
     * @param request
     * @param email
     * @return
     * @throws ParseException
     * @throws EmailException
     */
    @RequestMapping(value = "/validate_code/email", method = {RequestMethod.POST})
    public ResponseEntity<User> emailValidateCode(ModelMap map, HttpServletRequest request, String email) throws ParseException, EmailException {
        User user=registerValidateService.sendValidateCodeToMailAndUpsertUser(email);//发邮箱激活
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
    /**
     * 发送手机短信验证码并保存用户
     * @param map
     * @param request
     * @param phone
     * @return
     * @throws ParseException
     * @throws EmailException
     */
    @RequestMapping(value = "/validate_code/phone", method = {RequestMethod.POST})
    public ResponseEntity<User> phoneValidateCode(ModelMap map, HttpServletRequest request, String phone) throws Exception {
        User user=registerValidateService.sendValidateCodeToPhoneAndUpsertUser(phone);
//        String code= phone.indexOf("@")>=0? phone.substring(phone.indexOf("@")+1):"";
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    /**
     * 验证邮箱验证码是否有效
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/email/validate")
    public ResponseEntity checkValidateCode(ModelMap model,@RequestBody User user) {
        ResponseEntity responseEntity=null;
        Assert.notNull(user);
        Assert.notNull(user.getEmail());
        User dbUser=userDao.findByEmail(user.getEmail());
        boolean codeValid=dbUser.getValidateCode().equals(user.getValidateCode());
        if (codeValid){
            return new ResponseEntity("{\"codeValid\":true}",HttpStatus.OK);
        }
        return new ResponseEntity("{\"codeValid\":false}",HttpStatus.OK);

    }
    /**
     * 验证手机验证码是否有效
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/phone/validate")
    public ResponseEntity checkPhoneValidateCode(ModelMap model,@RequestBody User user) {
        Assert.notNull(user);
        Assert.notNull(user.getPhone());
        User dbUser=userDao.findByPhone(user.getPhone());
        boolean codeValid=dbUser.getValidateCode().equals(user.getValidateCode());
        if (codeValid){
            return new ResponseEntity("{\"codeValid\":true}",HttpStatus.OK);
        }
        return new ResponseEntity("{\"codeValid\":false}",HttpStatus.OK);

    }

    /**
     * 邮箱注册账号
     * @param form
     * @param errors
     * @param modelMap
     * @param session
     * @param request
     * @param response
     * @return
     */

    @RequestMapping(value = "/register/email",method = RequestMethod.POST)
    public String emailRegister(@Valid @ModelAttribute User form,BindingResult errors,RedirectAttributesModelMap modelMap,HttpSession session, HttpServletRequest request,HttpServletResponse response) {
        Assert.notNull(form);
        Assert.notNull(form.getId());
        if (errors.hasErrors()){
            modelMap.addAttribute("form", form);
            modelMap.addAttribute("org.springframework.validation.BindingResult.form", errors);
//            modelMap.addAttribute("modelMap", modelMap);
//            modelMap.addAttribute("BindingResult", errors);
            return "redirect:/user/register";
        }

        User dbUser=userDao.findByEmail(form.getEmail());
        Assert.isTrue(!dbUser.isActivated());
        if (!dbUser.getValidateCode().equals(form.getValidateCode())){
            errors.rejectValue("validateCode","user.signup.validateCode.error");
            if (!form.getPassword().equals(form.getRePassword())){
                errors.rejectValue("rePassword","user.signup.rePassword.error");
            }
            modelMap.addFlashAttribute("form", form);
            modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
            return "redirect:/user/register";
        }else{
            if (!form.getPassword().equals(form.getRePassword())){
                errors.rejectValue("rePassword","user.signup.rePassword.error");
                modelMap.addFlashAttribute("form", form);
                modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
                return "redirect:/user/register";
            }
            BeanUtils.copyProperties(form, dbUser, new String[]{"id"});
            dbUser.setActivated(true);
            Date now = new Date();
            dbUser.setRegisterTime(now);
            dbUser.setLastActivateTime(now);
            dbUser.setPassword(MD5.convert(dbUser.getPassword()));
            userDao.upsert(dbUser);
            modelMap.addFlashAttribute("form", dbUser);
            modelMap.addFlashAttribute("message", "注册成功!");
            doLogin(form,session,request,response,dbUser);
            return "redirect:/register_success";
        }

    }

    /**
     * 手机注册账号
     * @param form
     * @param errors
     * @param modelMap
     * @param session
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/register/phone",method = RequestMethod.POST)
    public String phoneRegister(@Valid @ModelAttribute User form,BindingResult errors,RedirectAttributesModelMap modelMap,HttpSession session, HttpServletRequest request,HttpServletResponse response) {
        Assert.notNull(form);
        Assert.notNull(form.getId());
        if (errors.hasErrors()){
            modelMap.addFlashAttribute("phoneForm", form);
            modelMap.addFlashAttribute("org.springframework.validation.BindingResult.phoneForm", errors);
            return "redirect:/register_phone";
        }else{
            if (!form.getPassword().equals(form.getRePassword())){
                errors.rejectValue("rePassword","user.signup.rePassword.error");
                modelMap.addFlashAttribute("form", form);
                modelMap.addFlashAttribute("org.springframework.validation.BindingResult.form", errors);
                return "redirect:/register_phone";
            }
            form.setActivated(true);
            Date now = new Date();
            form.setRegisterTime(now);
            form.setLastActivateTime(now);
            form.setPassword(MD5.convert(form.getPassword()));
            userDao.upsert(form);
            modelMap.addFlashAttribute("phoneForm", form);
            modelMap.addFlashAttribute("message", "注册成功!");
            doLogin(form,session,request,response,form);
            return "redirect:/register_success";
        }
    }
    @RequestMapping(value = "/cart")
    public ResponseEntity<Cart> cart(HttpSession session) {
        User user=getLoginUser(session);
//        Cart cart=user==null?getCart(session)user.getCart()==null?getCart(session):user.getCart();
        Cart cart=user==null?(getCart(session)==null?null:getCart(session)):user.getCart();
        if (cart!=null && cart.getProductSelectedList()!=null){
            for (ProductSelected productSelected:cart.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                if (productSeries.getProductStore()!=null) {
                    productSeries.getProductStore().setInAndOutList(inAndOuts);
                }else{

                }
            }
        }
        session.setAttribute(Constant.CART,cart);
        return new ResponseEntity<Cart>(cart,HttpStatus.OK);
    }
    @RequestMapping(value = "/accounts/{userId}")
    public ResponseEntity<List<Account>> accounts(@PathVariable String userId,HttpSession session) {
//        User user=getLoginUser(session);
//        Assert.notNull(user);
        User user=new User();
        user.setId(userId);
        List<Account> accounts=ServiceManager.accountService.findAll(new BasicDBObject("user",user));
        return new ResponseEntity<List<Account>>(accounts,HttpStatus.OK);
    }
    @RequestMapping(value = "/accs")
    public ResponseEntity<List<Account>> accounts(HttpSession session) {
        User user=getLoginUser(session);
//        Assert.notNull(user);
        List<Account> accounts=ServiceManager.accountService.findAll(new BasicDBObject("user",new DBRef("users",user.getId())));
        return new ResponseEntity<List<Account>>(accounts,HttpStatus.OK);
    }
}