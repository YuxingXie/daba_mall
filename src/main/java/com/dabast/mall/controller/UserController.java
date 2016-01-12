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
import com.dabast.support.vo.Message;
import com.dabast.support.vo.PairUsers;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.util.*;

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
    @RequestMapping(value = "/register_email")
    public String register_email(ModelMap model) {
        return "forward:/register_email/register_email.jsp";
    }
    @RequestMapping(value = "/register_phone")
    public String register_phone(ModelMap model) {
        return "forward:/register_phone/register_phone.jsp";
    }
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

    /**
     * 用户修改昵称判断新名字是否被使用
     * @param model
     * @param user 新的用户
     * @return
     */
    @RequestMapping(value = "/exist_name2")
    public ResponseEntity existName2(ModelMap model,@RequestBody User user) {
        Assert.notNull(user);
        String userName=user.getName();
        String userId=user.getId();
        Assert.notNull(userName);
        Assert.notNull(userId);
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isNameUsed(userName,userId);
        if (used) {
            responseEntity = new ResponseEntity("{\"unique\":false}", HttpStatus.OK);
        } else {
            responseEntity = new ResponseEntity("{\"unique\":true}", HttpStatus.OK);
        }
        return responseEntity;
    }
    @RequestMapping(value = "/update/name")
    public ResponseEntity<User> updateName(ModelMap model,@RequestBody User user,HttpSession session) {
        Assert.notNull(user);
        String userName=user.getName();
        String userId=user.getId();
        Assert.notNull(userName);
        Assert.notNull(userId);
        ResponseEntity responseEntity = null;
        User updateUser=new User();
        updateUser.setId(userId);
        updateUser.setName(userName);
        userService.update(updateUser);
        user=userService.findById(userId);
        session.setAttribute(Constant.LOGIN_USER,user);
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    /**
     * 发送验证码时可能会创建一个新临时用户保存email和验证码，也可能使用用户本身的这条记录，如果创建了临时用户则需要删除
     * @param model
     * @param users
     * @param session
     * @return
     */
    @RequestMapping(value = "/update/email")
    public ResponseEntity<User> updateEmail(ModelMap model,@RequestBody PairUsers users,HttpSession session) {
        User user=users.getFirstUser();
        User emailUser=users.getSecondUser();
        Assert.notNull(user);
        Assert.notNull(emailUser);
        Assert.notNull(emailUser.getId());
        String email=emailUser.getEmail();
        String userId=user.getId();
        Assert.notNull(email);
        Assert.notNull(userId);
        if (user.getEmail().equals(emailUser.getEmail())) return new ResponseEntity<User>(user, HttpStatus.OK);
        User updateUser=new User();
        updateUser.setId(userId);
        updateUser.setEmail(email);
        userService.update(updateUser);
        if(!user.getId().equalsIgnoreCase(emailUser.getId())){
            userService.removeById(emailUser.getId());
        }
        user=userService.findById(userId);
        session.setAttribute(Constant.LOGIN_USER,user);
        return new ResponseEntity<User>(user, HttpStatus.OK);
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
     * 用户修改邮箱时验证邮箱是否可用
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/exist_email2")
    public ResponseEntity existEmail2(ModelMap model, @RequestBody User user) {
        ResponseEntity responseEntity = null;
        boolean used = registerValidateService.isEmailUsed(user.getEmail(),user.getId());
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


    @RequestMapping(value = "/data/{id}", method = RequestMethod.GET)
    public ResponseEntity<User> get(ModelMap model, @PathVariable String id,HttpServletRequest request) {
        return new ResponseEntity<User>(userService.findById(id), HttpStatus.OK);
    }
    @RequestMapping(value = "/to_login")
    public String toLogin(ModelMap model,String to, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if (to==null||"".equals(to.trim())){
            to=request.getRequestURI();
        }
        System.out.println(URLDecoder.decode(to,"UTF-8"));

        model.addAttribute("to",to);
        return "forward:/login.jsp";
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
    @RequestMapping(value = "/https/login", method = RequestMethod.POST)
    public String httpsLogin(@ModelAttribute User form,@RequestParam String to, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Message message=new Message();
        User user = userService.findByEmailOrPhone(form.getLoginStr());
        if (user==null){
            message.setMessage("用户不存在");
            message.setSuccess(false);
            model.addAttribute("message",message);
            return "forward:/user/to_login";
        }
        //form.password可能是原始密码或者经过一次MD5加密，也可能是两次md5加密
        if (form.getPassword().equalsIgnoreCase(user.getPassword())
                ||form.getPassword().equalsIgnoreCase(MD5.convert(user.getPassword()))
                ||MD5.convert(form.getPassword()).equalsIgnoreCase(user.getPassword()))
            return doHttpsLogin(form, session, request, response, user,to);
        else {
            message.setMessage("用户名/密码错误");
            message.setSuccess(false);
            model.addAttribute("message",message);
            return "forward:/user/to_login";

        }
    }
    private String doHttpsLogin(User form, HttpSession session, HttpServletRequest request, HttpServletResponse response, User user,String to) {
        session.setAttribute("loginUser", user);
        int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
        if (form.getRemember()!=null &&form.getRemember()) {
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
//                for (ProductSelected productSelected:userCart.getProductSelectedList()){
//                    ProductSeries productSeries=productSelected.getProductSeries();
//                    if(productSeries.getProductStore()==null) continue;
//                    List<ProductStoreInAndOut> inAndOuts= ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
//                    productSeries.getProductStore().setInAndOutList(inAndOuts);
//                }
            userCart.merge(sessionCart);
        }
        if (sessionCart!=null){
            ServiceManager.userService.update(user);
        }
//        }
        session.setAttribute(Constant.CART,user.getCart());
        try {
            response.sendRedirect(getHttpUrlStringFromUri(request, URLDecoder.decode(to, "UTF-8"))) ;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    private ResponseEntity<User> doLogin(User form, HttpSession session, HttpServletRequest request, HttpServletResponse response, User user) {
        session.setAttribute("loginUser", user);
        int loginMaxAge = 30 * 24 * 60 * 60;   //定义账户密码的生命周期，这里是一个月。单位为秒
        if (form.getRemember()!=null &&form.getRemember()) {
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
//                for (ProductSelected productSelected:userCart.getProductSelectedList()){
//                    ProductSeries productSeries=productSelected.getProductSeries();
//                    if(productSeries.getProductStore()==null) continue;
//                    List<ProductStoreInAndOut> inAndOuts= ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
//                    productSeries.getProductStore().setInAndOutList(inAndOuts);
//                }
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
        return new ResponseEntity<User>(user,HttpStatus.OK);
    }

    /**
     * 用户未读信息数
     * @param session
     * @return
     */
    @RequestMapping(value = "/unread_notifies_count")
    public ResponseEntity<Long> notifies(HttpSession session) {
        User user=getLoginUser(session);
        if (user==null) return null;
        DBObject dbObject=new BasicDBObject();
        dbObject.put("toUser",user);
        BasicDBList dbList=new BasicDBList();
        dbList.add(new BasicDBObject("read",false));
        dbList.add(new BasicDBObject("read",new BasicDBObject("$exists",false)));
        dbObject.put("$or",dbList);
        long notifyCount=ServiceManager.notifyService.count(dbObject);
        return new ResponseEntity<Long>(notifyCount,HttpStatus.OK);
    }
    /**
     * 用户信息
     * @param session
     * @return
     */
    @RequestMapping(value = "/notifies")
    public ResponseEntity<Map> notifies(Integer page,HttpSession session) {
        User user=getLoginUser(session);
        if (user==null) return null;
        DBObject dbObject=new BasicDBObject();
        dbObject.put("toUser",new DBRef("users",user.getId()));
//        dbObject.put("read",false);
        page=page==null?1:page;
        Page<Notify> notifyPage=ServiceManager.notifyService.findPage(dbObject,page,4,"date",false);
        Map<String,Object> map=new LinkedHashMap<String,Object>();
        map.put("notifyPage", notifyPage);
        map.put("page", page);
        return new ResponseEntity<Map>(map,HttpStatus.OK);
    }
    /**
     * 用户信息
     * @param session
     * @return
     */
    @RequestMapping(value = "/notify/read")
    public ResponseEntity<Map> read(@RequestBody Notify notify,Integer page,HttpSession session) {

        User user=getLoginUser(session);
        if (user==null) return null;
        ServiceManager.notifyService.update(notify);
        DBObject dbObject=new BasicDBObject();
        dbObject.put("toUser",new DBRef("users",user.getId()));
        page=page==null?1:page;
        Page<Notify> notifyPage=ServiceManager.notifyService.findPage(dbObject,page,4);
        Map<String,Object> map=new LinkedHashMap<String,Object>();
        map.put("notifyPage", notifyPage);
        map.put("page", page);

        DBObject notifyCountDbObject=new BasicDBObject();
        dbObject.put("toUser",user);
        BasicDBList dbList=new BasicDBList();
        dbList.add(new BasicDBObject("read",false));
        dbList.add(new BasicDBObject("read", new BasicDBObject("$exists", false)));
        notifyCountDbObject.put("$or",dbList);
        long notifyCount=ServiceManager.notifyService.count(notifyCountDbObject);
        map.put("unreadNotifiesCount",notifyCount);
        return new ResponseEntity<Map>(map,HttpStatus.OK);
    }
    @RequestMapping(value = "/notify/remove")
    public ResponseEntity<Map> remove(@RequestBody Notify notify,Integer page,HttpSession session) {
        User user=getLoginUser(session);
        if (user==null) return null;
        ServiceManager.notifyService.removeById(notify.getId());
        DBObject dbObject=new BasicDBObject();
        dbObject.put("toUser",new DBRef("users",user.getId()));
        page=page==null?1:page;
        Page<Notify> notifyPage=ServiceManager.notifyService.findPage(dbObject,page,4);
        Map<String,Object> map=new LinkedHashMap<String,Object>();
        map.put("notifyPage", notifyPage);
        map.put("page", page);
        return new ResponseEntity<Map>(map,HttpStatus.OK);
    }
    @RequestMapping(value = "/personal_message")
    public String personalMessage(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
//        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        return "personal_message";
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
            return "forward:/user/register";
        }

        User dbUser=userDao.findByEmail(form.getEmail());
        Assert.isTrue(dbUser.getActivated()==null);//may error
        if (!dbUser.getValidateCode().equals(form.getValidateCode())){
            errors.rejectValue("validateCode","user.signup.validateCode.error");
            if (!form.getPassword().equals(form.getRePassword())){
                errors.rejectValue("rePassword","user.signup.rePassword.error");
            }
            modelMap.addAttribute("form", form);
            modelMap.addAttribute("org.springframework.validation.BindingResult.form", errors);
            return "forward:/user/register";
        }else{
            if (!form.getPassword().equals(form.getRePassword())){
                errors.rejectValue("rePassword","user.signup.rePassword.error");
                modelMap.addAttribute("form", form);
                modelMap.addAttribute("org.springframework.validation.BindingResult.form", errors);
                return "forward:/user/register";
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
            String httpUrlString=getHttpUrlString(request,"register_success");
            try {
                response.sendRedirect(httpUrlString) ;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
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
        Cart cart=user==null?(getCart(session)==null?null:getCart(session)):user.getCart();
        session.setAttribute(Constant.CART,cart);
        return new ResponseEntity<Cart>(cart,HttpStatus.OK);
    }
    @RequestMapping(value = "/accounts/{userId}")
    public ResponseEntity<List<Account>> accounts(@PathVariable String userId,HttpSession session) {
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