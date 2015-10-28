package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductProperty;
import com.dabast.mall.model.productseries.dao.ProductPropertyDao;
import com.dabast.mall.model.productseries.service.IProductPropertyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/7/3.
 */
@Service
public class ProductPropertyService extends BaseEntityManager<ProductProperty> implements IProductPropertyService {
    @Resource
    private ProductPropertyDao productPropertyDao;
    protected EntityDao<ProductProperty> getEntityDao() {
        return this.productPropertyDao;
    }

    @Override
    public List<ProductProperty> getProductPropertiesByProductSeriesId(String productSeriesId) {
        return productPropertyDao.getProductPropertiesByProductSeriesId(productSeriesId);
    }
}
