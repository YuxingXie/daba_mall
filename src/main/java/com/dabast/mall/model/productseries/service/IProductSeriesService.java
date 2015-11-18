package com.dabast.mall.model.productseries.service;

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

    Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord, int currentPage);
}
