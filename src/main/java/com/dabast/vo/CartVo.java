package com.dabast.vo;

import com.dabast.entity.Cart;
import com.dabast.entity.User;

/**
 * Created by Administrator on 2015/9/14.
 */
public class CartVo extends Cart {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
