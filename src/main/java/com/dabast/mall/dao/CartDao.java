package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.Cart;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

//import com.dabast.entity.ProductPropertySelect;

/**
 * Created by Administrator on 2015/7/29.
 */
@Repository
public class CartDao extends BaseMongoDao<Cart> {
    private static Logger logger = LogManager.getLogger();
    public Cart getCartByUserId(String id) {
        //TODO
        return null;
//        Cart cart=new Cart();
//        List<ProductSelected> productSelectedList=new ArrayList<ProductSelected>();
//        ProductSelected productSelected1=new ProductSelected();
//        productSelected1.setRemain(3);
//        productSelected1.setProductSeriesId("5595f39fe7c7fa5690325b11");
//        ProductPropertySelect productPropertySelect=new ProductPropertySelect();
//        productPropertySelect.setProductPropertyId("5595f892e7c7fa5690325b12");
//        productPropertySelect.setSelectIndex(1);
//        productPropertySelect.setProductPropertyId("5595f892e7c7fa5690325b12");
//        ProductPropertySelect[] productPropertySelects=new ProductPropertySelect[1];
//        productPropertySelects[0]=productPropertySelect;
//        productSelected1.setProductPropertySelects(productPropertySelects);
//        productSelectedList.add(productSelected1);
//        cart.setProductSelectedList(productSelectedList);
//        cart.setUserId(id);
//        return null;
    }
}
