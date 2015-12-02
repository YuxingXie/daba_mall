package com.dabast.mall.service.impl;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.Order;
import com.dabast.entity.ProductEvaluate;
import com.dabast.entity.ProductSeries;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * Created by Administrator on 2015/11/28.
 */
public interface IProductEvaluateService extends IBaseEntityManager<ProductEvaluate> {
    ProductEvaluate findByOrderAndProductSeries(Order order, ProductSeries productSeries);

    Page<ProductEvaluate> findProductEvaluatesPageByProductSeries(ProductSeries productSeries, Integer page, int pageSize);

    Page<ProductEvaluate> findProductEvaluatesPageWithoutParentEvaluateByProductSeries(ProductSeries productSeries, Integer page, int pageSize);

    List<ProductEvaluate> findEvaluatesWithParentId(String evaluateId);
}
