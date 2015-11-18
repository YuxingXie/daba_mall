package com.dabast.mall.model.productseries.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeries;
import com.dabast.mall.model.productseries.dao.ProductSeriesDao;
import com.dabast.mall.model.productseries.service.IProductSeriesService;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Service
public class ProductSeriesService extends BaseEntityManager<ProductSeries> implements IProductSeriesService {
    @Resource
    private ProductSeriesDao productSeriesDao;
    protected EntityDao<ProductSeries> getEntityDao() {
        return this.productSeriesDao;
    }

    @Override
    public List<String[]> getTop3ProductSeries() {
        return productSeriesDao.getTop3ProductSeries();
    }

    @Override
    public List<ProductSeries> getHotSell() {
        return productSeriesDao.getHotSell();
    }

    @Override
    public ProductSeries findProductSeriesById(ObjectId objectId) {
        return productSeriesDao.findProductSeriesById(objectId);
    }
    @Override
    public ProductSeries findProductSeriesById(String id) {
        return productSeriesDao.findProductSeriesById(id);
    }
    @Override
    public Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord, int currentPage) {
        return productSeriesDao.findProductSeriesesByKeyWord(keyWord,currentPage);
    }
}
