package com.dabast.common.util;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.nio.charset.Charset;

public class LocationUtil {
    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
//            JSONObject json = new JSONObject(jsonText);
            JSONObject json =  JSONObject.fromObject(jsonText);
            return json;
        } finally {
            is.close();
            // System.out.println("同时 从这里也能看出 即便return了，仍然会执行finally的！");
        }
    }
    public static void getAddressByIP()
    {
        try
        {
            String strIP = "202.163.126.12";
            URL url = new URL( "http://ip.qq.com/cgi-bin/searchip?searchip1=" + strIP);
            URLConnection conn = url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "GBK"));
            String line = null;
            StringBuffer result = new StringBuffer();
            while((line = reader.readLine()) != null)
            {
                result.append(line);
            }
            reader.close();
            System.out.println(result);
            strIP = result.substring(result.indexOf( "该IP所在地为：" ));
            strIP = strIP.substring(strIP.indexOf( "：") + 1);
            String province = strIP.substring(6, strIP.indexOf("省"));
            String city = strIP.substring(strIP.indexOf("省") + 1, strIP.indexOf("市"));
//            System.out.println(province);
//            System.out.println(city);
        }
        catch( IOException e)
        {
            e.printStackTrace();
        }

    }
    /**
     * @Title: getIpAddr
     * @author kaka  www.zuidaima.com
     * @Description: 获取客户端IP地址
     * @param @return
     * @return String
     * @throws
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
            if(ip.equals("127.0.0.1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ip= inet.getHostAddress();
            }
        }
        // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ip != null && ip.length() > 15){
            if(ip.indexOf(",")>0){
                ip = ip.substring(0,ip.indexOf(","));
            }
        }
        return ip;
    }
//    public static void main(String[] args) throws IOException, JSONException{
////        getAddressByIP();
//        //这里调用百度的ip定位api服务 详见 http://api.map.baidu.com/lbsapi/cloud/ip-location-api.htm
//        JSONObject json = readJsonFromUrl("http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=192.168.1.1");
//        System.out.println(json.toString());
//        System.out.println(((JSONObject) json.get("content")).get("address"));
//    }
}
