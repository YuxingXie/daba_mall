package com.dabast.admin.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.*;
import com.dabast.mall.service.IOrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController extends BaseRestSpringController {
    private static Logger logger = LogManager.getLogger();
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
        Order updateOrder=new Order();
        updateOrder.setHandler(order.getHandler());
        updateOrder.setId(order.getId());
        Date now=new Date();
        if (order.getHandler()!=null&&order.getHandler()){
            updateOrder.setHandlerDate(now);
            updateOrder.setHandlerAdmin(getLoginAdministrator(session));
        }
        for (ProductSelected productSelected:order.getProductSelectedList()){
            HandlerInfo newHandlerInfo=productSelected.getNewHandlerInfo();
            if (newHandlerInfo==null) continue;
            List<HandlerInfo> handlerInfoList=productSelected.getHandlerInfoList();
            if (handlerInfoList==null||handlerInfoList.size()==0){
                handlerInfoList=new ArrayList<HandlerInfo>();
            }
            newHandlerInfo.setDate(now);
            handlerInfoList.add(newHandlerInfo);
            productSelected.setHandlerInfoList(handlerInfoList);
        }
        updateOrder.setProductSelectedList(order.getProductSelectedList());
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
    public ResponseEntity<Notify> postNotify(@RequestBody Order order,HttpSession session) {
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
        notify.setFromAdministrator(getLoginAdministrator(session));
        ServiceManager.notifyService.insert(notify);
        return new ResponseEntity<Notify>(notify,HttpStatus.OK);
    }
    @RequestMapping(value="/return_exchange_order/{id}")
    public String return_exchange_order(@PathVariable String id,ModelMap map,HttpSession session) {

        map.addAttribute("id",id);
        return "admin/order/return_exchange_order";
    }


}
