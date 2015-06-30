package com.dabast.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lxd
 * Date: 11-5-19
 * Time: 下午1:49
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class EmptyHandler {
    @RequestMapping
    public void doRedirect(){
    }
}
