package com.dabast.mall.form;

import com.dabast.entity.User;

import javax.validation.constraints.NotNull;

/**
 * Created by Administrator on 2015/7/4.
 */
public class UserLoginForm extends User {
    private boolean remember;
    @NotNull
    private String rePassword;
    @NotNull
    private String loginStr;

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    public String getLoginStr() {
        return loginStr;
    }

    public void setLoginStr(String loginStr) {
        this.loginStr = loginStr;
    }
}
