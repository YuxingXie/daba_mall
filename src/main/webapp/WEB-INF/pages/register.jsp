<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<head>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
    <style>
        .error {
            margin: 0;
            padding: 0;
            color: #E94D1C
        }
        .info {
            margin: 0;
            padding: 0;
            color: #18e957;
            margin-left: 80px;
            margin-top: 10px;
            width: 100%;

        }
        .pw_weak{
            width: 50px;background: red;border-right: 1px #fff solid;display:inline-block;margin: 0px;
        }
        .pw_mid{
            width: 50px;background: orange;border-right: 1px #fff solid;display:inline-block;margin: 0px;
        }
        .pw_strong{
            width: 50px;background: #008000;border-right: 1px #fff solid;display:inline-block;margin: 0px;
        }
        .pw_un_reach{
            width: 50px; background: darkgray;border-right: 1px #fff solid;display:inline-block;margin: 0px;
        }
    </style>
</head>
<body>
<div class="main" ng-app="registerApp" ng-init='mailSending=false;mailSent=false;'>
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index/main">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">注册</li>
        </ul>

        <div class="row ">
            <div class="col-md-7 col-sm-7" >
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Description" data-toggle="tab">手机注册</a></li>
                    <li><a href="#Information" data-toggle="tab">邮箱注册</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                        <div class="content-form-page">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <form class="form-horizontal form-without-legend" role="form">
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">昵称 <span
                                                    class="require">*</span></label>

                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" name="userName"
                                                       placeholder="请输入您的昵称" novalidate="novalidate">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">手机号码 <span
                                                    class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" name="userName"
                                                       placeholder="请输入您的手机号码" novalidate="novalidate">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-lg-4 control-label">创建密码 <span
                                                    class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control"
                                                       name="password" placeholder="密码应由6-20个字符组成"
                                                       novalidate="novalidate">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-lg-4 control-label">创建密码 <span
                                                    class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control"
                                                       name="rePassword" placeholder="密码应由6-20个字符组成"
                                                       novalidate="novalidate">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-4 control-label">短信验证码 <span
                                                    class="require">*</span></label>
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

                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Information">
                        <div class="content-form-page">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <form:form name="signupForm" data-ng-controller="formController" modelAttribute="form"
                                          class="form-horizontal form-without-legend" role="form"
                                          action="${path}/user/register/email" ng-submit="signupForm()"
                                          novalidate="novalidate" _method="POST">
                                        <fieldset>
                                            <div class="form-group has-feedback">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">昵称<span class="require">*</span></label>
                                                    <div class="col-lg-8 has-success">
                                                        <form:input type="text" class="form-control" path="name"
                                                               ng-model="name"
                                                               placeholder="请输入您的昵称" required="true" ng-maxlength="20"/>
                                                        <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="col-lg-8 has-error"
                                                         ng-show="signupForm.name.$dirty &&signupForm.name.$invalid">
                                                        <label class="control-label" ng-show="signupForm.name.$error.required" for="name">
                                                            用户昵称必填</label>
                                                        <label class="control-label" ng-show="signupForm.name.$error.maxlength" for="name">
                                                            昵称不能超过20个字符</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">邮箱地址 <span class="require">*</span></label>
                                                    <div class="col-lg-8 has-success">
                                                        <form:input type="email" class="form-control" path="email" ng-model="email" placeholder="请输入您的邮箱地址" required="true" ensure_unique="{{email}}"/>
                                                        <span ng-show="signupForm.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="col-lg-8 has-error"
                                                         ng-show="signupForm.email.$dirty &&signupForm.email.$invalid">
                                                        <label class="control-label" ng-show="signupForm.email.$error.required">邮箱必填</label>
                                                        <label class="control-label" ng-show="signupForm.email.$error.email"> 请输入一个有效的邮箱</label>
                                                        <label class="control-label" ng-show="signupForm.email.$error.unique"> 该邮箱已被使用</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <div class="row">
                                                    <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                                    <div class="col-lg-8 has-success">
                                                        <form:input type="password" class="form-control" path="password" ng-model="password"
                                                               placeholder="请输入密码" required="true" ng-minlength="{{pw_min}}"/>
                                                        <span ng-show="signupForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="has-error col-lg-8" ng-show="signupForm.password.$dirty &&signupForm.password.$invalid">
                                                        <label class="control-label" ng-show="signupForm.password.$error.required">密码必填</label>
                                                        <label class="control-label" ng-show="signupForm.password.$error.minlength">密码最少需要{{pw_min}}个字符</label>
                                                    </div>
                                                    <div class="has-success col-lg-8" ng-show="signupForm.password.$valid">
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
                                                        <form:input type="password" class="form-control" path="rePassword"
                                                               ng-model="rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-minlength="{{pw_min}}"/>
                                                        <span ng-show="signupForm.rePassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="has-error col-lg-8" ng-show="signupForm.rePassword.$dirty &&signupForm.rePassword.$invalid">
                                                        <label class="control-label" ng-show="signupForm.rePassword.$error.required"> 必须确认密码</label>
                                                        <label class="control-label" ng-show="signupForm.rePassword.$error.minlength"> 密码最少需要{{pw_min}}个字符 </label>
                                                        <label class="control-label" ng-show="signupForm.rePassword.$error.pwmatch"> 两次密码必须相同</label>
                                                    </div>
                                                    <div class="col-lg-8 has-success" ng-show="signupForm.rePassword.$valid">
                                                        <label class="control-label"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">邮箱验证码 <span class="require">*</span></label>
                                                    <div class="col-lg-4 has-success">
                                                        <form:input type="text" class="form-control" email="{{email}}" path="validateCode" ng-model="validateCode" required="true"
                                                               ng-disabled="mailSending||(!mailSent)" ensure_validate_code="{{validateCode}}"/>
                                                        <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <button type="button"  class="btn btn-primary col-lg-12"
                                                                ng-disabled="signupForm.email.$invalid||(mailSending&&!mailSent)" data-ng-click="getValidCode()">获取验证码</button>
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
                                                    <div class="col-lg-4" ng-show="!mailSending&&mailSent&&signupForm.email.$valid">&nbsp;</div>
                                                    <%--前后这两个div一定要ng-show相同哦--%>
                                                    <div class="col-lg-8 has-success" ng-show="!mailSending&&mailSent&&signupForm.email.$valid">
                                                        <label class="control-label" >邮件发送成功，点击<a href="{{url}}" class="btn-primary btn-xs" target="_blank">这里</a>进入邮箱</label>
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
                    </div>
                </div>
            </div>

        </div>

        <!-- END CONTENT -->
    </div>
</div>
<script>var path="${path}"</script>
<script src="${path}/statics/assets/scripts/register.js"></script>
</body>
