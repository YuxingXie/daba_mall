<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index/main">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">注册</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">


            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-9" style=" margin-left:13%; margin-right:13%;">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Description" data-toggle="tab">手机注册</a></li>
                    <li><a href="#Information" data-toggle="tab">邮箱注册</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                        <div class="content-form-page">
                            <div class="row">
                                <div class="col-md-7 col-sm-7">
                                    <form class="form-horizontal form-without-legend" role="form">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" name="userName" placeholder="请输入您的昵称">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-lg-4 control-label">手机号码 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" name="userName" placeholder="请输入您的手机号码">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-lg-4 control-label">创建密码 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control" id="password"  placeholder="密码应由6-20个字符组成">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">短信验证码 <span class="require">*</span></label>
                                            <div class="col-lg-4">
                                                <input type="text" class="form-control" name="userName">
                                            </div>
                                            <div class="col-lg-4">
                                                <button type="submit" class="btn btn-primary col-lg-12">获取验证码</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8 col-md-offset-4 padding-left-0">
                                                <button type="submit" class="btn btn-primary col-lg-8">完成注册</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-10 padding-right-30">
                                                <hr>
                                                <div class="login-socio">
                                                    <p class="text-muted">其它方式登录:</p>
                                                    <ul class="social-icons">
                                                        <li><a href="#" data-original-title="txqq" class="txqq" title="腾讯QQ"></a></li>
                                                        <li><a href="#" data-original-title="xlwb" class="xlwb" title="新浪微博"></a></li>
                                                        <li><a href="#" data-original-title="rrw" class="rrw" title="人人网"></a></li>
                                                        <li><a href="#" data-original-title="wx" class="wx" title="微信"></a></li>
                                                        <li><a href="#" data-original-title="zfb" class="zfb" title="支付宝"></a></li>
                                                        <li><a href="#" data-original-title="wy" class="wy" title="网易"></a></li>
                                                        <li><a href="#" data-original-title="txwb" class="txwb" title="腾讯微博"></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-4 col-sm-4 pull-right">
                                    <div class="form-info">
                                        <h2><em>新用户注册</em></h2>
                                        <p>已有超过198万人注册大坝生态</p><p>立即注册，成为第1986165位会员</p><p>大坝会员享受更多优惠。</p><p>会员将得到大坝热销产品打折特权</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Information">
                        <div class="content-form-page">
                            <div class="row">
                                <div class="col-md-7 col-sm-7">
                                    <form class="form-horizontal form-without-legend" role="form" action="${path}/user/register/email">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" name="userName" placeholder="请输入您的昵称">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">邮箱地址 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="email" class="form-control" name="userName" placeholder="请输入您的邮箱地址">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-lg-4 control-label">新密码 <span class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control" name="password"  placeholder="密码应由6-20个字符组成">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">邮箱验证码 <span class="require">*</span></label>
                                            <div class="col-lg-4">
                                                <input type="text" class="form-control" name="userName">
                                            </div>
                                            <div class="col-lg-4">
                                                <button type="submit" class="btn btn-primary col-lg-12">获取验证码</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8 col-md-offset-4 padding-left-0">
                                                <button type="submit" class="btn btn-primary col-lg-8">完成注册</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-10 padding-right-30">
                                                <hr>
                                                <div class="login-socio">
                                                    <p class="text-muted">其它方式登录:</p>
                                                    <ul class="social-icons">
                                                        <li><a href="#" data-original-title="txqq" class="txqq" title="腾讯QQ"></a></li>
                                                        <li><a href="#" data-original-title="xlwb" class="xlwb" title="新浪微博"></a></li>
                                                        <li><a href="#" data-original-title="rrw" class="rrw" title="人人网"></a></li>
                                                        <li><a href="#" data-original-title="wx" class="wx" title="微信"></a></li>
                                                        <li><a href="#" data-original-title="zfb" class="zfb" title="支付宝"></a></li>
                                                        <li><a href="#" data-original-title="wy" class="wy" title="网易"></a></li>
                                                        <li><a href="#" data-original-title="txwb" class="txwb" title="腾讯微博"></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-4 col-sm-4 pull-right">
                                    <div class="form-info">
                                        <h2><em>新用户注册</em></h2>
                                        <p>已有超过198万人注册大坝生态</p><p>立即注册，成为第1986165位会员</p><p>大坝会员享受更多优惠。</p><p>会员将得到大坝热销产品打折特权</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <!-- END CONTENT -->
    </div>
</div>