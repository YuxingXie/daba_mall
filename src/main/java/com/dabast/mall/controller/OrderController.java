package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.BigDecimalUtil;
import com.dabast.common.util.MongoDbUtil;
import com.dabast.common.util.ThirdPartPayUtil;
import com.dabast.entity.*;
import com.dabast.mall.dao.UserDao;
import com.dabast.mall.service.impl.CartService;
import com.dabast.mall.service.impl.OrderService;
import com.dabast.mall.service.impl.RegisterValidateService;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.PingppException;
import com.pingplusplus.model.Charge;
import example.ChargeExample;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/order")
//@SessionAttributes("loginUser")
public class OrderController extends BaseRestSpringController {
    @Resource(name = "orderService")
    OrderService orderService;
    @Resource
    private RegisterValidateService registerValidateService;
    @Resource private CartService cartService;


    @RequestMapping(value = "/json/{id}")
    public ResponseEntity<Order> getOrderJson(@PathVariable String id) {
       Order order=orderService.findOrderById(id);
        ResponseEntity<Order> orderEntity=new ResponseEntity<Order>(order, HttpStatus.OK);
        return orderEntity;
    }
    @RequestMapping(value = "/delete/{id}")
    public String deleteOrder(@PathVariable String id,HttpSession session) {
        Assert.notNull(getLoginUser(session));
        orderService.removeOrderById(id);
        return "redirect:/order/my_orders";
    }

