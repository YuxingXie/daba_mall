package com.dabast.mall.form;

import com.dabast.entity.User;

/**
 * Created by Administrator on 2015/7/4.
 */
public class UserLoginForm extends User {
    private boolean remember;

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }
}
