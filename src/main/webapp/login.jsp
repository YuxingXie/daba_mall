<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="${path}/statics/assets/img/logo.png"  media="screen" />
    <link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/social-icons.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/uniform.css" rel="stylesheet" type="text/css">
    <script> path="${path}";</script>
    <script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>



</head>
<body>
<div class="container">

    <div class="modal-dialog margin-top-112" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">

                    <div class="col-sm-8 col-lg-8">
                        <h4><i class="fa fa-coffee"></i>欢迎您登录大坝生态农业</h4>

                    </div>
                </div>
                <h2 class="modal-title" id="myModalLabel">
                    <small style=" color:#187705;">支持以下登录方式登录</small>
                </h2>
                <br/>
                <ul class="social-icons">
                    <li><a href="#" data-original-title="txqq" class="txqq" title="腾讯QQ"></a></li>
                    <li><a href="#" data-original-title="xlwb" class="xlwb" title="新浪微博"></a></li>
                    <li><a href="#" data-original-title="rrw" class="rrw" title="人人网"></a></li>
                    <li><a href="#" data-original-title="wx" class="wx" title="微信"></a></li>
                    <li><a href="#" data-original-title="zfb" class="zfb" title="支付宝"></a></li>
                    <li><a href="#" data-original-title="wy" class="wy" title="网易"></a></li>
                    <li><a href="#" data-original-title="txwb" class="txwb" title="腾讯微博"></a></li>
                </ul>
            </div>
            <div class="row margin-top-10">
                <div class="col-lg-1 col-sm-1"></div>
                <div class="col-lg-10 col-sm-10">
                    <c:if test="${not empty message and not message.success}"><i class="fa fa-warning color-red">${message.message}</i></c:if>
                </div>
            </div>
            <form id="loginForm" name="loginForm" class="form-horizontal form-without-legend" role="form" action="${path}/user/https/login" method="post">
                <div class="modal-body">
                    <div class="row"><div class="col-lg-1"></div>
                        <div class="col-lg-10"><span id="error-msg" class="text-danger"></span></div>
                        <div class="col-lg-1"></div></div>
                    <fieldset>
                        <div class="form-group has-feedback">
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-10 has-error">
                                    <c:if test="${not empty to}"><input type="hidden" name="to" value="${to}"/></c:if>
                                    <input type="text" class="form-control" id="loginStr" name="loginStr" placeholder="邮箱/用户名/已验证手机"  required="true" ng-model="loginStr"/>
                                    <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    <input type="hidden" name="mergeCart" id="mergeCart"/>
                                </div>
                                <div class="col-lg-1"></div>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-10 has-error">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="密码" required="true" ng-model="password"/>
                                    <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                </div>
                                <div class="col-lg-1"></div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-12">
                        <button type="submit" class="btn btn-primary" style=" width:100%;" ng-disabled="loginForm.$invalid">
                            登录
                        </button>
                        <ul class="automatically">
                            <li class="first">
                                <input type="checkbox" value="true" class="common_chk" checked="checked"
                                       name="remember">自动登录
                            </li>
                            <li><a href="#">忘记密码</a></li>
                            <li style=" border-right:0;"><a href="${path}/user/register_phone" target="_blank">免费注册</a></li>
                        </ul>
                    </div>
                </div>
            </form>

        </div>
        <!-- /.modal-content -->
    </div>

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
    }])

</script>
</body>
</html>