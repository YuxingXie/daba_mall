package com.dabast.mall.view.index.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.*;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.Constant;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.model.productseries.dao.UserDao;
import com.dabast.mall.model.productseries.service.impl.CartService;
import com.dabast.mall.view.index.service.impl.RegisterValidateService;
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
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        if (session.getAttribute(Constant.LOGIN_USER)==null){
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
                User user = userDao.findByEmailOrPhone(name);
                if (user.getPassword().equalsIgnoreCase(password)) {
                    session.setAttribute(Constant.LOGIN_USER, user);
                    Cart cart=user.getCart();
                    if (cart.getProductSelectedList()!=null){

                    }
                    session.setAttribute(Constant.CART,cart);

                }
            }
        }

        List<String[]> top3 = ServiceManager.productSeriesService.getTop3ProductSeries();
        model.addAttribute("top3", top3);
        List<ProductSeries> hotSells = ServiceManager.productSeriesService.getHotSell();
        model.addAttribute("newProducts", hotSells);
        model.addAttribute("newProducts2", hotSells);
        model.addAttribute("hotSells", hotSells);
        model.addAttribute("hotSells2", hotSells);
        model.addAttribute("lowPrices", hotSells);
        model.addAttribute("lowPrices2", hotSells);
        ServiceManager.productStoreInAndOutService.clearNullUserInAndOut();
        return "index";
    }


    @RequestMapping(value = "/index/product/search")
    public String  searchProducts(ModelMap model,String keyWord,Integer page) {
        page=page==null?1:page;
        keyWord=keyWord==null?"":keyWord;
        Page<ProductSeries> productSeriesList=ServiceManager.productSeriesService.findProductSeriesesByKeyWord(keyWord,page);
        model.addAttribute("_page", productSeriesList);
        model.addAttribute("page", page);
        model.addAttribute("keyWord", keyWord);
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

    /**
     * 把一件商品添加到购物车
     * @param productSelected
     * @param session
     * @return
     */
    @RequestMapping(value = "/index/cart", method = RequestMethod.POST)
    public ResponseEntity<Cart> login(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
       if (session.getAttribute(Constant.CART)==null){
           cart=new Cart();
       }else{
           cart=(Cart)session.getAttribute(Constant.CART);
       }
        ProductSeries productSeries=ServiceManager.productSeriesService.findProductSeriesById(productSelected.getProductSeriesId());
        productSelected.setProductSeries(productSeries);
        ProductStoreInAndOut inAndOut=new ProductStoreInAndOut();
        inAndOut.setProductSeries(productSeries);
        inAndOut.setAmount(productSelected.getAmount());
        inAndOut.setType("out");
        inAndOut.setDate(new Date());
        inAndOut.setOperator(getLoginUser(session));
        ServiceManager.productStoreInAndOutService.insert(inAndOut);
        List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
       for(String productPropertyValueId : productSelected.getProductPropertyValueIds()){
           DBObject ppCon=new BasicDBObject();
           ProductPropertyValue value=ServiceManager.productPropertyValueService.findById(productPropertyValueId);
           ppCon.put("_id",value.getProductProperty().getId());
           ProductProperty productProperty=ServiceManager.productPropertyService.findOne(ppCon);
           value.setProductProperty(productProperty);
           productPropertyValueList.add(value);
       }
//        productSelected.((ProductPropertySelect[])ProductPropertyValueList.toArray(new ProductPropertySelect[ProductPropertyValueList.size()]));
        productSelected.setProductPropertyValueList(productPropertyValueList);
        cart.merge(productSelected);
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);
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
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
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
        User user= getLoginUser(session);
        user.setCart(cart);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, cart);
        return "redirect:/cart";
    }



    @RequestMapping(value = "/index/order/submit", method = RequestMethod.POST)
    public String orderSubmit( String  id,String acceptAddress,String payWay,String acceptPersonName, String contactPhone,
                              ModelMap model,RedirectAttributes redirectAttributes,HttpSession session) {
        Order order=ServiceManager.orderService.findById(id);
        if (acceptAddress!=null)order.setAcceptAddress(acceptAddress);
        if (payWay!=null)order.setPayWay(payWay);
        if (acceptPersonName!=null)order.setAcceptPersonName(acceptPersonName);
        if (contactPhone!=null)order.setContactPhone(contactPhone);
        order.setSubmitStatus("y");
        ServiceManager.orderService.update(order);
        User user=getLoginUser(session);
        order.setUser(user);
        order.setUserId(user.getId());
        session.setAttribute("order",order);
        return "redirect:/bill";
    }
    @RequestMapping(value="/pic/{id}")
    public void showPic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/product";
        ServletContext context= ProjectContext.getServletContext();
        ServletContextResource dirResource=new ServletContextResource(context,dirStr);

        try {
            File dirFile=dirResource.getFile();
            if (!dirFile.exists() || !dirFile.isDirectory()){
                System.out.println("make directory");
                dirFile.mkdirs();
            }
            String[] files=dirFile.list();
            if (files!=null){
                for (String fileInDir:files){
                    if (fileInDir.indexOf(id)>=0){
                        String path=new ServletContextResource(context,dirStr+"/"+fileInDir).getPath();
                        request.getRequestDispatcher(path+"?"+Math.random()).forward(request,response);
                        return;
                    }
                }
            }
            GridFSDBFile picture =ServiceManager.productSeriesService.findFileById(id);
            if (picture==null) {
                request.getRequestDispatcher("/statics/img/img_not_found.jpg").forward(request,response);
                return;
            }
            String suffix=picture.getFilename().substring(picture.getFilename().lastIndexOf("."));
            ServletContextResource resource=new ServletContextResource(context,dirStr+"/"+id+suffix);
            File file=resource.getFile();
            if (!file.exists()){
                file.createNewFile();
                picture.writeTo(resource.getFile());
            }
            String path=resource.getPath();
            request.getRequestDispatcher(path+"?"+Math.random()).forward(request,response);
            return;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping(value = "/order/submit/{id}")
    public String orderSubmit(@PathVariable String id,HttpSession session,ModelMap model,RedirectAttributes redirectAttributes) {

        User user=getLoginUser(session);
        Order order = ServiceManager.orderService.findOrderById(id);
//        model.addAttribute("order", order);
        order.setUser(user);
        order.setUserId(user.getId());
        session.setAttribute("order",order);
        return "redirect:/bill";
    }
    @RequestMapping(value = "/index/user/{id}")
    public ResponseEntity<User> get(ModelMap model, @PathVariable String id,HttpServletRequest request) {
        User user = new User();
        user.setName("Tom" + id);
        user.setHeight(100);
        user.setSex("f");
        Map<String,String[]> params=new CustomServletRequestWrapper(request).getParameterMap();
        Map<String,String[]> params2=request.getParameterMap();
        for (String key:params.keySet()){
            System.out.println("---------------------");
            String[] values=params.get(key);
            for (String value :values){
                System.out.println("key:"+key+",value:"+value);
            }
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
    @RequestMapping(value = "/order/pay", method = RequestMethod.POST)
    public String orderPay( @ModelAttribute Account account,String orderId, ModelMap model,HttpServletRequest request,RedirectAttributes redirectAttributes) throws IOException {
        /**
         * 付款成功系统需要做的事
         * 1.发送请求至外部接口，接收返回数据
         * 2.更新订单状态
         * 3.保存用户的账户信息（银行卡号）
         * 4.通知用户等待收货
         */
        Assert.notNull(orderId);
        Order order=ServiceManager.orderService.findById(orderId);
        Assert.notNull(order);
        Assert.notNull(order.getUserId());
        String payWay=order.getPayWay();
        Assert.notNull(payWay);
        //货到付款1，在线支付2，公司转账3，邮局汇款4
        if (payWay.equals("1")){
            order.setPayStatus("n");
        }else if (payWay.equals("2")){
//            String outUrl="http://127.0.0.1:8088/mall/index/user/test";
//            CustomServletRequestWrapper requestWrapper=new CustomServletRequestWrapper(request);
//            Map<String,String[]> requestParams=requestWrapper.getParameterMap();
//            String result=OuterRequestUtil.sendPost(outUrl,requestParams);
            if (ThirdPartPayUtil.isPaySuccess()){
                order.setPayStatus("y");
                Account account0 = ServiceManager.accountService.findAccountsByUserIdAndCardNo(order.getUserId(),account.getCardNo());
                if (account0==null){
                    account.setUserId(order.getUserId());
                    ServiceManager.accountService.insert(account);
                    order.setPayAccountId(account.getId());
                    order.setPayAccount(account);
                }else {
                    order.setPayAccountId(account0.getId());
                    order.setPayAccount(account0);
                }

            }else{
                order.setPayStatus("n");
            }

        }else if (payWay.equals("3")){
            order.setPayStatus("n");
        }else if (payWay.equals("4")){
            order.setPayStatus("n");
        }
        ServiceManager.orderService.update(order);
        redirectAttributes.addFlashAttribute("order",order);
        return "redirect:/pay_result";
    }
    @RequestMapping(value = "/order/cancel")
    public String orderCancel(ModelMap model,HttpSession session) {
        Order order=session.getAttribute("order")==null?null:(Order)session.getAttribute("order");
        User user=getLoginUser(session);
        Assert.notNull(order.getId());
        System.out.println("订单取消：" + order.getId());
        ServiceManager.orderService.removeById(order.getId());
        session.setAttribute("order", null);
        session.removeAttribute("order");
        Cart cart=new Cart();
        cart.setProductSelectedList(order.getProductSelectedList());
        user.setCart(cart);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART,cart);
        model.addAttribute(Constant.CART,cart);
        return "redirect:/cart";
    }
    @RequestMapping(value = "/index/order/delete/{id}", method = RequestMethod.GET)
    public String orderRemove(@PathVariable String id, ModelMap model, HttpSession session) {
        Assert.notNull(id);
        ServiceManager.orderService.removeById(id);
        return myOrders(model,session);
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
            Cart sessionCart=session.getAttribute(Constant.CART)==null?null:((Cart)(session.getAttribute(Constant.CART)));
           if (form.isMergeCart()){
               if (user.getCart()==null){
                   user.setCart(sessionCart);
               }else{
                   user.getCart().merge(sessionCart);
               }
               if (sessionCart!=null){
                   ServiceManager.userService.update(user);
               }
           }
            session.setAttribute(Constant.CART,user.getCart());
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
    public ResponseEntity loginUser(HttpSession session) {
        User user=getLoginUser(session);
//        System.out.println(new ResponseEntity<User>(user,HttpStatus.OK));
//        User test=new User();
//        test.setName("John");
//        user.setCart(null);
        return new ResponseEntity<User>(user,HttpStatus.OK);
    }

    @RequestMapping(value = "/index/personal_message")
    public String personalMessage(ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
//        User user=session.getAttribute("loginUser")==null?null:(User)session.getAttribute("loginUser");
        return "personal_message";
    }
    @RequestMapping(value = "/cart/adjust")
    public ResponseEntity adjust(@RequestBody Cart cart,ModelMap model, HttpSession session) {
        Assert.notNull(cart);
        User user=getLoginUser(session);

        user.setCart(cart);
        Order order=ServiceManager.orderService.insertOrder(user);
        if (cart.getProductSelectedList()!=null){
            for (ProductSelected productSelected:cart.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                ProductStoreInAndOut inAndOut=new ProductStoreInAndOut();
                inAndOut.setProductSeries(productSeries);
                inAndOut.setAmount(productSelected.getAmount());
                inAndOut.setType("out");
                inAndOut.setDate(new Date());
                inAndOut.setOperator(user);
                ServiceManager.productStoreInAndOutService.insert(inAndOut);
            }
        }


        user.setCart(null);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, null);
        session.removeAttribute(Constant.CART);
        session.setAttribute(Constant.LOGIN_USER,user);
        model.addAttribute("order", order);
        session.setAttribute("order", order);
        return new ResponseEntity<Order>(order,HttpStatus.OK);
    }
    @RequestMapping(value = "/cart/to_bill")
    public String toBill(ModelMap model, HttpSession session,HttpServletRequest request) {

        Order order=session.getAttribute("order")==null?null:(Order)session.getAttribute("order");
//        Order order=ServiceManager.orderService.findLastOrderByUserId(orderId);
        System.out.println(LocationUtil.getIpAddr(request));
//        model.addAttribute("order", order);
        return "redirect:/to_bill";
    }
    @RequestMapping(value = "/cart/to_bill/{orderId}")
    public String toBill(@PathVariable String orderId,ModelMap model, HttpSession session,HttpServletRequest request) {
        User user=getLoginUser(session);
        Order order = ServiceManager.orderService.findOrderById(orderId);
//        model.addAttribute("order", order);
        order.setUser(user);
        order.setUserId(user.getId());
        session.setAttribute("order",order);
        return "redirect:/to_bill";
    }
    @RequestMapping(value = "/index/my_orders")
    public String myOrders(ModelMap model, HttpSession session) {
        User user=getLoginUser(session);
        Order order=new Order();
        order.setUserId(user.getId());
        List<Order> orders=ServiceManager.orderService.findEquals(order);
        for (Order order1:orders){
            List<ProductSelected> productSelectedList=order1.getProductSelectedList();
            for (ProductSelected productSelected:productSelectedList){
//                ProductSeries productSeries=ServiceManager.productSeriesService.findById(productSelected.getProductSeriesId());
                ProductSeries productSeries=productSelected.getProductSeries();
                productSeries.setProductSeriesPrices(ServiceManager.productSeriesPriceService.findByProductSeriesId(productSeries.getId()));
//                productSelected.setProductSeries(productSeries);
                List<String> valueIds=productSelected.getProductPropertyValueIds();
                if (valueIds==null) continue;
                List<ProductPropertyValue> productPropertyValueList=new ArrayList<ProductPropertyValue>();
                for (String valueId:valueIds){
                    ProductPropertyValue productPropertyValue=ServiceManager.productPropertyValueService.findById(valueId);
                    productPropertyValueList.add(productPropertyValue);
                }
                productSelected.setProductPropertyValueList(productPropertyValueList);
            }
        }
        model.addAttribute("orders",orders);
        return "my_orders";
    }
    private User getLoginUser(HttpSession session) {
        return session.getAttribute(Constant.LOGIN_USER)==null?null:((User)(session.getAttribute(Constant.LOGIN_USER)));
    }
    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
    }
}