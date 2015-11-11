package com.dabast.common.helper.service;
import com.dabast.mall.model.productseries.service.*;
import com.mongodb.DBCollection;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
@Component
public class ServiceManager implements InitializingBean{

    private static boolean inited;
    public static IProductSeriesService productSeriesService;
    public static IProductPropertyService productPropertyService;
    public static ICartService cartService;
    public static IProductSubCategoryService productSubCategoryService;
    public static IProductPropertyValueService productPropertyValueService;
    public static IOrderService orderService;


    public static IUserService userService;
    public static IAccountService accountService;

    public void setAccountService(IAccountService accountService) {
        ServiceManager.accountService = accountService;
    }

    public void setOrderService(IOrderService orderService) {
        ServiceManager.orderService = orderService;
    }

    public static void setInited(boolean inited) {
        ServiceManager.inited = inited;
    }
    @Override
    public void afterPropertiesSet() throws Exception {
        inited = true;
    }
    public void setUserService(IUserService userService) {
        ServiceManager.userService = userService;
    }

    public void setProductSeriesService(IProductSeriesService productSeriesService) {
        ServiceManager.productSeriesService = productSeriesService;
    }

    public void setProductPropertyService(IProductPropertyService productPropertyService) {
        ServiceManager.productPropertyService = productPropertyService;
    }

    public void setCartService(ICartService cartService) {
        ServiceManager.cartService = cartService;
    }

    public void setProductSubCategoryService(IProductSubCategoryService productSubCategoryService) {
        ServiceManager.productSubCategoryService = productSubCategoryService;
    }

    public void setProductPropertyValueService(IProductPropertyValueService productPropertyValueService) {
        ServiceManager.productPropertyValueService = productPropertyValueService;
    }
}
