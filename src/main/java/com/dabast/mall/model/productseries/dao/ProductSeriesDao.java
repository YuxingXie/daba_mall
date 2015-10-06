package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.ProductProperty;
import com.dabast.entity.ProductSeries;
import com.dabast.vo.ProductSeriesVo;
import org.bson.types.ObjectId;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/6/11.
 */
@Repository
public class ProductSeriesDao extends BaseMongoDao<ProductSeries> {
    public List<String[]> getTop3ProductSeries() {
        List<String[]> list=new ArrayList<String[]>();
        String[] product1={"11111122228x1","statics/assets/temp/sliders/slide2/bg.jpg","黄材水产","新品上市","中华鲟","优惠价","25"};
        String[] product2={"0x1451112ffb","statics/assets/temp/sliders/slide5/bg.jpg","本地<br>生态腊鱼","货源充足，放心购买"};
        String[] product3={"4512f44d003f","statics/assets/temp/sliders/slide3/bg.jpg","正宗乡里腊肉","源自宁乡","您购买的不二选择","最新优惠价","149"};
        list.add(product1);
        list.add(product2);
        list.add(product3);
        return list;
    }

    public List<ProductSeries> getHotSell() {
        //可规定热卖商品数量
        List<ProductSeries> productSeriesList=findAll();

        return productSeriesList;
    }

    public ProductSeriesVo findProductSeriesById(ObjectId objectId) {
        ProductSeries productSeries=findById(objectId);
        ProductProperty queryEntity=new ProductProperty();
        queryEntity.setProductSeriesId(objectId.toString());
        List<ProductProperty> productProperties= ServiceManager.productPropertyService.findEquals(queryEntity);
//        for(ProductProperty productProperty:productProperties){
//            productProperty.getId();
//        }
//        productSeries.setProductProperties(productProperties);
        ProductSeriesVo productSeriesVo=new ProductSeriesVo();
        BeanUtils.copyProperties(productSeries,productSeriesVo);
        productSeriesVo.setProductProperties((ProductProperty[])productProperties.toArray(new ProductProperty[productProperties.size()]));
        return productSeriesVo;
    }

    public Page<ProductSeries> findProductSeriesesByKeyWord(String keyWord,int currentPage) {
//        Query query = new Query();
//        Criteria cr = new Criteria();
//        query.addCriteria(cr.orOperator(
//                Criteria.where("name").regex(".*?" + keyWord + ".*")
//                , Criteria.where("description").regex(".*?" + keyWord + ".*")
//        ));
//        return getMongoTemplate().find(query.limit(9), ProductSeries.class);

        Criteria criteria = new Criteria().orOperator(Criteria.where("name").regex(".*?" + keyWord + ".*") , Criteria.where("description").regex(".*?" + keyWord + ".*") );
        Query query = Query.query(criteria);
        Long count = getMongoTemplate().count(query, ProductSeries.class);
        int pageSize = 2;
        Pageable pageable = new PageRequest(currentPage, pageSize);
        query = query.limit(pageSize).skip((currentPage - 1) * pageSize);
        List<ProductSeries> list = getMongoTemplate().find(query, ProductSeries.class);
        Page<ProductSeries> page = new PageImpl<ProductSeries>(list, pageable, count);
//        System.out.println("关键字："+keyWord+",当前页："+currentPage+","+list.size()+"条记录，总共"+count+"条");
        return page;
    }
}
