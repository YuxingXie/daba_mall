package com.dabast.support.vo;

import com.dabast.entity.User;

/**
 * 这个类用于用户修改email和phone
 */
public class PairUsers {
    private User firstUser;
    private User secondUser;

    public User getFirstUser() {
        return firstUser;
    }

    public void setFirstUser(User firstUser) {
        this.firstUser = firstUser;
    }

    public User getSecondUser() {
        return secondUser;
    }

    public void setSecondUser(User secondUser) {
        this.secondUser = secondUser;
    }
}
