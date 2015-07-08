package com.dabast.mall.view.index.service.impl;

import com.dabast.common.code.EmailEnum;
import com.dabast.common.util.MD5;
import com.dabast.common.web.SendEmail;
import com.dabast.entity.User;
import com.dabast.mall.model.productseries.dao.UserDao;
import org.apache.avalon.framework.service.ServiceException;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;
import org.bson.types.ObjectId;
import org.springframework.stereotype.Service;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;

/**
 * Created by Administrator on 2015/7/6.
 */
@Service
public class RegisterValidateService {
    @Resource
    private UserDao userDao;

    /**
     * 处理注册
     */

    public String processRegister(String registerUrl, String email) {
        Long as = 5480l;
        User user = new User();
        user.setId(new ObjectId());
        user.setRegisterTime(new Date());
        user.setStatus(0);
        user.setEmail(email);
        ///如果处于安全，可以将激活码处理的更复杂点，这里我稍做简单处理

        ///邮件的内容
        StringBuffer sb = new StringBuffer("<p>您的大坝生态邮箱注册验证码是:");
        int validateCode=(int)(Math.random()*999999-99999);
        user.setValidateCode(""+validateCode);
        sb.append("<font color='red'>").append(validateCode).append("</font></p>");
        sb.append("<p>验证码有效时间为30分钟。</p>");

        //发送邮件
        HtmlEmail htmlEmail = new HtmlEmail();
        htmlEmail.setHostName("smtp.qq.com");//设置使用发电子邮件的邮件服务器
        htmlEmail.setAuthentication("185246042", "xieyuxing1978");
        htmlEmail.setCharset("UTF-8");
        htmlEmail.setSubject("大坝生态账号激活");
        htmlEmail.getBounceAddress();
        String msg=null;
        try {
            htmlEmail.addTo(email);
            htmlEmail.setFrom("185246042@qq.com");
            htmlEmail.setMsg(sb.toString());
            htmlEmail.send();


            userDao.insert(user);//保存注册信息,如果发送邮件抛出异常，不会保存
            String code=email.indexOf("@")>=0?email.substring(email.indexOf("@")+1):"";
            String url= EmailEnum.getUrlByCode(code);
            msg="邮件成功发送到您的邮箱";
            if (url!=null) msg+=",<a href='"+url+"' target='_blank'>进入邮箱</a>";
        }
        catch (EmailException ex) {
            ex.printStackTrace();
            msg="对不起，服务器发送邮件时出现异常，请稍后再试!";
        }
        return msg;
    }

    /**
     * 处理激活
     *
     * @throws ParseException
     */
    ///传递激活码和email过来
    public void processActivate(String email, String validateCode) throws ServiceException, ParseException {
        //数据访问层，通过email获取用户信息
        User user = userDao.findByEmail(email);
        //验证用户是否存在
        if (user != null) {
            //验证用户激活状态
            if (user.getStatus() == 0) {
                ///没激活
                Date currentTime = new Date();//获取当前时间
                //验证链接是否过期
                currentTime.before(user.getRegisterTime());
                if (currentTime.before(user.getLastActivateTime())) {
                    //验证激活码是否正确
                    if (validateCode.equals(user.getValidateCode())) {
                        //激活成功， //并更新用户的激活状态，为已激活
                        System.out.println("==sq===" + user.getStatus());
                        user.setStatus(1);//把状态改为激活
                        System.out.println("==sh===" + user.getStatus());
                        userDao.update(user);
                    } else {
                        throw new ServiceException("激活码不正确");
                    }
                } else {
                    throw new ServiceException("激活码已过期！");
                }
            } else {
                throw new ServiceException("邮箱已激活，请登录！");
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }

    }
}
