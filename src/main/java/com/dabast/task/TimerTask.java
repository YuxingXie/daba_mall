package com.dabast.task;

import com.dabast.mall.service.impl.OrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class TimerTask {
    @Resource
    private OrderService orderService;
    private static Logger logger = LogManager.getLogger();
    public void printTimeStamp(){
        Calendar ca= Calendar.getInstance();
        ca.setTimeInMillis(System.currentTimeMillis());
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS ", Locale.CHINA);
        //显示当前时间 精确到毫秒
        logger.info(sdf.format(ca.getTime()));
    }
    public TimerTask(){
//        this.printTimeStamp();
        logger.info("计划任务被初始化了");
    }
    public void doTask(){
//        this.printTimeStamp();
//        System.out.print("计划任务被执行,线程id:");
//        System.out.println(Thread.currentThread().getId());
        long ago=1000*60*60*24*7;
        orderService.removeOrderInterval(ago);
    }
    public static void main(String[] args){
        String longStr="1000*60*60*24*7";

    }
}