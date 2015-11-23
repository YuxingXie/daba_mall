package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductStore;
import com.dabast.entity.ProductStoreInAndOut;
import com.dabast.mall.model.productseries.dao.ProductStoreInAndOutDao;
import com.dabast.mall.model.productseries.service.IProductStoreInAndOutService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductStoreInAndOutService extends BaseEntityManager<ProductStoreInAndOut> implements IProductStoreInAndOutService {
    @Resource
    private ProductStoreInAndOutDao productStoreInAndOutDao;
    @Override
    protected EntityDao<ProductStoreInAndOut> getEntityDao() {
        return this.productStoreInAndOutDao;
    }

    @Override
    public List<ProductStoreInAndOut> findByProductSeries(ProductSeries productSeries) {
        return productStoreInAndOutDao.findByProductSeries(productSeries);
    }
    @Override
    public void clearNullUserInAndOut(){
        productStoreInAndOutDao.clearNullUserInAndOut();
    }
}
