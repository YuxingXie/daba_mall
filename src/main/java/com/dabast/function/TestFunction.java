package com.dabast.function;

import com.dabast.entity.User;

/**
 * Created by Administrator on 2015/10/12.
 */
public class TestFunction {
    public static User test(String tt){
        User user=new User();
        user.setName(tt);
        System.out.println("test function");
        return user;
    }
}
