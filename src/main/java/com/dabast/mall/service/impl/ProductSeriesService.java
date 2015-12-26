package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.ProductSeries;
import com.dabast.entity.ProductSubCategory;
import com.dabast.mall.dao.ProductSeriesDao;
import com.dabast.mall.service.IProductSeriesService;
import com.dabast.support.vo.Sortable;
import com.mongodb.DBObject;
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
    public ProductSeries findProductSeriesById(ObjectId objectId) {
        return productSeriesDao.findProductSeriesById(objectId);
    }
    @Override
    public ProductSeries findProductSeriesById(String id) {
        return productSeriesDao.findProductSeriesById(id);
    }
    @Override
    public ProductSeries findProductSeriesByIdButEvaluate(String id,boolean ignoreEvaluate) {
        return productSeriesDao.findProductSeriesByIdButEvaluate(new ObjectId(id), ignoreEvaluate);
    }
    @Override
    public Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord, int currentPage,int pageSize) {
        return productSeriesDao.findProductSeriesPageByKeyWord(keyWord, currentPage, pageSize);
    }

    @Override
    public Page<ProductSeries> findProductSeriesPageByProductSubCategory(ProductSubCategory productSubCategory, Integer page, int pageSize) {
        return productSeriesDao.findProductSeriesPageByProductSubCategory(productSubCategory,page,pageSize);
    }

    @Override
    public Page<ProductSeries> findProductSeriesPageByProductSubCategorySortByPrice(ProductSubCategory productSubCategory, int page, int size, Sortable sort) {
        return productSeriesDao.findProductSeriesPageByProductSubCategorySortByPrice(productSubCategory, page, size, sort);
    }

    @Override
    public Page<ProductSeries> findProductSeriesPageByProductSubCategoryWithSort(ProductSubCategory productSubCategory, int page, int size, Sortable sort) {
        return productSeriesDao.findProductSeriesPageByProductSubCategoryWithSort(productSubCategory, page, size, sort);
    }
    @Override
    public List<ProductSeries> getNewProducts(int count) {
        return productSeriesDao.getNewProducts(count);
    }

    @Override
    public List<ProductSeries> getLowPrices(int count) {
        return productSeriesDao.getLowPrices(count);
    }
    @Override
    public List<ProductSeries> getHotSell(int count) {
        return productSeriesDao.getHotSell(count);
    }

    @Override
    public List<ProductSeries> findProductSeriesAllRef(DBObject dbObject) {
        return productSeriesDao.findProductSeriesAllRef(dbObject);
    }
}
