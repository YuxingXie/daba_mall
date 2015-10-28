<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<%@taglib prefix="p" uri="/pageTag" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:set var="form" value="${sessionScope.loginUser}"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">个人中心</a></li>
            <li class="active">我的账号</li>
        </ul>

        <div class="col-md-9 col-sm-7">



            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-3">
                        sdfdfd
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <img src="${path}/${productSeries.pictures[0]}" class="resule-thumb"/>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <a class="btn btn-default fancybox-fast-view">aaa</a>
                </div>
            </div>
            <form:form name="signupForm" modelAttribute="form"
                       class="form-horizontal form-without-legend" role="form"
                       action="${path}/user/register/email"
                       novalidate="novalidate" _method="POST">
                <fieldset>
                    <div class="form-group has-feedback">
                        <div class="row">
                            <label class="col-lg-4 control-label">昵称<span class="require">*</span></label>

                            <div class="col-lg-8 has-success">
                                <form:input type="text"  path="name" class="form-control" required="true" ng-maxlength="20" value="${form.name}" ng-model="name"/>
                                <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="name" class="control-label"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">&nbsp;</div>

                            <div class="col-lg-8 has-error"
                                 ng-show="false">
                                <label class="control-label" ng-show="false" for="name">
                                    用户昵称必填</label>
                                <label class="control-label" ng-show="false" for="name">
                                    昵称不能超过20个字符</label>

                            </div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">
                            <label class="col-lg-4 control-label">邮箱地址 <span class="require">*</span></label>
                            <div class="col-lg-8 has-success">
                                <form:input type="email" class="form-control" path="email" value="${form.email}" ng-model="email" placeholder="请输入您的邮箱地址"
                                            required="true" ensure_unique="{{email}}"/>
                                <span ng-show="signupForm.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                <form:errors path="email" class="control-label"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">&nbsp;</div>
                            <div class="col-lg-8 has-error"
                                 ng-show="false">
                                <label class="control-label" ng-show="signupForm.email.$error.required">邮箱必填</label>
                                <label class="control-label" ng-show="signupForm.email.$error.email"> 请输入一个有效的邮箱</label>
                                <label class="control-label" ng-show="signupForm.email.$error.unique"> 该邮箱已被使用</label>
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





