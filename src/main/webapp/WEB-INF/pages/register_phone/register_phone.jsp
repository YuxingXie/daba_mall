<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="phoneForm" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" id="registerAppMain" ng-init='sending=false;sent=false;'>
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">用户中心</a></li>
            <li class="active">注册</li>
        </ul>

        <div class="row ">
            <div class="col-md-7 col-sm-7" >
                <div class="btn-group">
                    <a class="btn btn-primary active" href="${path}/register_email">邮箱注册</a>
                    <a class="btn btn-primary disabled" href="#">手机注册</a>
                </div>
                <div class="content-form-page" data-ng-controller="formController">
                    <form:form name="signupForm" modelAttribute="phoneForm"
                               role="form" action="${path}/user/register/phone"
                               class="form-horizontal form-without-legend" novalidate="novalidate" _method="POST" autocomplete="false">
                        <fieldset>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>

                                    <div class="col-lg-8 has-success">
                                        <form:input path="name" class="form-control" ensure_name_unique="{{name}}" required="true" ng-maxlength="20" ng-init="name='${phoneForm.name}'" ng-model="name"/>
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
                                        <label class="control-label" ng-show="signupForm.name.$error.unique" for="name">该昵称已被使用</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">手机号码 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input type="tel" class="form-control" path="phone" ng-init="phone='${phoneForm.phone}'" ng-model="phone" placeholder="请输入您的手机号"
                                                    required="true" ensure_phone_unique="{{phone}}" autocomplete="false"/>
                                        <span ng-show="signupForm.phone.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="phone" class="control-label"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">&nbsp;</div>
                                    <div class="col-lg-8 has-error"
                                         ng-show="signupForm.phone.$dirty &&signupForm.phone.$invalid">
                                        <label class="control-label" ng-show="signupForm.phone.$error.required">手机必填</label>
                                        <label class="control-label" ng-show="signupForm.phone.$error.phone"> 请输入一个有效的手机号</label>
                                        <label class="control-label" ng-show="signupForm.phone.$error.unique"> 该手机已被使用</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" path="password" id="password" ng-init="password='${phoneForm.password}'" ng-model="password"
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
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" id="rePassword" path="rePassword" ng-init="rePassword='${phoneForm.rePassword}'"
                                                    ng-model="rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-disabled="!signupForm.password.$dirty"/>
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
                                    <label class="col-lg-4 control-label">手机验证码 <span class="require">*</span></label>
                                    <div class="col-lg-4 has-error">
                                            <%--(sending||(!sent))||--%>
                                        <form:input type="text" class="form-control" phone="{{phone}}" path="validateCode"
                                                    ng-init="validateCode='${phoneForm.validateCode}'"
                                                    ng-model="validateCode" required="true"
                                                    ng-disabled="signupForm.phone.$invalid"
                                                    ensure_phone_validate_code="{{validateCode}}" />
                                        <form:errors path="validateCode" class="control-label"/>

                                        <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-4">
                                        <button type="button"  class="btn btn-primary"
                                                ng-disabled="signupForm.phone.$invalid||(sending&&!sent)||seconds>0" data-ng-click="getValidCode('phone')">
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

</body>
