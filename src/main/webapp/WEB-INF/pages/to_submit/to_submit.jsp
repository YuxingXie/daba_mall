<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="form" class="com.dabast.entity.Order" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container" ng-app="toBillApp">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">购物车</a></li>
            <li class="active">填写订单</li>
        </ul>
            <div class="table-responsive" ng-controller="toBillAppCtrl">
                <table class="table table-bordered table-striped">
                        <tr>
                            <th class="bg-info text-center" colspan="6">送货清单</th>
                        </tr>
                        <c:choose>
                            <c:when test="${empty form ||empty form.productSelectedList}">
                                <tr>
                                    <th colspan="5">不知道什么原因，您订单中没有商品。</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:set var="totalPrice" value="0"/>
                                <c:set var="totalCount" value="0"/>
                                <tr>
                                    <th colspan="2" class="text-center">商品</th>
                                    <th class="text-center">单价</th>
                                    <th class="text-center">数量</th>
                                    <th class="text-center">总价</th>
                                    <th class="text-center">库存</th>
                                </tr>
                                <c:forEach var="productSelected" items="${form.productSelectedList}" varStatus="selectedIndex">
                                    <c:set var="totalPrice" value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                    <tr>
                                        <td>
                                            <img class="img-responsive img-ico-sm" src="${path}/${productSelected.productSeries.pictures[0]}">
                                        </td>
                                        <td class="shopping-cart-description">
                                            <b><a href="${path}/product/${productSelected.productSeriesId}">${productSelected.productSeries.name} </a></b>
                                            <c:forEach var="productPropertyValue"
                                                       items="${productSelected.productPropertyValueList}">
                                                <em>${productPropertyValue.value}</em>
                                            </c:forEach>
                                        </td>

                                        <td class="shopping-cart-price text-center">
                                            <span class="fa fa-rmb"><fmt:formatNumber value="${productSelected.productSeries.commonPrice}" pattern="##.##" minFractionDigits="2"/></span>
                                            <c:set var="totalCount" value="${totalCount+productSelected.amount}"/>
                                        </td>
                                        <td class="shopping-cart-price text-center">
                                            <span>${productSelected.amount}</span>
                                        </td>
                                        <td class="shopping-cart-price text-center">
                                            <span class="fa fa-rmb">
                                                <fmt:formatNumber value="${productSelected.productSeries.commonPrice*productSelected.amount}" pattern="##.##" minFractionDigits="2"/>
                                            </span>
                                        </td>
                                        <td class="shopping-cart-total text-center">
                                            <c:choose>
                                                <c:when test="${empty productSelected.productSeries.productStore}">
                                                    无库存信息
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${not empty productSelected.productSeries.productStore.remain}">
                                                            剩余${productSelected.productSeries.productStore.remain}件
                                                        </c:when>
                                                        <c:otherwise>
                                                            无法获取
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
                    </table>
                <form:form class="form-horizontal form-without-legend" novalidate="novalidate" action="${path}/order/to_bill"
                      id="form" name="form" autocomplete="off" _method="post" modelAttribute="form">
                    <table class="table table-striped content-form-page">
                        <tr>
                            <th class="bg-info text-center" colspan="3">填写并核对订单</th>
                        </tr>
                        <tr>
                            <td class="control-label " width="10%"><label class="padding-top-10">订单号</label></td>
                            <td colspan="2">${form.id}<input type="hidden" name="id" value="${form.id}"/></td>
                        </tr>
                        <tr>
                            <td class="control-label">
                                <label class="padding-top-10">收件人姓名<span class="require">*</span></label>
                            </td>
                            <td ng-class="{'has-success':form.acceptPersonName.$valid}" width="50%">
                                <form:input ng-model="order.acceptPersonName" required="true"  path="acceptPersonName"
                                       ng-init="order.acceptPersonName='${form.acceptPersonName}'" placeholder="请填写收件人姓名" class="form-control"/>
                                <span ng-show="form.acceptPersonName.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                            </td>
                            <td class="has-error">
                                <form:errors path="acceptPersonName" class="control-label"/>
                                <label class="control-label" ng-show="form.acceptPersonName.$error.required" for="acceptPersonName">请填写收件人姓名</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="control-label">
                                <label class="padding-top-10">收件地址<span class="require">*</span></label>
                            </td>
                            <td ng-class="{'has-success':form.acceptAddress.$valid}">
                                <form:input path="acceptAddress" ng-model="order.acceptAddress" required="true" accept_address_valid="{{order.acceptAddress}}"
                                       placeholder="请选择收件地址" type="text" class="form-control" select-address="sb" p="p" c="c" a="a" d="d" ng-init="${form.acceptAddress}"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback" ng-show="form.acceptAddress.$valid"></span>
                            </td>
                            <td class="has-error">
                                <form:errors path="acceptAddress" class="control-label" />
                                <label class="control-label" ng-show="form.acceptAddress.$error.required" for="acceptAddress">请选择收件地址</label>
                                <label class="control-label" ng-show="form.acceptAddress.$error.validAcceptAddress" for="acceptAddress">请填写具体街道</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="control-label">
                                <label class="padding-top-10">联系电话<span class="require">*</span></label>
                            </td>
                            <td ng-class="{'has-success':form.contactPhone.$valid}">
                                <form:input path="contactPhone" required="true" ng-model="order.contactPhone" placeholder="请填写联系电话" type="tel"
                                       class="form-control" ng-init="order.contactPhone='${form.contactPhone}'" telephone_number_valid="{{order.contactPhone}}"/>
                                <span class="glyphicon glyphicon-ok form-control-feedback" ng-show="form.contactPhone.$valid"></span>
                            </td>
                            <td class="has-error">
                                <form:errors path="contactPhone" class="control-label"/>
                                <label class="control-label" ng-show="form.contactPhone.$error.required" for="contactPhone">请填写联系电话</label>
                                <label class="control-label" ng-show="form.contactPhone.$error.validTelephoneNumber"> 请输入一个有效的电话号码，座机区号和分机号用"-"分隔</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="control-label">
                                <label class="padding-top-10">付款方式<span class="require">*</span></label>
                            </td>
                            <td ng-class="{'has-success':form.payWay.$valid}" ng-init="order.payWay='${form.payWay}'">
                                <div class="radio">
                                    <label class="radio-inline"><form:radiobutton ng-model="order.payWay" value="1" path="payWay"/>货到付款</label>
                                    <label class="radio-inline"><form:radiobutton ng-model="order.payWay" value="2" path="payWay"/>在线支付</label>
                                    <label class="radio-inline"><form:radiobutton ng-model="order.payWay" value="3" path="payWay"/>公司转账</label>
                                    <label class="radio-inline"><form:radiobutton ng-model="order.payWay" value="4" path="payWay"/>邮局汇款</label>
                                </div>
                            </td>
                            <td class="has-error">
                                <form:errors path="payWay" class="control-label"/>
                                <label class="control-label" ng-show="form.payWay.$error.required" for="payWay">请选择付款方式</label>
                            </td>
                        </tr>
                        <tr>
                            <td >
                            </td>
                            <td>
                                总计：<b>${totalCount}</b>件商品,共<b><fmt:formatNumber value="${totalPrice}" pattern="##.##" minFractionDigits="2"/></b>元
                            </td>
                            <td>
                                <button class="btn btn-primary center-block btn-sm pull-left" ng-disabled="form.$invalid" type="submit">提交订单{{order.id}}</button>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </div>

    <!-- END SIDEBAR & CONTENT -->
</div>
