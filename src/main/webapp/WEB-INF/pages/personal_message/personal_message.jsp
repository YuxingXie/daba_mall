<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" id="registerAppMain" ng-init='mailSending=false;mailSent=false;'>
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">我的账户</a></li>
            <li class="active">个人信息</li>
        </ul>

        <div class="row" data-ng-controller="formController">
            <form:form name="signupForm" modelAttribute="form"
                                    role="form"
                                   action="${path}/user/register/email"
                                    class="form-horizontal form-without-legend" novalidate="novalidate" _method="POST" autocomplete="false">
                <fieldset>
                    <div class="row">
                        <div class="form-group has-feedback">
                            <label class="col-lg-2 control-label">昵称 <span class="fa fa-user"></span></label>
                            <div class="col-lg-5 has-success">
                                <form:input path="name" class="form-control" ensure_name_unique="{{name}}" required="true" ng-maxlength="20" ng-init="name='${sessionScope.loginUser.name}'" ng-model="name"/>
                                <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="name" class="control-label"/>
                            </div>
                            <div class="col-lg-2">
                                <span class="fa fa-ban" ng-if="!signupForm.name.$dirty ||signupForm.name.$invalid">修改</span>
                                <a href="#" class="fa fa-edit" ng-if="signupForm.name.$dirty &&signupForm.name.$valid">修改</a>
                                <a href="#" class="fa fa-check-square" ng-if="signupForm.name.$dirty&&true">成功</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">&nbsp;</div>
                            <div class="col-lg-5 has-error"
                                 ng-show="signupForm.name.$dirty &&signupForm.name.$invalid">
                                <label class="control-label" ng-show="signupForm.name.$error.required" for="name">用户昵称必填</label>
                                <label class="control-label" ng-show="signupForm.name.$error.maxlength" for="name">昵称不能超过20个字符</label>
                                <label class="control-label" ng-show="signupForm.name.$error.unique" for="name">该昵称已被使用</label>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group has-feedback">
                            <label class="col-lg-2 control-label">邮箱地址 <span class="fa fa-envelope-o"></span></label>
                            <div class="col-lg-5 has-success" ng-init="editEmail=false">
                                <form:input type="email" class="form-control" path="email" ng-init="email='${sessionScope.loginUser.email}'" ng-model="email" placeholder="请输入您的邮箱地址"
                                            required="true" ensure_email_unique="{{email}}" autocomplete="false"/>
                                <span ng-show="signupForm.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="email" class="control-label"/>
                            </div>
                            <div class="col-lg-2">
                                <span class="fa fa-ban" ng-if="!signupForm.email.$dirty ||signupForm.email.$invalid">修改</span>
                                <a href="#" class="fa fa-edit" ng-if="signupForm.email.$dirty &&signupForm.email.$valid">修改</a>
                                <a href="#" class="fa fa-check-square" ng-if="signupForm.email.$dirty&&true">成功</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">&nbsp;</div>
                            <div class="col-lg-5 has-error"
                                 ng-show="signupForm.email.$dirty &&signupForm.email.$invalid">
                                <label class="control-label" ng-show="signupForm.email.$error.required">邮箱必填</label>
                                <label class="control-label" ng-show="signupForm.email.$error.email"> 请输入一个有效的邮箱</label>
                                <label class="control-label" ng-show="signupForm.email.$error.unique"> 该邮箱已被使用</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group has-feedback">
                            <label for="password" class="col-lg-2 control-label">密码 <span class="fa fa-key fa-fw"></span></label>
                            <div class="col-lg-5 has-success" ng-init="editPassword=false">
                                <form:password autocomplete="false" class="form-control" path="password" id="password"
                                            ng-init="password='${sessionScope.loginUser.password}'" ng-model="password"
                                            pw_check="#rePassword" placeholder="请输入密码" required="true" ng-minlength="{{pw_min}}"/>
                                <span ng-show="signupForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="password" class="control-label"/>
                            </div>
                            <div class="col-lg-2">
                                <span class="fa fa-ban" ng-if="!signupForm.password.$dirty ||signupForm.password.$invalid">修改</span>
                                <a href="#" class="fa fa-edit" ng-if="signupForm.password.$dirty &&signupForm.password.$valid">修改</a>
                                <a href="#" class="fa fa-check-square" ng-if="signupForm.password.$dirty&&true">成功</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">&nbsp;</div>
                            <div class="has-error col-lg-5" ng-show="signupForm.password.$dirty &&signupForm.password.$invalid">
                                <label class="control-label" ng-show="signupForm.password.$error.required">密码必填</label>
                                <label class="control-label" ng-show="signupForm.password.$error.minlength">密码最少需要{{pw_min}}个字符</label>
                            </div>
                            <div class="has-success col-lg-5" ng-show="signupForm.password.$valid&&signupForm.password.$dirty">
                                <label class="control-label">密码强度:
                                    <div class="{{cls1}}">&nbsp;</div><div class="{{cls2}}">&nbsp;</div><div class="{{cls3}}">&nbsp;</div>
                                    {{passwordStrength}}</label>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group has-feedback" ng-show="editPassword">
                            <label for="password" class="col-lg-2 control-label">确认密码<span class="fa fa-key fa-fw"></span></label>
                            <div class="col-lg-5 has-success">
                                <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" id="rePassword" path="rePassword" ng-init="rePassword='${form.rePassword}'"
                                               ng-model="rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-disabled="!signupForm.password.$dirty"/>
                                <span ng-show="signupForm.rePassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="rePassword" class="control-label"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">&nbsp;</div>
                            <div class="has-error col-lg-5" ng-show="signupForm.rePassword.$dirty &&signupForm.rePassword.$invalid">
                                <label class="control-label" ng-show="signupForm.rePassword.$error.required"> 必须确认密码</label>
                                <label class="control-label" ng-show="signupForm.rePassword.$error.minlength"> 密码最少需要{{pw_min}}个字符 </label>
                                <label class="control-label" ng-show="signupForm.password.$invalid"> 请填写密码再进行确认</label>
                                <label class="control-label" ng-show="signupForm.password.$error.pwmatch &&signupForm.rePassword.$error.pwmatch"> 两次密码必须相同</label>
                            </div>
                            <div class="col-lg-5 has-success" ng-show="signupForm.rePassword.$valid && signupForm.password.$valid">
                                <label class="control-label"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group has-feedback" ng-show="editEmail">
                            <label class="col-lg-2 control-label">邮箱验证码 <span class="require">*</span></label>
                            <div class="col-lg-3 has-error">
                                <%--(mailSending||(!mailSent))||--%>
                                <form:input type="text" class="form-control" email="{{email}}" path="validateCode"
                                            ng-init="validateCode='${form.validateCode}'"
                                            ng-model="validateCode" required="true"
                                            ng-disabled="signupForm.email.$invalid"
                                            ensure_validate_code="{{validateCode}}" />
                                <form:errors path="validateCode" class="control-label"/>
                                <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                            <div class="col-lg-2">
                                <button type="button"  class="btn btn-primary col-lg-12"
                                        ng-disabled="signupForm.email.$invalid||(mailSending&&!mailSent)" data-ng-click="getValidCode('email')">
                                    获取验证码<i ng-if="mailSending" class="fa fa-spin fa-spinner pull-right"></i></button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4"
                                 ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)">&nbsp;</div>
                                <%--前后这两个div一定要ng-show相同哦--%>
                            <div class="col-lg-5 has-error"
                                 ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)">
                                <label class="control-label" >验证码错误</label>
                            </div>
                            <div class="col-lg-4" ng-show="!mailSending&&mailSent&&signupForm.email.$valid">&nbsp;</div>
                                <%--前后这两个div一定要ng-show相同哦--%>
                            <div class="col-lg-5 has-success" ng-show="!mailSending&&mailSent&&signupForm.email.$valid">
                                <label class="control-label" >邮件发送成功，点击<a href="{{url}}" class="btn-primary btn-xs" target="_blank">这里</a>进入邮箱</label>
                            </div>
                        </div>
                    </div>
                    <div class="row table-bordered">
                        <div class="col-lg-1 col-sm-1"></div>
                        <div class="col-lg-6 col-sm-6">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-4 col-sm-4">
                                        <span class="btn btn-primary fa fa-user-secret disabled" style="margin: 0px;">个人真实信息</span>
                                    </div>
                                </div>
                                <div class="row table-bordered bg-success" style="margin-bottom:10px;">
                                    <label class="col-lg-2 control-label">姓名 <span class="fa fa-user"></span></label>
                                    <div class="col-lg-5 has-success">
                                        <input type="text" class="form-control"
                                               ng-init="realMessage.firstName='${sessionScope.loginUser.realMessage.firstName}'" ng-model="realMessage.firstName"/>
                                    </div>

                                </div>
                                <div class="row table-bordered bg-success" style="margin-bottom:10px;">
                                    <label class="col-lg-2 control-label">身份证 <span class="fa fa-user"></span></label>
                                    <div class="col-lg-5 has-success">
                                        <input class="form-control" type="text"
                                               ng-init="realMessage.idCardNo='${sessionScope.loginUser.realMessage.idCardNo}'" ng-model="realMessage.idCardNo"/>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </fieldset>

            </form:form>
        </div>

        <!-- END CONTENT -->

</div>
<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--$("[name='signupForm']").submit(function() {--%>
            <%--alert($(this).serialize());--%>
            <%--return false;--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>

</body>
