<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="main" ng-app="registerApp" ng-init='mailSending=false;sendCount=0;'>
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index/main">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">注册</li>
        </ul>
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
                                                <input type="password" class="form-control" id="password"
                                                       name="password" placeholder="密码应由6-20个字符组成"
                                                       novalidate="novalidate">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-lg-4 control-label">创建密码 <span
                                                    class="require">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control" id="re_password"
                                                       name="re_password" placeholder="密码应由6-20个字符组成"
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
                                <div class="col-md-4 col-sm-4 pull-right">
                                    <div class="form-info">
                                        <h2><em>新用户注册</em></h2>

                                        <p>已有超过198万人注册大坝生态</p>

                                        <p>立即注册，成为第1986165位会员</p>

                                        <p>大坝会员享受更多优惠。</p>

                                        <p>会员将得到大坝热销产品打折特权</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Information">
                        <div class="content-form-page">
                            <div class="row">
                                <div class="col-md-7 col-sm-7">
                                    <form name="signup_form" data-ng-controller="formController"
                                          class="form-horizontal form-without-legend" role="form"
                                          action="${path}/user/register/email"
                                          novalidate="novalidate" method="post" ng-submit="signupForm()">
                                        <fieldset>
                                            <div class="form-group">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">昵称<span class="require">*</span></label>
                                                    <div class="col-lg-8">
                                                        <input type="text" class="form-control" name="name" id="name"
                                                               ng-model="name"
                                                               placeholder="请输入您的昵称" required ng-maxlength="20">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="col-lg-8 has-error"
                                                         ng-show="signup_form.name.$dirty &&signup_form.name.$invalid">
                                                        <label class="control-label" ng-show="signup_form.name.$error.required" for="name">
                                                            用户昵称必填</label>
                                                        <label class="control-label" ng-show="signup_form.name.$error.maxlength" for="name">
                                                            昵称不能超过20个字符</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">邮箱地址 <span class="require">*</span></label>
                                                    <div class="col-lg-8">
                                                        <input type="email" class="form-control" name="email" ng-model="email" placeholder="请输入您的邮箱地址" required ensure_unique="{{email}}"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="col-lg-8 has-error"
                                                         ng-show="signup_form.email.$dirty &&signup_form.email.$invalid">
                                                        <label class="control-label" ng-show="signup_form.email.$error.required">邮箱必填</label>
                                                        <label class="control-label" ng-show="signup_form.email.$error.email"> 请输入一个有效的邮箱</label>
                                                        <label class="control-label" ng-show="signup_form.email.$error.unique"> 该邮箱已被使用</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                                    <div class="col-lg-8">
                                                        <input type="password" class="form-control" id="password2" name="password" ng-model="password" placeholder="请输入密码" required ng-minlength="{{pw_min}}">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="has-error col-lg-8" ng-show="signup_form.password.$dirty &&signup_form.password.$invalid">
                                                        <label class="control-label" ng-show="signup_form.password.$error.required">密码必填</label>
                                                        <label class="control-label" ng-show="signup_form.password.$error.minlength">密码最少需要{{pw_min}}个字符</label>
                                                    </div>
                                                    <div class="has-success col-lg-8" ng-show="signup_form.password.$valid">
                                                        <label class="control-label">密码强度:
                                                        <div class="{{cls1}}">&nbsp;</div><div class="{{cls2}}">&nbsp;</div><div class="{{cls3}}">&nbsp;</div>
                                                        {{passwordStrength}}</label>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <label for="password" class="col-lg-4 control-label">确认密码 <span class="require">*</span></label>
                                                    <div class="col-lg-8">
                                                        <input type="password" class="form-control" name="re_password"
                                                               ng-model="re_password" pw_check="#password2" placeholder="请再输入一次密码" required ng-minlength="{{pw_min}}"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4">&nbsp;</div>
                                                    <div class="has-error col-lg-8" ng-show="signup_form.re_password.$dirty &&signup_form.re_password.$invalid">
                                                        <label class="control-label" ng-show="signup_form.re_password.$error.required"> 必须确认密码</label>
                                                        <label class="control-label" ng-show="signup_form.re_password.$error.minlength"> 密码最少需要{{pw_min}}个字符 </label>
                                                        <label class="control-label" ng-show="signup_form.re_password.$error.pwmatch"> 两次密码必须相同</label>
                                                    </div>
                                                    <div class="col-lg-8 has-success" ng-show="signup_form.re_password.$valid">
                                                        <label class="control-label"> V</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <label class="col-lg-4 control-label">邮箱验证码 <span class="require">*</span></label>
                                                    <div class="col-lg-4">
                                                        <input type="text" class="form-control" email="{{email}}" name="validateCode" ng-model="validateCode" required ng-disabled="!mailSending" ensure_validate_code="{{validateCode}}"/>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <button type="button"  class="btn btn-primary col-lg-12"
                                                                ng-disabled="signup_form.email.$invalid||mailSending" data-ng-click="getValidCode({{sendCount}})">获取验证码</button>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4"
                                                         ng-show="(!signup_form.validateCode.$error.codeInvalid&&signup_form.validateCode.$dirty)
                                                    ||(mailSending&&signup_form.validateCode.$dirty)">&nbsp;</div>
                                                    <%--前后这两个div一定要ng-show相同哦--%>
                                                    <div class="col-lg-8 has-error"
                                                         ng-show="(signup_form.validateCode.$dirty&&sendCount==1&&!signup_form.validateCode.$error.codeInvalid)
                                                    ||(mailSending&&signup_form.validateCode.$dirty&&sendCount>1)">
                                                        <label class="control-label" >验证码错误</label>
                                                    </div>
                                                    <div class="col-lg-4" ng-show="mailSending">&nbsp;</div>
                                                    <%--前后这两个div一定要ng-show相同哦--%>
                                                    <div class="col-lg-8 has-success" ng-show="mailSending">
                                                        <label class="control-label" >邮件发送成功，点击<a href="{{url}}" class="btn-primary btn-xs" target="_blank">这里</a>进入邮箱</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-8 col-md-offset-4 padding-left-0">
                                                    <button type="submit" class="btn btn-primary col-lg-8" ng-disabled="signup_form.$invalid">提交</button>
                                                </div>
                                            </div>
                                        </fieldset>

                                    </form>
                                </div>
                                <div class="col-md-4 col-sm-4 pull-right">
                                    <div class="form-info">
                                        <h2><em>新用户注册</em></h2>

                                        <p>已有超过198万人注册大坝生态</p>

                                        <p>立即注册，成为第1986165位会员</p>

                                        <p>大坝会员享受更多优惠。</p>

                                        <p>会员将得到大坝热销产品打折特权</p>
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
<script>
    var myApp = angular.module('registerApp', [])
    .directive('pwCheck', [function () {
        return {
            require: 'ngModel',
            link: function (scope, elem, attrs, ctrl) {
                var firstPassword =attrs.pwCheck;
                elem.add(firstPassword).on('keyup', function () {
                    scope.$apply(function () {
                        var v = elem.val()===$(firstPassword).val();
                        ctrl.$setValidity('pwmatch', v);
                    });
                });
            }
        }
    }])
    .directive("ensureUnique", function ($http,$timeout) {
             return{
                 require:"ngModel",
                 link:function(scope,ele,attrs,c){
                     var timeout;
                     scope.$watch(attrs.ngModel,function(n){
//                         console.log(scope.ngModel);
                         if(!n) return;
                         if(timeout) $timeout.cancel(timeout);
                         timeout=$timeout(function(){
                             var data={}
                             data[attrs.ngModel]=attrs.ensureUnique;
                             console.log("key:"+attrs.ngModel)
                             console.log("value:"+attrs.ensureUnique)
                             $http({
                                 method:"POST",
                                 url:"exist",
                                 data:data
                             }).success(function(data){
                                 c.$setValidity('unique',data.unique);
                             }).error(function(data){
                                 c.$setValidity('unique',false);
                             });
                         },300);

                     });

                 }
             }
     })
    .directive("ensureValidateCode", function ($http,$timeout) {
        return{
            require:"ngModel",
//            scope:{
//                ngModel:"=",
//                email:'@'
//            },
            link:function(scope,ele,attrs,c){
                var timeout;
                scope.$watch(attrs.ngModel,function(newVal){
                    if(!newVal) return;
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        var data={};
                        data["email"]=scope.email;
                        data["validateCode"]=attrs.ensureValidateCode;
//                        data["validateCode"]=scope.validateCode;
                        $http({
                            method:"POST",
                            url:"${path}/user/email/validate",
                            data:data
                        }).success(function(data){
                            c.$setValidity('codeInvalid',data.codeInvalid);
                        }).error(function(data){
                            c.$setValidity('codeInvalid',true);
                        });
                    },300);

                });

            }
        }
    })
    .constant('pw_min',6)
    .controller("formController", ["$scope","$http","pw_min",function ($scope,$http,pw_min) {
        $scope.pw_min=pw_min;
        $scope.$watch('email', function (newVal, oldVal, scope) {if(newVal !== oldVal)$scope.email=newVal})
        $scope.$watch('password', function (newVal, oldVal, scope) {
            if (newVal && newVal !== oldVal && newVal.length >= pw_min) {
                $scope.password=newVal;
                if (newVal.length >=pw_min && newVal.length < (pw_min+3)) {
                    $scope.passwordStrength = "弱";
                    $scope.cls1 = "pw_weak";
                    $scope.cls2 = "pw_un_reach";
                    $scope.cls3 = "pw_un_reach";
                }
                else if (newVal.length >= pw_min+3 && newVal.length < pw_min+6) {
                    $scope.passwordStrength = "中";
                    $scope.cls1 = "pw_mid";
                    $scope.cls2 = "pw_mid";
                    $scope.cls3 = "pw_un_reach";
                }
                else {
                    $scope.passwordStrength = "强";
                    $scope.cls1 = "pw_strong";
                    $scope.cls2 = "pw_strong";
                    $scope.cls3 = "pw_strong";
                }
            }
        });
        $scope.getValidCode = function (sendCount){
            $scope.sendCount++;
            $scope.mailSending=false;
            $http({
                method:"POST",
                url:"${path}/user/register/validate_code/email?email="+$scope.email
            }).success(function(data){
                $scope.mailSending=true;

                $scope.url=data.url;
            }).error(function(data){
                $scope.mailSending=false;
            });
        }
    }])
</script>
</body>
