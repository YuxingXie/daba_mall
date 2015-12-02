package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.CustomServletRequestWrapper;
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
import org.springframework.web.multipart.MultipartFile;
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
@RequestMapping("/order")
//@SessionAttributes("loginUser")
public class OrderController extends BaseRestSpringController {
    @Resource(name = "userDao")
    UserDao userDao;
    @Resource
    private RegisterValidateService registerValidateService;
    @Resource private CartService cartService;



    @RequestMapping(value = "/submit/{id}")
    public String orderSubmit(@PathVariable String id,HttpSession session,ModelMap model,RedirectAttributes redirectAttributes) {
        Order order = ServiceManager.orderService.findOrderById(id);
        session.setAttribute("order",order);
        return "redirect:/bill";
    }

    @RequestMapping(value = "/receive/{id}")
    public String orderReceive(@PathVariable String id,ModelMap model) {
        Order order = ServiceManager.orderService.findOrderById(id);
        model.addAttribute("order", order);
        return "order_receive";
    }
    @RequestMapping(value = "/evaluate/{id}")
    public String orderEvaluate(@PathVariable String id,ModelMap model) {
        Order order = ServiceManager.orderService.findOrderById(id);
        model.addAttribute("order", order);
        return "order_evaluate";
    }
    @RequestMapping(value = "/evaluate/product")
    public String orderProductEvaluate(@ModelAttribute ProductEvaluate productEvaluate,@RequestParam("files") MultipartFile[] files,HttpSession session) throws IOException {
        User user=getLoginUser(session);
        Assert.notNull(user);
        Order order=ServiceManager.orderService.findById(productEvaluate.getOrderId());
        if (order!=null&&order.getProductSelectedList()!=null){
            for (ProductSelected productSelected:order.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                if (productSeries!=null && productSeries.getId().equalsIgnoreCase(productEvaluate.getProductSeriesId())){
                    productEvaluate.setProductSeries(productSeries);
                    productEvaluate.setOrder(order);
                    productEvaluate.setUser(user);
                    if(files!=null&&files.length>0){
                        String dirStr="statics/img/user/evaluate";
                        ServletContext context= ProjectContext.getServletContext();
                        ServletContextResource dirResource=new ServletContextResource(context,dirStr);
                        File dirFile=dirResource.getFile();
                        if (!dirFile.exists() || !dirFile.isDirectory()){
                            dirFile.mkdirs();
                        }
                        //循环获取file数组中得文件
                        List<String> pictures=new ArrayList<String>();
                        for(int i = 0;i<files.length;i++){
                            MultipartFile file = files[i];
                            if (file.isEmpty()||file.getSize()==0l) continue;
                            //保存文件到数据库
                            String picture=ServiceManager.productSeriesService.saveFile(file.getOriginalFilename(),file.getBytes());
                            String originalFilename=file.getOriginalFilename();
                            String destFileStr=dirStr+"/"+picture+originalFilename.substring(originalFilename.lastIndexOf("."));
                            file.transferTo(new ServletContextResource(context,destFileStr).getFile());
                            pictures.add("pic/user/evaluate/"+picture);
                        }
                        if (pictures.size()>0) productEvaluate.setPictures(pictures);
                    }
                    ServiceManager.productEvaluateService.insert(productEvaluate);
                    productSelected.setProductEvaluate(productEvaluate);
//                    ServiceManager.orderService.update(order);
                    break;
                }
            }
        }
        return "redirect:/product_series/"+productEvaluate.getProductSeriesId();
    }
    @RequestMapping(value = "/receive_item",method = RequestMethod.GET)
    public String orderReceive(String id,Integer index,ModelMap model,RedirectAttributes redirectAttributes) {
        Assert.notNull(id);
        Assert.notNull(index);
        Order order = ServiceManager.orderService.findOrderById(id);
        ProductSelected productSelected=order.getProductSelectedList().get(index);
        productSelected.setReceiveStatus("y");
        ServiceManager.orderService.update(order);
        redirectAttributes.addFlashAttribute("order", order);
//        model.addAttribute("order", order);
        return "redirect:/order/receive/"+id;
    }
    @RequestMapping(value = "/pay", method = RequestMethod.POST)
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
        Assert.notNull(order.getUser());
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
                Account account0 = ServiceManager.accountService.findAccountsByUserIdAndCardNo(order.getUser().getId(),account.getCardNo());
                if (account0==null){
                    account.setUser(order.getUser());
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
    @RequestMapping(value = "/cancel")
    public String orderCancel(ModelMap model,HttpSession session) {
        Order order=session.getAttribute("order")==null?null:(Order)session.getAttribute("order");
        User user=getLoginUser(session);
        Assert.notNull(order.getId());
//        System.out.println("订单取消：" + order.getId());
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

}