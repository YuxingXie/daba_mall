package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.ProductPropertyValue;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/10/24.
 */
@Repository
public class ProductPropertyValueDao extends BaseMongoDao<ProductPropertyValue> {
    private static Logger logger = LogManager.getLogger();
}
