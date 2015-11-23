package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductStore;
import com.dabast.entity.ProductStoreInAndOut;

import java.util.List;

/**
 * Created by Administrator on 2015/11/23.
 */
public interface IProductStoreInAndOutService extends IBaseEntityManager<ProductStoreInAndOut> {
    List<ProductStoreInAndOut> findByProductSeries(ProductSeries productSeries);
}
