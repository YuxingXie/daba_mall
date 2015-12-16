package com.dabast.common.pay;

import com.pingplusplus.Pingpp;
import com.pingplusplus.exception.*;
import com.pingplusplus.model.Charge;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2015/12/16.
 */
public class PingPlusPlusPay {
    public static void pay(){
        Pingpp.apiKey="sk_test_5mvjjT0mD8SSiTyzjLrL0mz9";
        Charge charge = null;
        Map<String, Object> chargeParams = new HashMap<String, Object>();
        chargeParams.put("order_no",  "123456789");
        chargeParams.put("amount", 100);
        Map<String, String> app = new HashMap<String, String>();
        app.put("id", "app_5Sm9SOW9eb18yf1G");
        chargeParams.put("app",app);
//        chargeParams.put("channel","alipay");
        chargeParams.put("channel","alipay_pc_direct");

        chargeParams.put("currency","cny");
        chargeParams.put("client_ip","127.0.0.1");
        chargeParams.put("subject","Your Subject");
        chargeParams.put("body","Your Body");
        try {
            //发起交易请求
            charge = Charge.create(chargeParams);
            System.out.println(charge);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public static void main(String[] args){
        pay();
    }
}
