<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <meta charset="utf-8">
    <title>个人信息</title>
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
                                           required="true" ensure_email_unique2="{{user.email}}" autocomplete="false"/>
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
                                                   ensure_validate_code2="{{emailUser}}" />
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
                        <!-- 测试免费短信太少，上线后完善
                          <div class="row">
                            <div class="form-group has-feedback">
                                <label class="col-lg-1 control-label glyphicon glyphicon-phone">手机号码</label>
                                <div class="col-lg-3 has-success" ng-init="editPhone=false">
                                    <input type="tel" class="form-control" name="phone" ng-model="user.phone" placeholder="请输入您的手机号码" ng-disabled="!editPhone||validCodeGetted"
                                           required="true" phone_number_valid="{{user.phone}}" autocomplete="false"/>
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
                        -->

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
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>--%>
<script type="text/javascript" src="${path}/statics/assets/scripts/top.js"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>--%>
<%--弹出二级菜单相关--%>
<%--<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/tooltip.js"></script>--%>
<%--<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/popover.js"></script>--%>
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

    mainApp.controller('PersonalMessageController',['$scope', '$http',"$timeout", function ($scope, $http,$timeout) {
        $scope.user={};
        $scope.emailUser={};//为了更新email创建的一个临时用户
        $scope.phoneUser={};//为了更新phone创建的一个临时用户
        $scope.validCodeGetted=false;
        $http.get("${path}/user/data/${sessionScope.loginUser.id}").success(function(data){
            $scope.user=data;
            $scope.user.validateCode="";
        })
        $scope.updateUserName=function(){
            $http.post("${path}/user/update/name",$scope.user).success(function(data){
                $scope.user=data;
                $scope.modifyName=false;
            })
        }
        $scope.updateUserEmail=function(){
            var pairUsers={};
            pairUsers.firstUser=$scope.user;
            pairUsers.secondUser=$scope.emailUser;
            $http.post("${path}/user/update/email",pairUsers).success(function(data){
                $scope.user=data;
                $scope.editEmail=false;
                $scope.sending=undefined;
                $scope.sent=undefined;
                $scope.emailUser={};
                $scope.user.validateCode="";
                $scope.validCodeGetted=false;
            })
        }

        $scope.toggleModifyName=function(){
            $scope.modifyName=!$scope.modifyName;
        }
        $scope.getValidCode = function (type){
            $scope.sent=false;
            $scope.sending=true;
            $scope.validCodeGetted=true;
            var requestUrl;
            if(type==="email"){
                requestUrl=path+"/user/validate_code/email?email="+$scope.user.email
            }else{
                requestUrl=path+"/user/validate_code/phone?phone="+$scope.user.phone
            }
            $http({
                method:"POST",
                url:requestUrl
            }).success(function(data){
                if(type==="email"){
                    $scope.sending=false;
                    $scope.sent=true;
                    $scope.user.validateCode="";
                    $scope.emailUser=data;
                }
                if(type==="phone"){
                    var seconds=25;
                    var test=true;
                    console.log(data.message);
                    $scope.phoneUser=data;
                    if(data.message!=="100"&&!test){
                        $scope.sending=true;
                        $scope.sent=false;
                    }else{
                        $scope.sending=false;
                        $scope.sent=true;
                        var countDown=function(){
                            $timeout(function(){
                                seconds--;
                                $scope.seconds=seconds;
                                if(seconds==0) $timeout.cancel();
                                else countDown();
                            },1000);
                        };
                        countDown();
                    }
                }
//                $scope.validateCode=""

            }).error(function(data){
                $scope.sending=true;
                $scope.sent=false;

                //$scope.message="服务器的错误导致邮件发送失败";
            });
        }
    }])
</script>
</body>
</html>