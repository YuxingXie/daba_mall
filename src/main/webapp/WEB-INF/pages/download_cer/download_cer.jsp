<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">下载中心</a></li>
            <li class="active">下载根证书</li>
        </ul>
        <div class="row bg-success margin-bottom-20">
            <div class="col-lg-12 has-success">
                <h4><i class="fa fa-question-circle"></i>什么是根证书(SSL证书)</h4>
                <p><i class="fa fa-info-circle"></i>SSL 证书就是遵守 SSL协议，由受信任的数字证书颁发机构CA（如GlobalSign，wosign），在验证服务器身份后颁发，具有服务器身份验证和数据传输加密功能。</p>
                <p><i class="fa fa-info-circle"></i>主要用于发送安全电子邮件、访问安全站点、网上招标与投标、网上签约、网上订购、安全网上公文传送、网上办公、网上缴费、网上缴税以及网上购物等安全的网上电子交易活动。</p>
            </div>
        </div>

    <div class="row bg-success margin-bottom-20">
        <div class="col-lg-12 has-success">
            <h4><i class="fa fa-question-circle"></i>用在何处</h4>
            <p><i class="fa fa-info-circle"></i>我们仅在注册、登录及在线支付时使用SSL传输协议，以保护您的个人信息不被泄露。</p>
        </div>
    </div>
    <div class="row bg-success margin-bottom-20">
        <div class="col-lg-12 has-success">
            <h4><i class="fa fa-question-circle"></i>不安装根证书影响使用吗?</h4>
            <p><i class="fa fa-info-circle"></i>不安装根证书首先会出现安全警告（在不同浏览器下警告有所区别），一般情况下可以忽略警告继续使用，但是，由于我们制作的根证书是服务器客户端双向认证的证书，会出现服务器不信赖客户端而拒绝向客户端响应某些资源(比如图片等)的情况，从而导致页面显示不正常。</p>
        </div>
    </div>
    <div class="row bg-success margin-bottom-20">
        <div class="col-lg-12 has-success">
            <h4><i class="fa fa-question-circle"></i>如何安装</h4>
            <p><i class="fa fa-info-circle"></i>当您下载完成后，双击下载的"**.cer"文件，点击“安装证书...”按钮开始安装;</p>
            <p><i class="fa fa-info-circle"></i>点击“下一步”，在界面中选择“将所有的证书放入下列存储(P)”>>>“浏览(R)...”>>>选择“受信任的根证书颁发机构”。如下图所示：</p>
            <img src="${path}/statics/images/cer_install_1.png" />
            <img src="${path}/statics/images/cer_install_2.png" />
            <p class="padding-top-10"><i class="fa fa-info-circle"></i>点击“下一步”，直到提示安装成功。</p>
        </div>
    </div>
    <div class="row margin-bottom-20">
        <div class="col-lg-12">
            <a class="btn btn-primary btn-lg" href="${path}/index/download/cer"><i class="fa fa-download"></i>下载根证书</a>
        </div>
    </div>

    <div style="margin-top: 20px;"></div>
</div>

