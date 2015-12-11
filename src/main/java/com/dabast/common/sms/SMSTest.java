package com.dabast.common.sms;


import com.dabast.common.util.MD5;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class SMSTest {

    private static final String addr = "http://api.sms.cn/mt/";
//    private static final String addr = "\"http://api.sms.cn/mtutf8";
    private static final String userId = "xieyuxing";

	/*
	 * 如uid是：test，登录密码是：123123
	 * 加密后：则加密串为  md5(123123test)=b9887c5ebb23ebb294acab183ecf0769
	 *
	 * 可用在线生成地址：http://www.sms.cn/password
	 */

    private static final String pwd = ("5dcd15557f05314072ad9f6e94b408d7");
    //5dcd15557f05314072ad9f6e94b408d7

    private static final String encode = "utf8";

    public static String send(String msgContent, String mobile) throws Exception {

        // 组建请求
        String straddr = addr + "?uid=" + userId + "&pwd=" + pwd + "&mobile="
                + mobile + "&encode=" + encode + "&content="
                + URLEncoder.encode(msgContent, "UTF-8");

        StringBuffer sb = new StringBuffer(straddr);
//        System.out.println("URL:" + sb);

        // 发送请求
        URL url = new URL(sb.toString());
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

        // 返回结果
        String inputline = in.readLine();
//        System.out.println("Response:" + inputline);
        String msg=inputline.substring(inputline.indexOf("stat=")+5,inputline.indexOf("stat=")+8);
        System.out.println(msg);
        return msg;
    }
    /**
     * 将返回状态编码转化为描述结果
     *
     *            打印信息
     * @param result
     *            状态编码
     * @return 描述结果
     */
    private static String getResponse(String result) {
        if (result.equals("100")) {
            return "发送成功";
        }
        if (result.equals("101")) {
            return "验证失败";
        }
        if (result.equals("102")) {
            return "短信不足";
        }
        if (result.equals("103")) {
            return "操作失败";
        }
        if (result.equals("104")) {
            return "非法字符";
        }
        if (result.equals("105")) {
            return "内容过多";
        }
        if (result.equals("106")) {
            return "号码过多";
        }
        if (result.equals("107")) {
            return "频率过快";
        }
        if (result.equals("108")) {
            return "号码内容空";
        }
        if (result.equals("109")) {
            return "账号冻结";
        }
        if (result.equals("110")) {
            return "禁止频繁单条发送";
        }
        if (result.equals("111")) {
            return "系统暂定发送";
        }
        if (result.equals("112")) {
            return "号码不正确";
        }
        if (result.equals("120")) {
            return "系统升级";
        }
        return result;
    }


    public static void main(String[] args) {
        try {
            send("您的验证码是565853。请在页面中提交验证码完成验证。【大坝生态】", "18974989697");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}