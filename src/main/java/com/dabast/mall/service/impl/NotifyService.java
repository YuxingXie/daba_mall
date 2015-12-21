package com.dabast.mall.service.impl;

import com.dabast.common.base.BaseEntityManager;
import com.dabast.common.base.EntityDao;
import com.dabast.entity.Notify;
import com.dabast.mall.dao.NotifyDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2015/12/21.
 */
@Service
public class NotifyService extends BaseEntityManager<Notify> implements INotifyService {
    @Resource
    private NotifyDao notifyDao;
    protected EntityDao<Notify> getEntityDao() {
        return this.notifyDao;
    }
}