    @RequestMapping(value = "/my_orders")
    public String myOrders(ModelMap model, HttpSession session) {
        User user=getLoginUser(session);
        Assert.notNull(user);
        List<Order> orders=ServiceManager.orderService.findAll(new BasicQuery(new BasicDBObject("user",new DBRef("users",user.getId()))).with(new Sort(Sort.Direction.DESC,"orderDate")));
        for(Order order:orders){
            DBObject orderDBObject=new BasicDBObject("order",new DBRef("order",order.getId()));
            List<ProductEvaluate> evaluates=ServiceManager.productEvaluateService.findAll(orderDBObject);
            for (ProductSelected productSelected:order.getProductSelectedList()){
                ProductSeries productSeries=productSelected.getProductSeries();
                for (ProductEvaluate productEvaluate:evaluates){
                    if (productEvaluate.getProductSeries().getId().equals(productSeries.getId())){
                        productSelected.setProductEvaluate(productEvaluate);
                    }
                }
            }
        }
        model.addAttribute("orders",orders);
        return "my_orders";
    }
    @RequestMapping(value = "/my_paid_orders/json")
    public ResponseEntity<List<Order>> myOrdersJson( HttpSession session) {
        User user=getLoginUser(session);
        Assert.notNull(user);
        DBObject dbObject=new BasicDBObject("user",new DBRef("users",user.getId()));
        dbObject.put("payStatus","y");
        List<Order> orders=ServiceManager.orderService.findAll(new BasicQuery(dbObject).with(new Sort(Sort.Direction.DESC,"orderDate")));
        if (orders!=null){
            for(Order order:orders){
                MongoDbUtil.clearTransientFields(order);
            }
        }
        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
    /**
     * 提交订单(实际为更新订单)
     * @param form
     * @param errors
     * @param redirectAttributes
     * @param session
     * @return
     */
    @RequestMapping(value = "/do_submit", method = RequestMethod.POST)
    public String orderSubmit(@Valid @ModelAttribute Order form,BindingResult errors,ModelMap model,RedirectAttributesModelMap redirectAttributes,HttpSession session) {
        Assert.notNull(getLoginUser(session));
        if (errors.hasErrors()){
            Order dbForm=orderService.findOrderById(form.getId());
            form.setProductSelectedList(dbForm.getProductSelectedList());
            model.addAttribute("form", form);
            model.addAttribute("org.springframework.validation.BindingResult.form", errors);
            return "to_submit";
        }
        form.setSubmitStatus("y");
        ServiceManager.orderService.update(form);
//        redirectAttributes.addFlashAttribute("form", form);
        return "redirect:/order/to_bill/"+form.getId();
    }
    @RequestMapping(value = "/to_submit/{orderId}")
    public String toBill(@PathVariable String orderId,ModelMap model, HttpSession session) {

        User user=getLoginUser(session);
        Assert.notNull(user);
        Order form=orderService.findOrderById(orderId);
        Assert.isTrue(user.getId().equals(form.getUser().getId()));
        model.addAttribute("form",form);
        return "to_submit";
    }
    /**
     * 未使用
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/delete/json/{id}")
    public ResponseEntity<List<Order>> deleteOrderJson(@PathVariable String id,HttpSession session) {
        Assert.notNull(getLoginUser(session));
        orderService.removeById(id);
        List<Order> orders=orderService.findAll(new BasicDBObject("user",getLoginUser(session)));
        ResponseEntity<List<Order>> ordersEntity=new ResponseEntity<List<Order>>(orders, HttpStatus.OK);
        return ordersEntity;
    }

    @RequestMapping(value = "/evaluated")
    public ResponseEntity<Map> isEvaluated( String orderId,String productSeriesId) {
//        Order order=orderService.findById(orderId);
//        List<ProductSelected> productSelectedList=order.getProductSelectedList();
        Map<String,Object> map=new LinkedHashMap<String, Object>();
        boolean evaluated=false;
//        for (ProductSelected productSelected:productSelectedList){
//            ProductSeries productSeries=productSelected.getProductSeries();
//            if (productSeriesId.equals(productSeries.getId())){
//                evaluated=true;
//                break;
//            }
//        }
        Assert.notNull(orderId);
        Assert.notNull(productSeriesId);
        Order order=new Order();
        order.setId(orderId);
        ProductSeries productSeries=new ProductSeries();
        productSeries.setId(productSeriesId);
        DBObject dbObject=new BasicDBObject();
        dbObject.put("order",order);
        dbObject.put("productSeries",productSeries);
        List<ProductEvaluate> evaluates=ServiceManager.productEvaluateService.findAll(dbObject);
//        if (evaluates!=null &&evaluates.size()>0) evaluated=true;
        map.put("isEvaluated",evaluated);
        ResponseEntity<Map> entity=new ResponseEntity<Map>(map, HttpStatus.OK);
        return entity;
    }
    @RequestMapping(value = "/to_bill/{id}")
    public String orderSubmit(@PathVariable String id,HttpSession session,ModelMap model,RedirectAttributes redirectAttributes) {
        Order order = ServiceManager.orderService.findOrderById(id);
//        session.setAttribute("order",order);
        model.addAttribute("form",order);
        return "forward:/to_bill/to_bill.jsp";
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
                    productEvaluate.setDate(new Date());
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
                    productSeries.setEvaluateCount(productSeries.getEvaluateCount()+1);
                    ServiceManager.productSeriesService.update(productSeries);
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
    public ResponseEntity<Charge> orderPay( @RequestBody Order order, ModelMap model,HttpSession session,RedirectAttributes redirectAttributes) throws IOException {
        /**
         * 付款成功系统需要做的事
         * 1.发送请求至外部接口，接收返回数据
         * 2.更新订单状态
         * 3.保存用户的账户信息（银行卡号）
         * 4.通知用户等待收货
         */
        User user=getLoginUser(session);
        Assert.notNull(user);
        Assert.notNull(order);
        Assert.notNull(order.getId());
//        Order order=ServiceManager.orderService.findById(orderId);
//        Assert.notNull(order.getUser());
        String payWay=order.getPayWay();
        Assert.notNull(payWay);
        //货到付款1，在线支付2，公司转账3，邮局汇款4
        if (payWay.equals("1")){
            order.setPayStatus("n");
        }else if (payWay.equals("2")){
//            String outUrl="http://127.0.0.1:8088/mall/xxxxx";
//            CustomServletRequestWrapper requestWrapper=new CustomServletRequestWrapper(request);
//            Map<String,String[]> requestParams=requestWrapper.getParameterMap();
//            String result=OuterRequestUtil.sendPost(outUrl,requestParams);

            Pingpp.apiKey = ChargeExample.apiKey;
            ChargeExample ce = new ChargeExample();
            System.out.println("---------创建 charge");
//                Charge charge = ce.charge();
            Charge charge = null;
            Map<String, Object> chargeMap = new HashMap<String, Object>();
            chargeMap.put("amount", 10);
            chargeMap.put("currency", "cny");
            chargeMap.put("subject", "Your Subject");
            chargeMap.put("body", "Your Body");
            chargeMap.put("order_no", order.getId());
            chargeMap.put("channel", "alipay");
            chargeMap.put("channel", "alipay_pc_direct");
            chargeMap.put("client_ip", "127.0.0.1");
            Map extra=new HashMap<String,String>();
            extra.put("success_url","http://www.dabast.com/order/to_bill/565bc67335f0d102e85d21d9");
            chargeMap.put("extra", extra);
//        chargeMap.put("success_url", "http://localhost:8088/mall/order/to_bill/565bc67335f0d102e85d21d9");
            Map<String, String> app = new HashMap<String, String>();
            app.put("id",ChargeExample.appId);
            chargeMap.put("app", app);
            try {
                //发起交易请求
                charge = Charge.create(chargeMap);
                System.out.println(charge);
                order.setPayStatus("y");
                Account account0 = ServiceManager.accountService.findAccountsByUserIdAndCardNo(user.getId(),order.getPayAccount().getCardNo());
                if (account0==null){
                    Account account=order.getPayAccount();
                    account.setUser(user);
                    ServiceManager.accountService.insert(account);
                    order.setPayAccount(account);
                }else {
                    order.setPayAccount(account0);
                }
                order.setPayDate(new Date());
                ServiceManager.orderService.update(order);
                updateProductSeriesSales(order);
                redirectAttributes.addFlashAttribute("order",order);
                return new ResponseEntity<Charge>(charge,HttpStatus.OK);
            } catch (PingppException e) {
                e.printStackTrace();
            }
        }else if (payWay.equals("3")){
            order.setPayStatus("n");
        }else if (payWay.equals("4")){
            order.setPayStatus("n");
        }
        return null;
    }

    public void updateProductSeriesSales(Order order) {
        order=orderService.findById(order.getId());//如果页面出入的值包含productSelectedList则可省去查询
        List<ProductSelected> productSelectedList=order.getProductSelectedList();
        Assert.notNull(productSelectedList);
        Map<String,Integer> salesMap=new HashMap<String, Integer>();
        for (ProductSelected productSelected:productSelectedList){
            ProductSeries productSeries=productSelected.getProductSeries();
            Assert.notNull(productSeries);
            if (!salesMap.containsKey(productSeries.getId())){
                Integer sales=productSeries.getSales()==null?0:productSeries.getSales();
                salesMap.put(productSeries.getId(),sales+productSelected.getAmount());
            }else{
                int sales=salesMap.get(productSeries.getId());
                sales+=productSelected.getAmount();
                salesMap.put(productSeries.getId(),sales);//覆盖
            }
        }
        for(String productSeriesId:salesMap.keySet()){
            ProductSeries update=new ProductSeries();
            update.setSales(salesMap.get(productSeriesId));
            update.setId(productSeriesId);
            ServiceManager.productSeriesService.update(update);
        }
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