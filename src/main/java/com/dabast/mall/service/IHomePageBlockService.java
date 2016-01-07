package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.HomePageBlock;
import com.dabast.entity.ProductSeries;

/**
 * Created by Administrator on 2015/12/30.
 */
public interface IHomePageBlockService  extends IBaseEntityManager<HomePageBlock> {
    void removeProductSeries(ProductSeries productSeries);
}
