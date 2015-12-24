package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.web.CookieTool;
import com.dabast.entity.*;
import com.dabast.mall.dao.UserDao;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
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
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/cart")
//@SessionAttributes("loginUser")
public class CartController extends BaseRestSpringController {
    @Resource(name = "userDao")
    private UserDao userDao;

    /**
     * 把一件商品添加到购物车
     * @param productSelected
     * @param session
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity<Cart> cart(@RequestBody ProductSelected productSelected,HttpSession session) {
        Cart cart=null;
        if (session.getAttribute(Constant.CART)==null){
            cart=new Cart();
        }else{
            cart=(Cart)session.getAttribute(Constant.CART);
        }
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
    @RequestMapping(value = "/cart2", method = RequestMethod.POST)
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

    /**
     * 更新购物车，暂用于顶部购物车点击删除按钮事件
     * @param cart
     * @param model
     * @param session
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/update", method = {RequestMethod.POST})
    public ResponseEntity<Cart> cartRemove(@RequestBody Cart cart, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        if (session.getAttribute(Constant.LOGIN_USER)!=null){
            User user=getLoginUser(session);
            user.setCart(cart);
            ServiceManager.userService.update(user);
        }
        session.setAttribute(Constant.CART, cart);
        ResponseEntity<Cart> cartResponseEntity=new ResponseEntity<Cart>(cart, HttpStatus.OK);
        return cartResponseEntity;
    }
    @RequestMapping(value = "/remove/{selectedIndex}", method = RequestMethod.GET)
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
    @RequestMapping(value = "/add_to_interest/{selectedIndex}", method = RequestMethod.GET)
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

//            cart.getProductSelectedList().remove(selectedIndex.intValue());
        }
//        user.setCart(cart);
//        ServiceManager.userService.update(user);
        session.setAttribute(Constant.CART, cart);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/adjust")
    public ResponseEntity<Order> adjust(@RequestBody Cart cart,ModelMap model, HttpSession session) {
        Assert.notNull(cart);
        User user=getLoginUser(session);
        Assert.notNull(user);
        /*********** save order ************/
        Order order=new Order();
        order.setUser(user);
        order.setOrderDate(new Date());
        order.setPayStatus("n");
        order.setProductSelectedList(cart.getProductSelectedList());
        ServiceManager.orderService.insert(order);
        /*********** update user ************/
        ServiceManager.userService.clearCart(user);
//        session.setAttribute(Constant.CART, null);
//        session.removeAttribute(Constant.CART);
        user.setCart(null);
        session.setAttribute(Constant.LOGIN_USER,user);
        model.addAttribute("order", order);
        session.setAttribute("order", order);
        return new ResponseEntity<Order>(order,HttpStatus.OK);
    }

}