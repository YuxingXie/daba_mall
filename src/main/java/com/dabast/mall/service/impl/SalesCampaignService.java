package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.SalesCampaign;
import com.dabast.mall.dao.SalesCampaignDao;
import com.dabast.mall.service.ISalesCampaignService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/1/7.
 */
@Service
public class SalesCampaignService extends BaseEntityManager<SalesCampaign> implements ISalesCampaignService {
    @Resource
    private SalesCampaignDao salesCampaignDao;
    protected EntityDao<SalesCampaign> getEntityDao() {
        return this.salesCampaignDao;
    }

    @Override
    public void removeProductSeries(ProductSeries productSeries) {
        salesCampaignDao.removeProductSeries(productSeries);
    }
}
