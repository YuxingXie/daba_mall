package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.ProductSeries;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
public interface IProductSeriesService  extends IBaseEntityManager<ProductSeries> {
    List<String[]> getTop3ProductSeries();

    List<ProductSeries> getHotSell();

    ProductSeries findProductSeriesById(ObjectId objectId);
    ProductSeries findProductSeriesById(String id);
    ProductSeries findProductSeriesByIdButEvaluate(String id,boolean ignoreEvaluate);
    Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord, int currentPage,int pageSize);

    List<ProductSeries> getNewProducts();

    List<ProductSeries> getLowPrices();
}
