package com.dabast.common.helper.service;
import com.dabast.mall.model.productseries.service.IProductSeriesService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
@Component
public class ServiceManager implements InitializingBean{

    private static boolean inited;
    public static IProductSeriesService productSeriesService;
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
}
