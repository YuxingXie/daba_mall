package com.dabast.mall.model.productseries.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.common.helper.service.ServiceManager;
import com.dabast.entity.Cart;
import com.dabast.entity.ProductSelected;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/7/29.
 */
@Repository
public class CartDao extends BaseMongoDao<Cart> {
    public Cart getCartByUserId(String id) {
        Cart cart=new Cart();
        List<ProductSelected> productSelectedList=new ArrayList<ProductSelected>();
        ProductSelected productSelected1=new ProductSelected();
        productSelected1.setAmount(3);
        productSelected1.setProductSeries(ServiceManager.productSeriesService.findById("5595f39fe7c7fa5690325b11"));
        productSelectedList.add(productSelected1);
        cart.setProductSelectedList(productSelectedList);
        cart.setUserId(id);
        return cart;
    }
}
