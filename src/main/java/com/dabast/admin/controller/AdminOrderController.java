package com.dabast.admin.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.common.util.IconCompressUtil;
import com.dabast.entity.*;
import com.dabast.mall.service.IOrderService;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Message;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController extends BaseRestSpringController {
    @Resource private IOrderService orderService;
    @RequestMapping(value="/to_handler/data")
    public ResponseEntity<List<Order>>  orderToHandler() {
        List<Order> orders=ServiceManager.orderService.findUnHandlerOrders();
        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
    @RequestMapping(value="/to_return_exchange/data")
    public ResponseEntity<List<Order>>  to_return_exchange() {
        List<Order> orders=ServiceManager.orderService.findReturnExchangeOrders();
        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
    @RequestMapping(value="/handler")
    public ResponseEntity<List<Order>> orderHandler(@RequestBody Order order,HttpSession session) {
        order.setHandler(true);
        order.setHandlerDate(new Date());
        Order updateOrder=new Order();
        updateOrder.setHandler(true);
        updateOrder.setHandlerDate(new Date());
        updateOrder.setId(order.getId());
        updateOrder.setHandlerAdmin(getLoginAdministrator(session));
        orderService.update(updateOrder);
        List<Order> orders=ServiceManager.orderService.findUnHandlerOrders();
        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
    @RequestMapping(value="/return_exchange_handler")
    public ResponseEntity<Order> return_exchange_handler(@RequestBody Order order,HttpSession session) {
        Order updateOrder=new Order();
        updateOrder.setId(order.getId());
        updateOrder.setProductSelectedList(order.getProductSelectedList());
        orderService.update(updateOrder);

        order=orderService.findById(order.getId());

        return new ResponseEntity<Order>(order,HttpStatus.OK);
    }
    @RequestMapping(value="/return_exchange_handler/postNotify")
    public ResponseEntity<Notify> postNotify(@RequestBody Order order) {
        Notify notify=new Notify();
        notify.setTitle("退换货处理通知");
        notify.setDate(new Date());
        notify.setToUser(order.getUser());
        StringBuffer sb=new StringBuffer("您的订单号为 "+order.getId()+" 的订单的退换货请求已被处理。\n");
        for (ProductSelected productSelected:order.getProductSelectedList()){
            if (productSelected.getReturnExchangeList()==null) continue;
            sb.append("商品名：").append(productSelected.getProductSeries().getName()).append("\n");
            for(ReturnExchange returnExchange:productSelected.getReturnExchangeList()){
                String type=returnExchange.getType().equals("return")?"退货":"换货";
                sb.append("要求").append(type).append("，数量：").append(returnExchange.getAmount());
                if (returnExchange.getReason()!=null)
                    sb.append(",理由：'").append(returnExchange.getReason()).append("'");
                sb.append("的请求");
                String handler=returnExchange.getHandler()==null?"仍未处理":(returnExchange.getHandler()?"已处理":"已重置为‘未处理’");
                sb.append(handler).append("\n");
            }
        }
        notify.setContent(sb.toString());
        notify.setNotifyType("administrator notify");
        ServiceManager.notifyService.insert(notify);
        return new ResponseEntity<Notify>(notify,HttpStatus.OK);
    }
    @RequestMapping(value="/return_exchange_order/{id}")
    public String return_exchange_order(@PathVariable String id,ModelMap map,HttpSession session) {

        map.addAttribute("id",id);
        return "admin/order/return_exchange_order";
    }


}
