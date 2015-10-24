package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductPropertyValue;
import com.dabast.mall.model.productseries.dao.ProductPropertyValueDao;
import com.dabast.mall.model.productseries.service.IProductPropertyValueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/10/24.
 */
@Service
public class ProductPropertyValueService extends BaseEntityManager<ProductPropertyValue> implements IProductPropertyValueService {
    @Resource
    private ProductPropertyValueDao productPropertyValueDao;
    protected EntityDao<ProductPropertyValue> getEntityDao() {
        return this.productPropertyValueDao;
    }

}
