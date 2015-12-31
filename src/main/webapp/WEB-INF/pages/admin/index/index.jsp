<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container" ng-controller="AdminIndexController">
    <div class="row fa-2x">待办任务<i class="fa fa-tasks color-light-red"></i></div>
    <div class="row margin-top-20">
        <i class="fa fa-volume-up fa-fw"></i>通知<a  ng-if="data.notifies" href="${path}/admin/order/toHandler"><i class="color-red">({{data.notifies}})</i></a>
    </div>
    <div class="row margin-top-20">
        <i class="fa fa-list-ul"></i>待处理订单<a  ng-if="data.todoOrders" href="${path}/admin/order/to_handler"><i class="color-red">({{data.todoOrders}})</i></a>
    </div>
    <div class="row margin-top-20">
        <i class="fa fa-list-ul"></i>超过四日未收货订单<a ng-if="data.overFourDaysOrders" href="${path}/admin/order/toHandler"><i class="color-red">({{data.overFourDaysOrders}})</i></a>
    </div>
    <div class="row margin-top-20">
        <i class="fa fa-list-ul"></i>退换货订单<a ng-if="data.returnOrders" href="${path}/admin/order/toHandler"><i class="color-red">({{data.returnOrders}})</i></a>
    </div>
</div>

