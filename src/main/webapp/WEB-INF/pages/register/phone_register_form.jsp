<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="content-form-page">
  <div class="row">
    <div class="col-md-12 col-sm-12">
      <form:form name="signupForm" modelAttribute="form"
                 class="form-horizontal form-without-legend" role="form"
                 action="${path}/user/register/phone"
                 novalidate="novalidate" _method="POST">
        <fieldset>
          <div class="form-group has-feedback">
            <div class="row">
              <label class="col-lg-4 control-label">昵称<span class="require">*</span></label>

              <div class="col-lg-8 has-success">
                <form:input type="text"  path="name" class="form-control" required="true" ng-maxlength="20" ng-init="name='${form.name}'" ng-model="name"/>
                <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                <form:errors path="name" class="control-label"/>
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
              <label class="col-lg-4 control-label">手机号 <span class="require">*</span></label>
              <div class="col-lg-8 has-success">
                <form:input type="phone" class="form-control" path="phone" ng-init="phone='${form.phone}'" ng-model="phone" placeholder="请输入您的手机号码"
                            required="true" ensure_phone_unique="{{phone}}"/>
                <span ng-show="signupForm.phone.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                <form:errors path="phone" class="control-label"/>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-4">&nbsp;</div>
              <div class="col-lg-8 has-error"
                   ng-show="signupForm.phone.$dirty &&signupForm.phone.$invalid">
                <label class="control-label" ng-show="signupForm.phone.$error.required">手机号必填</label>
                <label class="control-label" ng-show="signupForm.phone.$error.phone"> 请输入一个有效的手机号</label>
                <label class="control-label" ng-show="signupForm.phone.$error.unique"> 该手机号已被使用</label>
              </div>
            </div>
          </div>
          <div class="form-group has-feedback">
            <div class="row">
              <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
              <div class="col-lg-8 has-success">
                <form:password class="form-control" path="password" ng-init="password='${form.password}'" ng-model="password"
                               placeholder="请输入密码" required="true" ng-minlength="{{pw_min}}"/>
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
              <label for="password" class="col-lg-4 control-label">确认密码<span class="require">*</span></label>
              <div class="col-lg-8 has-success">
                <form:password class="form-control" path="rePassword" ng-init="rePassword='${form.rePassword}'"
                               ng-model="rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-minlength="{{pw_min}}"/>
                <span ng-show="signupForm.rePassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                <form:errors path="rePassword" class="control-label"/>
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
              <label class="col-lg-4 control-label">手机验证码 <span class="require">*</span></label>
              <div class="col-lg-4 has-error">
                <form:input type="text" class="form-control" phone="{{phone}}" path="validateCode"
                            ng-init="validateCode='${form.validateCode}'"
                            ng-model="validateCode" required="true" ng-disabled="(mailSending||(!mailSent))||!signupForm.validateCode" ensure_validate_code="{{validateCode}}" />
                <form:errors path="validateCode" class="control-label"/>

                <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
              </div>
              <div class="col-lg-4">
                <button type="button"  class="btn btn-primary col-lg-12"
                        ng-disabled="signupForm.phone.$invalid||(phoneSending&&!phoneSent)" data-ng-click="getValidCode('phone')">获取验证码</button>
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
              <div class="col-lg-4" ng-show="!mailSending&&mailSent&&signupForm.phone.$valid">&nbsp;</div>
                <%--前后这两个div一定要ng-show相同哦--%>
              <div class="col-lg-8 has-success" ng-show="!mailSending&&mailSent&&signupForm.phone.$valid">
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