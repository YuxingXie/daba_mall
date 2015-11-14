<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title>输入产品</title>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
</head>
<body>
<div class="container table-bordered bg-success">
    <div class="text-info text-center" style="margin-top: 60px;margin-bottom: 60px;">输入产品</div>
    <div class="row table-bordered bg-success">
        <form role="form"  action="${path}/product_series/new.do" commandName="productSeries" enctype="multipart/form-data" method="post">

            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2 text-right">卡种</div>
                <div class="col-lg-6 col-sm-6 form-inline">
                    <div class="radio">
                        <label><input type="radio" name="cardSort" value="1" required="true" ng-model="cardSort"/>信用卡</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" name="cardSort" value="2" checked  required="true" ng-model="cardSort"/>储蓄卡</label>
                    </div>

                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">产品名称</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" class="form-control" required="true" name="name"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">price</div>
                <div class="col-lg-4 col-sm-4">
                    <input type="text" class="form-control " required="true" name="price"/>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right ">description</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="description" class="form-control" required="true"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">brand</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="brand" class="form-control " required="true"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">产品分类</div>
                <div class="col-lg-6 col-sm-6">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">SVN</a></li>
                        <li><a href="#">iOS</a></li>
                        <li><a href="#">VB.Net</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Java <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Swing</a></li>
                                <li><a href="#">jMeter</a></li>
                                <li><a href="#">EJB</a></li>
                                <li class="divider"></li>
                                <li><a href="#">分离的链接</a></li>
                            </ul>
                        </li>
                        <li><a href="#">PHP</a></li>
                    </ul>
                    <input type="text" name="brand" class="form-control " required="true"/>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-2 col-sm-2  text-right ">有效期</div>
                <div class="input-group date form_date col-lg-6 col-sm-6" >
                    <input class="form-control" type="text" name="cardValidDate" required="true"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;" ng-if="cardSort==1">
                <div class="col-lg-2 col-sm-2  text-right">卡验证码</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="cardValidateCode" class="form-control " required="true" placeholder="签名栏后3位数"/>

                </div>
                <div class="col-lg-2 col-sm-2 checkbox-inline">
                    <label>
                        <input type="checkbox" data-ng-click="showPic()"/>看示例
                    </label>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right "></div>
                <div class="col-lg-6 col-sm-6">
                    <input type="submit" value="同意开通并支付" class="btn btn-primary" ng-disabled="billForm.$invalid"/>
                </div>
            </div>

        </form>

    </div>



</div>

</body>
</html>
<script>
    $('.form_date').datetimepicker({
        language:'zh-CN',
        format:'mm/yy',
        weekStart: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 3,
        minView: 3
    });</script>