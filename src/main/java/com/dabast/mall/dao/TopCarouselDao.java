package com.dabast.mall.dao;

import com.dabast.common.base.BaseMongoDao;
import com.dabast.entity.TopCarousel;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/12/31.
 */
@Repository
public class TopCarouselDao extends BaseMongoDao<TopCarousel> {
    private static Logger logger = LogManager.getLogger();
    public TopCarousel findByMaxPriority() {
        DBObject dbObject=new BasicDBObject();
        return getMongoTemplate().findOne(new BasicQuery(dbObject).with(new Sort(Sort.Direction.ASC.DESC,"priority")).limit(1),TopCarousel.class);
    }
}
