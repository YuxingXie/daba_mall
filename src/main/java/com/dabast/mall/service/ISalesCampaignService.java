package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.SalesCampaign;

/**
 * Created by Administrator on 2016/1/7.
 */
public interface ISalesCampaignService extends IBaseEntityManager<SalesCampaign> {
    void removeProductSeries(ProductSeries productSeries);
}
