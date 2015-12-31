package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.TopCarousel;
import com.dabast.mall.dao.TopCarouselDao;
import com.dabast.mall.service.ITopCarouselService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/12/31.
 */
@Service
public class TopCarouselService extends BaseEntityManager<TopCarousel> implements ITopCarouselService {
    @Resource
    private TopCarouselDao topCarouselDao;
    protected EntityDao<TopCarousel> getEntityDao() {
        return this.topCarouselDao;
    }

    @Override
    public TopCarousel findByMaxPriority() {
        return topCarouselDao.findByMaxPriority();
    }
}
