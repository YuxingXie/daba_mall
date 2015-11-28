package com.dabast.mall.service.impl;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;

/**
 * Created by Administrator on 2015/11/28.
 */
public interface IProductEvaluateService extends IBaseEntityManager<ProductEvaluate> {
    ProductEvaluate findByOrderAndProductSeries(Order order, ProductSeries productSeries);
}
