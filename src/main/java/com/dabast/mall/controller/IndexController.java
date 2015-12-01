package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.*;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.Constant;
import com.dabast.mall.form.UserLoginForm;
import com.dabast.mall.dao.UserDao;
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
                    if (cart!=null && cart.getProductSelectedList()!=null){
                        for (ProductSelected productSelected:cart.getProductSelectedList()){
                            ProductSeries productSeries=productSelected.getProductSeries();
                            List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                            if (productSeries.getProductStore()!=null) productSeries.getProductStore().setInAndOutList(inAndOuts);
                        }
                    }
                    session.setAttribute(Constant.CART,cart);

                }
            }
        }

        List<String[]> top3 = ServiceManager.productSeriesService.getTop3ProductSeries();
        model.addAttribute("top3", top3);
        List<ProductSeries> hotSells = ServiceManager.productSeriesService.getHotSell();
        List<ProductSeries> newProducts = ServiceManager.productSeriesService.getNewProducts();
        List<ProductSeries> lowPrices = ServiceManager.productSeriesService.getLowPrices();
        model.addAttribute("newProducts", newProducts);
        model.addAttribute("newProducts2", newProducts);
        model.addAttribute("hotSells", hotSells);
        model.addAttribute("hotSells2", hotSells);
        model.addAttribute("lowPrices", lowPrices);
        model.addAttribute("lowPrices2", lowPrices);
        ServiceManager.productStoreInAndOutService.clearNullUserInAndOut();
        return "index";
    }


    @RequestMapping(value = "/index/product/search")
    public String  searchProducts(ModelMap model,String keyWord,Integer page) {
        page=page==null?1:page;
        keyWord=keyWord==null?"":keyWord;
        Page<ProductSeries> productSeriesListPage=ServiceManager.productSeriesService.findProductSeriesesByKeyWord(keyWord,page,3);
        if (productSeriesListPage.getTotalElements()==1l){
            ProductSeries productSeries=productSeriesListPage==null?null:productSeriesListPage.getContent()==null?null:productSeriesListPage.getContent().size()==0?null:productSeriesListPage.getContent().get(0);
            if (productSeries==null){
                model.addAttribute("_page", productSeriesListPage);
                model.addAttribute("page", page);
                model.addAttribute("keyWord", keyWord);
                return "search-result";
            }
            model.addAttribute("productSeries",productSeries);
            return "item";
        }else{
            model.addAttribute("_page", productSeriesListPage);
            model.addAttribute("page", page);
            model.addAttribute("keyWord", keyWord);
            return "search-result";
        }

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
    public ResponseEntity<Cart> cart(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
       if (session.getAttribute(Constant.CART)==null){
           cart=new Cart();
       }else{
           cart=(Cart)session.getAttribute(Constant.CART);
       }
        ProductSeries productSeries=ServiceManager.productSeriesService.findProductSeriesById(productSelected.getProductSeriesId());
        productSelected.setProductSeries(productSeries);
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
    @RequestMapping(value = "/index/cart2", method = RequestMethod.POST)
    public ResponseEntity<Cart> cart2(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        ProductSeries productSeries=ServiceManager.productSeriesService.findProductSeriesById(productSelected.getProductSeriesId());
        productSelected.setProductSeries(productSeries);
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
            ProductSelected productSelected=cart.getProductSelectedList().get(selectedIndex.intValue());

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
    @RequestMapping(value = "/cart/remove_to_interest/{selectedIndex}", method = RequestMethod.GET)
    public String removeToInterest(@PathVariable Integer selectedIndex, ModelMap model, HttpSession session) {
        User user= getLoginUser(session);
        Assert.notNull(user);
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
        if (cart.getProductSelectedList()!=null &&cart.getProductSelectedList().size()>selectedIndex){
            ProductSelected productSelected=cart.getProductSelectedList().get(selectedIndex.intValue());
            if (!ServiceManager.interestService.alreadyInterested(user,productSelected.getProductSeries())){
                Interest interest=new Interest();
                interest.setProductSeries(productSelected.getProductSeries());
                interest.setUser(user);
                ServiceManager.interestService.insert(interest);
            }

            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
        user.setCart(cart);
        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, cart);
        return "redirect:/cart";
    }


    @RequestMapping(value = "/index/order/submit", method = RequestMethod.POST)
    public String orderSubmit( String  id,String acceptAddress,String payWay,String acceptPersonName, String contactPhone,
                              ModelMap model,RedirectAttributes redirectAttributes,HttpSession session) {
        Order order=getOrder(session);
        if (order==null) order=ServiceManager.orderService.findById(id);
        if (acceptAddress!=null)order.setAcceptAddress(acceptAddress);
        if (payWay!=null)order.setPayWay(payWay);
        if (acceptPersonName!=null)order.setAcceptPersonName(acceptPersonName);
        if (contactPhone!=null)order.setContactPhone(contactPhone);
        order.setSubmitStatus("y");
        ServiceManager.orderService.update(order);
        session.setAttribute("order",order);
        return "redirect:/bill";
    }



    @RequestMapping(value="/pic/user/evaluate/{id}")
    public void showUserEvaluatePic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/user/evaluate";
        requestImage(id, request, response, dirStr);
    }

    @RequestMapping(value="/pic/{id}")
    public void showPic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/product";
        requestImage(id, request, response, dirStr);
    }

    private void requestImage(String id, HttpServletRequest request, HttpServletResponse response, String dirStr) {
        ServletContext context= ProjectContext.getServletContext();
        ServletContextResource dirResource=new ServletContextResource(context,dirStr);

        try {
            File dirFile=dirResource.getFile();
            if (!dirFile.exists() || !dirFile.isDirectory()){
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
            GridFSDBFile picture = ServiceManager.productSeriesService.findFileById(id);
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

    @RequestMapping(value = "/index/user/{id}")
    public ResponseEntity<User> get(ModelMap model, @PathVariable String id,HttpServletRequest request) {
        User user = new User();
        user.setName("Tom" + id);
        user.setHeight(100);
        user.setSex("f");
        Map<String,String[]> params=new CustomServletRequestWrapper(request).getParameterMap();
        Map<String,String[]> params2=request.getParameterMap();
//        for (String key:params.keySet()){
//            System.out.println("---------------------");
//            String[] values=params.get(key);
//            for (String value :values){
//                System.out.println("key:"+key+",value:"+value);
//            }
//        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
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
                   Cart userCart=user.getCart();
                   for (ProductSelected productSelected:userCart.getProductSelectedList()){
                       ProductSeries productSeries=productSelected.getProductSeries();
                       if(productSeries.getProductStore()==null) continue;
                       List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                       productSeries.getProductStore().setInAndOutList(inAndOuts);
                   }
                   userCart.merge(sessionCart);
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
        return "redirect:/to_bill";
    }
    @RequestMapping(value = "/cart/to_bill/{orderId}")
    public String toBill(@PathVariable String orderId,ModelMap model, HttpSession session,HttpServletRequest request) {
//        User user=getLoginUser(session);
        Order order = ServiceManager.orderService.findOrderById(orderId);
        Assert.notNull(order);
        if (order.getProductSelectedList()!=null ){
            for (ProductSelected productSelected:order.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                if (productSeries.getProductStore()!=null){
                    List<ProductStoreInAndOut> inAndOuts=ServiceManager.productStoreInAndOutService.findByProductSeries(productSeries);
                    productSeries.getProductStore().setInAndOutList(inAndOuts);
                }
            }
        }
        session.setAttribute("order",order);
        return "redirect:/to_bill";
    }
    @RequestMapping(value = "/index/my_orders")
    public String myOrders(ModelMap model, HttpSession session) {
        User user=getLoginUser(session);
        Order order=new Order();
        if (user==null){
            return null;
        }
        order.setUser(user);
        List<Order> orders=ServiceManager.orderService.findEquals(order);
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

    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
    }
}