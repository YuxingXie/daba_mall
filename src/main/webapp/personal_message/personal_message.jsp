<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="shortcut icon" type="image/x-icon" href="${path}/statics/assets/img/logo.png"  media="screen" />
    <link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
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
    <script> path="${path}";</script>
    <script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>



</head>
<body ng-controller="PersonalMessageController">
<div class="container">
        <div class="row margin-top-112 padding-left-30">
                <form name="signupForm" role="form" class="form-horizontal form-without-legend" novalidate="novalidate" _method="POST" autocomplete="false">
                    <fieldset>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label class="col-lg-1 control-label fa fa-user">昵称</label>
                                <div class="col-lg-3 has-success" ng-init="modifyName=false">
                                    <input name="name" class="form-control" ensure_name_unique2="{{user.name}}" required="true" ng-maxlength="20" ng-model="user.name" ng-disabled="!modifyName"/>
                                    <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                </div>
                                <div class="col-lg-2">
                                    <a href="#" ng-class="{'margin-top-10 fa':true,'fa-edit':!modifyName,'fa-ban':modifyName}" ng-click="toggleModifyName()">修改</a>
                                    <a href="#" class="fa fa-check-square" ng-if="modifyName&&signupForm.name.$dirty&&modifyName&&signupForm.name.$valid&&true" ng-click="updateUserName()">确认</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-2">&nbsp;</div>
                                <div class="col-lg-5 has-error"
                                     ng-show="signupForm.name.$dirty &&signupForm.name.$invalid">
                                    <label class="control-label" ng-show="signupForm.name.$error.required">用户昵称必填</label>
                                    <label class="control-label" ng-show="signupForm.name.$error.maxlength">昵称不能超过20个字符</label>
                                    <label class="control-label" ng-show="signupForm.name.$error.unique">该昵称已被使用</label>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group has-feedback">
                                <label class="col-lg-1 control-label fa fa-envelope-o">邮箱地址</label>
                                <div class="col-lg-3 has-success" ng-init="editEmail=false">
                                    <input type="email" class="form-control" name="email" ng-model="user.email" placeholder="请输入您的邮箱地址" ng-disabled="!editEmail||validCodeGetted"
                                           required="true" ensure_email_unique="{{user.email}}" autocomplete="false"/>
                                    <span ng-show="signupForm.email.$valid&&signupForm.email.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                </div>
                                <div class="col-lg-2">
                                    <a href="#" ng-class="{'margin-top-10 fa':true,'fa-edit':!editEmail,'fa-ban':editEmail}" ng-click="editEmail=!editEmail">修改</a>
                                    <a href="#" class="fa fa-check-square" ng-if="editEmail&&signupForm.validateCode.$valid" ng-click="updateUserEmail()">确认</a>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group has-feedback" ng-show="editEmail&&signupForm.email.$valid&&signupForm.email.$dirty">
                                        <label class="col-lg-2 control-label margin-top-10">邮箱验证码</label>
                                        <div ng-class="{'col-lg-3':true,'has-error':signupForm.validateCode.$invalid,'has-success':signupForm.validateCode.$valid}">
                                            <input type="text" class="form-control" email="{{user.email}}" name="validateCode"
                                                   ng-model="user.validateCode" required="true"
                                                   ng-disabled="signupForm.email.$invalid"
                                                   ensure_email_validate_code="{{emailUser}}" />
                                            <span ng-show="signupForm.validateCode.$valid&&signupForm.validateCode.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></span>

                                        </div>
                                        <div class="col-lg-4">
                                            <button type="button"  class="btn btn-primary col-lg-12"
                                                    ng-disabled="signupForm.email.$invalid||!signupForm.email.$dirty||(sending&&!mailSent)" data-ng-click="getValidCode('email')">
                                                获取验证码<i ng-if="sending" class="fa fa-spin fa-spinner pull-right"></i></button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <span class="has-error"><label ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)" class="control-label " >验证码错误</label></span>
                                            <span class="has-success"><label ng-show="!sending&&sent&&signupForm.email.$valid&&signupForm.validateCode.$invalid&&editEmail" class="control-label" >邮件成功发送到新邮箱</label></span>
                                        </div>
                                    </div>
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
                        <!-- 测试免费短信太少，上线后完善-->
                      <div class="row">
                        <div class="form-group has-feedback">
                            <label class="col-lg-1 control-label glyphicon glyphicon-phone">手机号码</label>
                            <div class="col-lg-3 has-success" ng-init="editPhone=false">
                                <input type="tel" class="form-control" name="phone" ng-model="user.phone" placeholder="请输入您的手机号码" ng-disabled="!editPhone||validCodeGetted"
                                       required="true" phone_number_valid="{{user.phone}}" autocomplete="false" maxlength="11" ensure_phone_unique="{{user.phone}}"/>
                                <span ng-show="signupForm.phone.$valid&&signupForm.phone.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </div>
                            <div class="col-lg-2">
                                <a href="#" ng-class="{'margin-top-10 fa':true,'fa-edit':!editPhone,'fa-ban':editPhone}" ng-click="editPhone=!editPhone">修改</a>
                                <a href="#" class="fa fa-check-square" ng-if="editPhone&&signupForm.validateCode.$valid" ng-click="updateUserPhone()">确认</a>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group has-feedback" ng-show="editPhone&&signupForm.phone.$valid&&signupForm.phone.$dirty">
                                    <label class="col-lg-2 control-label margin-top-10">手机验证码</label>
                                    <div ng-class="{'col-lg-3':true,'has-error':signupForm.validateCode.$invalid,'has-success':signupForm.validateCode.$valid}">
                                        <input  type="text" class="form-control" phone="{{phone}}" name="validateCode"
                                                ng-model="user.validateCode" required="true"
                                                ng-disabled="signupForm.phone.$invalid"
                                                ensure_phone_validate_code="{{user.validateCode}}" />
                                        <span ng-show="signupForm.validateCode.$valid&&signupForm.validateCode.$dirty" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-4">
                                        <button type="button"  class="btn btn-primary"
                                                ng-disabled="signupForm.phone.$invalid||(sending&&!sent)||seconds>0" data-ng-click="getValidCode('phone')">
                                            获取验证码<span ng-if="seconds && seconds>0">,{{seconds}}秒后可重新获取</span><i ng-if="sending" class="fa fa-spin fa-spinner pull-right"></i>
                                        </button><span class="fa fa-warning" ng-if="sending">(如果一直处于发送中，可能是短信系统故障)</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <span class="has-error"><label ng-show="(signupForm.validateCode.$dirty&&signupForm.validateCode.$error.codeValid)" class="control-label " >验证码错误</label></span>
                                        <span class="has-success"><label ng-show="!sending&&sent&&signupForm.phone.$valid&&signupForm.validateCode.$invalid&&editPhone" class="control-label" >短信发送成功</label></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">&nbsp;</div>
                            <div class="col-lg-5 has-error"
                                 ng-show="signupForm.phone.$dirty &&signupForm.phone.$invalid">
                                <label class="control-label" ng-show="signupForm.phone.$error.required">手机必填</label>
                                <label class="control-label" ng-show="signupForm.phone.$error.validPhoneNumber"> 请输入一个有效的手机号码</label>
                                <label class="control-label" ng-show="signupForm.phone.$error.unique"> 该手机已被使用</label>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="form-group has-feedback">
                            <label for="password" class="col-lg-1 control-label">密码 <span class="fa fa-key fa-fw"></span></label>
                            <div class="col-lg-3 has-success" ng-init="editPassword=false">
                                <input type="password" autocomplete="false" class="form-control" path="password" id="password"
                                       ng-init="password='${sessionScope.loginUser.password}'" ng-model="password"
                                       pw_check="#rePassword" placeholder="请输入密码" required="true" ng-minlength="{{pw_min}}"/>
                                <span ng-show="signupForm.password.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>

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
                                <label for="password" class="col-lg-1 control-label">确认密码<span class="fa fa-key fa-fw"></span></label>
                                <div class="col-lg-3 has-success">
                                    <input onfocus="this.type='password'" autocomplete="false" class="form-control" id="rePassword" path="rePassword" ng-init="rePassword='${form.rePassword}'"
                                           ng-model="rePassword" pw_check="#password" placeholder="请再输入一次密码" required="true" ng-disabled="!signupForm.password.$dirty"/>
                                    <span ng-show="signupForm.rePassword.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-1">&nbsp;</div>
                                <div class="has-error col-lg-3" ng-show="signupForm.rePassword.$dirty &&signupForm.rePassword.$invalid">
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

                        <%--<div class="row table-bordered">--%>
                        <%--<div class="col-lg-1 col-sm-1"></div>--%>
                        <%--<div class="col-lg-6 col-sm-6">--%>
                        <%--<div class="form-group">--%>
                        <%--<div class="row">--%>
                        <%--<div class="col-lg-4 col-sm-4">--%>
                        <%--<span class="btn btn-primary fa fa-user-secret disabled" style="margin: 0px;">个人真实信息</span>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="row table-bordered bg-success" style="margin-bottom:10px;">--%>
                        <%--<label class="col-lg-2 control-label">姓名 <span class="fa fa-user"></span></label>--%>
                        <%--<div class="col-lg-5 has-success">--%>
                        <%--<input type="text" class="form-control"--%>
                        <%--ng-init="realMessage.firstName='${sessionScope.loginUser.realMessage.firstName}'" ng-model="realMessage.firstName"/>--%>
                        <%--</div>--%>

                        <%--</div>--%>
                        <%--<div class="row table-bordered bg-success" style="margin-bottom:10px;">--%>
                        <%--<label class="col-lg-2 control-label">身份证 <span class="fa fa-user"></span></label>--%>
                        <%--<div class="col-lg-5 has-success">--%>
                        <%--<input class="form-control" type="text"--%>
                        <%--ng-init="realMessage.idCardNo='${sessionScope.loginUser.realMessage.idCardNo}'" ng-model="realMessage.idCardNo"/>--%>

                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--</div>--%>


                    </fieldset>

                </form>
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
    var path="${path}";
    var userId="${sessionScope.loginUser.id}";
</script>
<script src="${path}/statics/assets/scripts/personal_message_valid.js" type="text/javascript"></script>
</body>
</html>