package com.dabast.mall.model.productseries.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSeriesPrice;

import java.util.List;

/**
 * Created by Administrator on 2015/11/16.
 */
public interface IProductSeriesPriceService extends IBaseEntityManager<ProductSeriesPrice> {
    List<ProductSeriesPrice> findByProductSeriesId(String id);

    ProductSeriesPrice findCurrentPriceByProductSeriesId(String productSeriesId);
}
