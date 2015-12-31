package com.dabast.mall.service;

import com.dabast.common.base.IBaseEntityManager;
import com.dabast.entity.TopCarousel;

/**
 * Created by Administrator on 2015/12/31.
 */
public interface ITopCarouselService extends IBaseEntityManager<TopCarousel> {
    TopCarousel findByMaxPriority();
}
