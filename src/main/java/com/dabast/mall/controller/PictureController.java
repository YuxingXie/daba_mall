package com.dabast.mall.controller;

import com.dabast.common.base.BaseRestSpringController;
import com.dabast.common.constant.Constant;
import com.dabast.common.helper.service.ProjectContext;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Cart;
import com.dabast.entity.Order;
import com.dabast.entity.User;
import com.mongodb.gridfs.GridFSDBFile;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.ServletContextResource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2015/6/11.
 */
@Controller
@RequestMapping("/pic")
//@SessionAttributes("loginUser")
public class PictureController extends BaseRestSpringController {

    private static Logger logger = LogManager.getLogger();
    @RequestMapping(value="/user/evaluate/{id}")
    public void showUserEvaluatePic(@PathVariable String id,HttpServletRequest request,HttpServletResponse response) {
        String dirStr="statics/img/user/evaluate";
        requestImage(id, request, response, dirStr);
    }

    @RequestMapping(value="/{id}")
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
//                        response.sendRedirect(path);
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







    @RequestMapping(value = "/cart/adjust")
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




    public static void main(String[] args) {
        String jsonStr = "[{id:100,name:'Johnson'},{id:101,name:'Jackson'}]";
    }
}