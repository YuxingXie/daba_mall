<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="phoneForm" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <meta charset="utf-8">
    <title>用户手机注册</title>
    <link rel="shortcut icon" type="image/x-icon" href="${path}/statics/assets/img/logo.png"  media="screen" />
    <link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/password_strength.css" rel="stylesheet" type="text/css">
    <script> path="${path}";</script>
    <script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>

</head>
<body ng-controller="formController">
<div class="container" ng-init='sending=false;sent=false;'>
        <div class="row margin-top-112">
            <div class="center-block">
                <h3>大坝生态农业</h3>
                <h4>欢迎您使用<i class="fa fa-mobile fa-2x"></i>手机注册成为大坝用户</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-lg-1"></div>
            <div class="col-sm-9 col-lg-9 btn-group">
                <a class="btn btn-primary  fa fa-envelope" href="${path}/user/register_email" style="width: 100px;">邮箱注册</a>
                <a class="btn btn-primary disabled fa fa-mobile" href="#" style="width: 100px;">手机注册</a>
            </div>

        </div>
        <div class="row margin-top-10">
            <div class="col-md-7 col-sm-7" >

                <div class="content-form-page">
                    <form:form name="signupForm" modelAttribute="phoneForm"
                               role="form" action="${path}/user/register/phone"
                               class="form-horizontal form-without-legend" novalidate="novalidate" _method="POST" autocomplete="false">
                        <fieldset>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>

                                    <div class="col-lg-8 has-success">
                                        <%--<form:hidden path="id" class="form-control" ng-model="user.id" ng-init="user.id='${phoneForm.id}'"/>--%>
                                        <form:input path="id" ng-show="false" ng-model="user.id" ng-init="user.id='${phoneForm.id}'"/>
                                        <form:input path="name" class="form-control" ensure_name_unique="{{user.name}}" required="true"
                                                    ng-maxlength="20" ng-init="user.name='${phoneForm.name}'" ng-model="user.name"/>
                                        <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="name" class="control-label"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">&nbsp;</div>

                                    <div class="col-lg-8 has-error"
                                         ng-show="signupForm.name.$dirty &&signupForm.name.$invalid">
                                        <label class="control-label" ng-show="signupForm.name.$error.required" for="name">用户昵称必填</label>
                                        <label class="control-label" ng-show="signupForm.name.$error.maxlength" for="name">昵称不能超过20个字符</label>
                                        <label class="control-label" ng-show="signupForm.name.$error.unique" for="name">该昵称已被使用,或者输入太快</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">手机号码 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input type="tel" class="form-control" path="phone" ng-init="user.phone='${phoneForm.phone}'" ng-model="user.phone" placeholder="请输入11位手机号"
                                                    required="true" phone_number_valid="{{user.phone}}"  ensure_phone_unique="{{user.phone}}" autocomplete="false" maxlength="11"/>
                                        <span ng-show="signupForm.phone.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="phone" class="control-label"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">&nbsp;</div>
                                    <div class="col-lg-8 has-error" ng-show="signupForm.phone.$dirty &&signupForm.phone.$invalid">
                                        <label class="control-label" ng-show="signupForm.phone.$error.required">手机必填</label>
                                        <label class="control-label margin-left-20" ng-show="signupForm.phone.$error.validPhoneNumber"> 请输入一个有效的手机号</label>
                                        <label class="control-label margin-left-20" ng-show="signupForm.phone.$error.unique"> 该手机已被使用</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" path="password" id="password"
                                                    ng-init="user.password='${phoneForm.password}'" ng-model="user.password"
                                                    pw_check="#rePassword" placeholder="请输入密码" required="true" ng-minlength="{{pw_min}}"/>
                                        <span ng-show="signupForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="password" class="control-label"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">&nbsp;</div>
                                    <div class="has-error col-lg-8" ng-show="signupForm.password.$dirty &&signupForm.password.$invalid">
                                        <label class="control-label" ng-show="signupForm.password.$error.required">密码必填</label>
                                        <label class="control-label" ng-show="signupForm.password.$error.minlength">密码最少需要{{pw_min}}个字符</label>
                                    </div>
                                    <div class="has-success col-lg-8" ng-show="signupForm.password.$valid&&signupForm.password.$dirty">
                                        <label class="control-label">密码强度:
                                            <div class="{{cls1}}">&nbsp;</div><div class="{{cls2}}">&nbsp;</div><div class="{{cls3}}">&nbsp;</div>
                                            {{passwordStrength}}</label>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label for="password" class="col-lg-4 control-label">确认密码 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" id="rePassword" path="rePassword"
                                                    ng-init="user.rePassword='${phoneForm.rePassword}'"
                                                    ng-model="user.rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-disabled="!signupForm.password.$dirty"/>
                                        <span ng-show="signupForm.rePassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="rePassword" class="control-label"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">&nbsp;</div>
                                    <div class="has-error col-lg-8" ng-show="signupForm.rePassword.$dirty &&signupForm.rePassword.$invalid">
                                        <label class="control-label" ng-show="signupForm.rePassword.$error.required"> 必须确认密码</label>
                                            <%--<label class="control-label" ng-show="signupForm.rePassword.$error.minlength"> 密码最少需要{{pw_min}}个字符 </label>--%>
                                            <%--<label class="control-label" ng-show="signupForm.password.$invalid"> 请填写密码再进行确认</label>--%>
                                        <label class="control-label" ng-show="signupForm.password.$error.pwmatch &&signupForm.rePassword.$error.pwmatch"> 两次密码必须相同</label>
                                    </div>
                                    <div class="col-lg-8 has-success" ng-show="signupForm.rePassword.$valid && signupForm.password.$valid">
                                        <label class="control-label"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">图形验证码 <span class="require">*</span></label>
                                    <div ng-class="{'col-lg-4':true, 'has-error':signupForm.checkCode.$invalid,'has-success':signupForm.checkCode.$valid}">
                                            <%--(sending||(!sent))||--%>
                                        <input type="text" class="form-control" id="checkCode" name="checkCode" ng-model="checkCode" required="true" ensure_picture_validate_code="{{checkCode}}"/>
                                        <span ng-show="signupForm.checkCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-2">

                                            <img id="createCheckCode" src="${path}/user/identify_image">
                                      </div>
                                    <div class="col-lg-2">

                                        <button type="button" class="btn btn-primary" data-ng-click="reloadImg()">
                                            换一个<i class=" fa fa-refresh"></i>
                                        </button>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4" ng-show="signupForm.checkCode.$dirty&&signupForm.checkCode.$error.match">&nbsp;
                                    </div>
                                        <%--前后这两个div一定要ng-show相同哦--%>
                                    <div class="col-lg-8 has-error"
                                         ng-show="signupForm.checkCode.$dirty&&signupForm.checkCode.$error.match">
                                        <label class="control-label" >图形验证码错误！</label>
                                    </div>
                                    <div class="col-lg-4"  ng-show="signupForm.checkCode.$dirty&&signupForm.checkCode.$valid">&nbsp;</div>
                                        <%--前后这两个div一定要ng-show相同哦--%>
                                    <div class="col-lg-8 has-success"  ng-show="signupForm.checkCode.$dirty&&signupForm.checkCode.$valid">
                                        <label class="control-label" >图形验证码正确！</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">手机验证码 <span class="require">*</span></label>
                                    <div ng-class="{'col-lg-4':true, 'has-error':signupForm.validateCode.$invalid,'has-success':signupForm.validateCode.$valid}">
                                            <%--(sending||(!sent))||--%>
                                        <form:input type="text" class="form-control" phone="{{phone}}" path="validateCode"
                                                    ng-init="user.validateCode='${phoneForm.validateCode}'"
                                                    ng-model="user.validateCode" required="true"
                                                    ng-disabled="signupForm.phone.$invalid||signupForm.checkCode.$invalid"
                                                    ensure_phone_validate_code="{{user.validateCode}}" />

                                        <form:errors path="validateCode" class="control-label"/>

                                        <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-4">
                                        <button type="button"  class="btn btn-primary"
                                                ng-disabled="signupForm.phone.$invalid||signupForm.checkCode.$invalid||(sending&&!sent)||seconds>0" data-ng-click="getValidCode('phone')">
                                            获取验证码<span ng-if="seconds && seconds>0">,{{seconds}}秒后可重新获取</span><i ng-if="sending" class="fa fa-spin fa-spinner pull-right"></i>
                                        </button><span class="fa fa-warning" ng-if="sending">(如果一直处于发送中，可能是短信系统故障)</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4"
                                         ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)">&nbsp;</div>
                                        <%--前后这两个div一定要ng-show相同哦--%>
                                    <div class="col-lg-8 has-error"
                                         ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)">
                                        <label class="control-label" >验证码错误</label>
                                    </div>
                                    <div class="col-lg-4" ng-show="!sending&&sent&&signupForm.phone.$valid">&nbsp;</div>
                                        <%--前后这两个div一定要ng-show相同哦--%>
                                    <div class="col-lg-8 has-success" ng-show="!sending&&sent&&signupForm.phone.$valid">
                                        <label class="control-label" >短信发送成功</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-4 padding-left-0">
                                    <button type="submit" class="btn btn-primary col-lg-8" ng-disabled="signupForm.$invalid">提交</button>
                                </div>
                            </div>
                        </fieldset>

                    </form:form>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
</div>
<script src="${path}/statics/assets/plugins/angular-1.4.8/angular.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.4.8/angular-sanitize.min.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.4.8/angular-route.min.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/top.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.2.19/ui-bootstrap-tpls.min.js"></script>
<script>

    var mainApp=angular.module("mainApp",['ui.bootstrap', 'ngRoute','ngSanitize']);


</script>
<script src="${path}/statics/assets/scripts/form-validate.js"></script>
</body>
</html>
