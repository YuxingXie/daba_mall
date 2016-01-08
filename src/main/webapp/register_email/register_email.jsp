<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <meta charset="utf-8">
    <title>用户邮箱注册</title>
    <link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
    <script> path="${path}";</script>
    <script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>
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
<body ng-controller="formController">
<div class="container" id="registerAppMain" ng-init='sending=false;sent=false;'>
    <div class="row margin-top-112">
        <div class="center-block">
            <h3>大坝生态农业</h3>
            <h4>欢迎您使用<i class="fa fa-envelope fa-2x"></i>邮箱注册成为大坝用户</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-1 col-lg-1"></div>
        <div class="col-sm-9 col-lg-9 btn-group">
            <a class="btn btn-primary disabled fa fa-envelope" style="width: 100px;" href="#" >邮箱注册</a>
            <a class="btn btn-primary  fa fa-mobile" href="${path}/user/register_phone" style="width: 100px;">手机注册</a>
        </div>

    </div>

        <div class="row margin-top-10">
            <div class="col-md-7 col-sm-7" >
                <div class="content-form-page">
                    <form:form name="signupForm" modelAttribute="form" role="form" action="${path}/user/register/email"
                                class="form-horizontal form-without-legend" novalidate="novalidate" _method="POST" autocomplete="false">
                        <fieldset>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-4 control-label">昵称 <span class="require">*</span></label>

                                    <div class="col-lg-8 has-success">
                                        <form:hidden path="id" ng-init="user.id='${form.name}'" ng-model="user.id"/>
                                        <form:input path="name" class="form-control" ensure_name_unique="{{user.name}}" required="true" ng-maxlength="20" ng-init="user.name='${form.name}'" ng-model="user.name"/>
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
                                    <label class="col-lg-4 control-label">邮箱地址 <span class="require">*</span></label>
                                    <div class="col-lg-8 has-success">
                                        <form:input type="email" class="form-control" path="email" ng-init="user.email='${form.email}'" ng-model="user.email" placeholder="请输入您的邮箱地址"
                                                    required="true" ensure_email_unique="{{user.email}}" autocomplete="false"/>
                                        <span ng-show="signupForm.email.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        <form:errors path="email" class="control-label"/>
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
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" path="password" id="password"
                                                    ng-init="user.password='${form.password}'" ng-model="user.password"
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
                                        <form:input onfocus="this.type='password'" autocomplete="false" class="form-control" id="rePassword" path="rePassword" ng-init="user.rePassword='${form.rePassword}'"
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
                                    <label class="col-lg-4 control-label">邮箱验证码 <span class="require">*</span></label>
                                    <div class="col-lg-4 has-error">
                                        <%--(sending||(!sent))||--%>
                                        <form:input type="text" class="form-control" email="{{user.email}}" path="validateCode"
                                                    ng-init="user.validateCode='${form.validateCode}'"
                                                    ng-model="user.validateCode" required="true"
                                                    ng-disabled="signupForm.email.$invalid"
                                                    ensure_validate_code2="{{user.validateCode}}" />
                                        <form:errors path="validateCode" class="control-label"/>

                                        <span ng-show="signupForm.validateCode.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-4">
                                        <button type="button"  class="btn btn-primary col-lg-12"
                                                ng-disabled="signupForm.email.$invalid||(sending&&!sent)" data-ng-click="getValidCode('email')">
                                            获取验证码<i ng-if="sending" class="fa fa-spin fa-spinner pull-right"></i></button>
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
                                    <div class="col-lg-4" ng-show="!sending&&sent&&signupForm.email.$valid">&nbsp;</div>
                                        <%--前后这两个div一定要ng-show相同哦--%>
                                    <div class="col-lg-8 has-success" ng-show="!sending&&sent&&signupForm.email.$valid">
                                        <label class="control-label" >邮件发送成功！</label>
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
    mainApp .controller('mainController', ['$scope', '$http', function ($scope, $http) {
        $scope.interested={};//关注信息
        $scope.initProductMenu= function () {
            if(!$scope.productCategories){
                $http.get('${path}/product_series/categories').success(function (data) {
                    $scope.productCategories = data;
//                    console.log(JSON.stringify(data));
                });
            }

        }
        $scope.getTotalAmountAndPrice=function(){
            var totalPrice= 0,totalAmount=0;
            if($scope.cart&&$scope.cart.productSelectedList&&$scope.cart.productSelectedList.length){

                for(var i=0;i<$scope.cart.productSelectedList.length;i++){
                    var productSelected=$scope.cart.productSelectedList[i];
                    totalPrice+=productSelected.productSeries.commonPrice*productSelected.amount;
                    totalAmount+=productSelected.amount;
                }
            }
            $scope.totalPrice=totalPrice;
            $scope.totalAmount=totalAmount;
        }

        $scope.deleteGoods=function(index){
//            alert(JSON.stringify(index));
            if($scope.cart.productSelectedList&&$scope.cart.productSelectedList.length){
                $scope.cart.productSelectedList.splice(index,1);
                $http({
                    method:"POST",
                    url:path+"/cart/update",
                    data:$scope.cart
                }).success(function(cart){
                    $scope.cart=cart;
                    $scope.getTotalAmountAndPrice();
                }).error(function(){

                });
            }
        }
        $http.get('${path}/user/cart').success(function (data) {
            $scope.cart = data;
            $scope.getTotalAmountAndPrice();
        });
        $http.get('${path}/user/unread_notifies_count').success(function (data) {
            $scope.unreadNotifiesCount = data;
        });
        $scope.popover=function(productSeriesId){
            $scope.lowPrice=function(){
                if(!$scope.productSelected.productSeries.currentPrice) return false;
                if(!$scope.productSelected.productSeries.currentPrice.price) return false;
                if(!$scope.productSelected.productSeries.currentPrice.prevPrice) return false;
                if(!$scope.productSelected.productSeries.currentPrice.prevPrice.price) return false;
                return  $scope.productSelected.productSeries.currentPrice.price<$scope.productSelected.productSeries.currentPrice.prevPrice.price;

            }
            $scope.productSelected={};
            $scope.productSelected.productPropertyValueList=[];
            $http.get(path+'/product_series/popover/'+productSeriesId).success(function (data) {
                $scope.productSelected.productSeries = data;
                $scope.productSelected.amount = 1;
                if(!$scope.productSelected.productSeries.pictures){
                    $scope.productSelected.productSeries.pictures=[];
                    var picture={};
                    picture.picture= "statics/img/img_not_found.jpg";
                    picture.bigPicture= "statics/img/img_not_found.jpg";
                    picture.iconPicture= "statics/img/img_not_found.jpg";
                    $scope.productSelected.productSeries.pictures.push(picture);
                }
                $scope.currentPicture=$scope.productSelected.productSeries.pictures[0];
                $scope.ratingVal = $scope.productSelected.productSeries.productSeriesEvaluateGrade?$scope.productSelected.productSeries.productSeriesEvaluateGrade:0;
                var productProperties= $scope.productSelected.productSeries.productProperties;
                if(productProperties&&productProperties.length){
                    for(var i=0;i<productProperties.length;i++){
                        var productProperty=productProperties[i];
                        var propertyValues=productProperty.propertyValues;
                        if(propertyValues&&propertyValues.length){
                            $scope.productSelected.productPropertyValueList.push(propertyValues[0]);
                        }
                    }
                }
                easyzoom();
                $("#showProductModal").modal().show();
            });
        }
        $scope.add2cart=function(){
            $http.post('${path}/cart/add', $scope.productSelected).success(function(data){

                $scope.cart=data;
                $scope.getTotalAmountAndPrice();
                $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
            }).error(function(data) {
                alert("对不起，服务器出现了点异常!");
            });
            $("#showProductModal").modal('hide');

        }
        $scope.toggleInterest=function(productSeriesId){

            loginCheckBeforeHandler(function(){
                var url="${path}/product_series/toggle_interest";
                if(!productSeriesId) return;
                if(!productSeriesId==="") return;
                url+="?productSeriesId="+productSeriesId;
                $http.get(url).success(function (data) {
                    $scope.interested[productSeriesId] = data.interested;
                });
            });

        }
    }])
            .directive('star', function () {
                return {
                    template: '<ul class="rating" ng-mouseleave="leave()">' +
                    '<li ng-repeat="star in stars" ng-class="star" ng-click="click($index + 1)" ng-mouseover="over($index + 1)">' +
                    '\u2605' +
                    '</li>' +
                    '</ul>',
                    scope: {
                        ratingValue: '=',
                        max: '=',
                        readonly: '@',
                        onHover: '=',
                        onLeave: '='
                    },
                    controller: function($scope){
                        $scope.ratingValue = $scope.ratingValue || 0;
                        $scope.max = $scope.max || 5;
                        $scope.click = function(val){
                            if ($scope.readonly && $scope.readonly === 'true') {
                                return;
                            }
                            $scope.ratingValue = val;
                        };
                        $scope.over = function(val){
                            $scope.onHover(val);
                        };
                        $scope.leave = function(){
                            $scope.onLeave();
                        }
                    },
                    link: function (scope, elem, attrs) {
                        elem.css("text-align", "center");
                        var updateStars = function () {
                            scope.stars = [];
                            for (var i = 0; i < scope.max; i++) {
                                scope.stars.push({
                                    filled: i < scope.ratingValue
                                });
                            }
                        };
                        updateStars();

                        scope.$watch('ratingValue', function (oldVal, newVal) {
                            if (newVal) {
                                updateStars();
                            }
                        });
                        scope.$watch('max', function (oldVal, newVal) {
                            if (newVal) {
                                updateStars();
                            }
                        });
                    }
                };
            })
</script>
<script src="${path}/statics/assets/scripts/form-validate.js"></script>
</body>
</html>
