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
//    http://www.dabast.com/mall/admin/order/toHandler
    @RequestMapping(value="/to_handler/data")
    public ResponseEntity<List<Order>>  orderToHandler() {
        List<Order> orders=ServiceManager.orderService.findUnHandlerOrders();
        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
    @RequestMapping(value="/handler")
    public ResponseEntity<List<Order>>orderHandler(@RequestBody Order order,HttpSession session) {
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
}
