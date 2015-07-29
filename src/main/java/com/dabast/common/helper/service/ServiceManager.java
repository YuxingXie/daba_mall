package com.dabast.common.helper.service;
import com.dabast.mall.model.productseries.service.ICartService;
import com.dabast.mall.model.productseries.service.IProductPropertyService;
import com.dabast.mall.model.productseries.service.IProductSeriesService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
@Component
public class ServiceManager implements InitializingBean{

    private static boolean inited;
    public static IProductSeriesService productSeriesService;
    public static IProductPropertyService productPropertyService;
    public static ICartService cartService;


    public static void setInited(boolean inited) {
        ServiceManager.inited = inited;
    }
    @Override
    public void afterPropertiesSet() throws Exception {
        inited = true;
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
}
