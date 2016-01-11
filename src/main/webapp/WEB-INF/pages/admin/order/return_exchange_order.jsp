<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="ReturnExchangeController">
    <div class="row margin-top-10"><div class="center-block font-size-17-5 text-center"><b>退/换货订单</b></div></div>
    <div class="row btn-group btn-group-sm input-group padding-top-15">
        <a href="${path}/admin/index/index" class="btn btn-primary">返回首页<i class="fa fa-reply"></i></a>
        <a href="${path}/admin/order/return_exchange" class="btn btn-primary">返回退换货订单列表<i class="fa fa-reply"></i></a>
    </div>
    <div class="row padding-top-15">
        <p><i class="fa fa-file"></i>订单信息:</p>
        <p class="text-warning"> 用户名：{{order.user.name}}，订单编号：{{order.id}}，用户邮箱：{{order.user.email}}，用户手机：{{order.user.phone}},
            收件人姓名：{{order.acceptPersonName}}，收件人联系电话：{{order.contactPhone}}。</p>
    </div>
    <div class="row padding-top-15">
        <p class="fa fa-info-circle text-danger">如果您尚未处理某个退换货请求，您可以按照订单信息联系用户，也可以给用户发送系统消息。如果已经成功退换商品，请将其标记为已处理。</p>
    </div>
    <div class="row padding-top-15">
        <p class="fa fa-info-circle text-danger">即使您已经确认处理好了某个退换货请求，用户也可能不会满意退换货结果，在此情形下，如果您决定重新处理该用户的请求，可以请将标记为已处理的请求重新标记为未处理。</p>
    </div>
    <div class="row padding-top-15">
        <p class="fa fa-info-circle text-danger">标记的状态改变时，系统会向用户自动发送一份系统通知。</p>
    </div>
    <div class="row padding-top-15 padding-bottom-20">
        <b class="fa fa-list fa-2x">要求退换货详情</b>
        <button ng-init="handlerOnce=false" ng-disabled="!handlerOnce" data-ng-click="notify()" class="btn btn-primary">给用户发送通知</button>
        <pre>{{notify.content}}</pre>
    </div>
    <div class="row padding-top-5" ng-repeat="productSelected in order.productSelectedList">
        <div class="row bg-info">
            <div class="row">
                <div class="col-sm-12 col-lg-12 padding-top-10 padding-bottom-10">
                    <img ng-src="${path}/{{productSelected.productSeries.pictures[0].iconPicture}}" class="padding-left-10"/>
                    {{productSelected.productSeries.name}}
                    <span ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.productProperty.propertyName}}:{{productPropertyValue.value}}</span>
                    &times;{{productSelected.amount}}
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12 text-left form-inline padding-top-6">


                    <span class="table-responsive">
                        <table class="table table-hover">
                            <tr>
                                <th>类型</th>
                                <th>数量</th>
                                <th>理由</th>
                                <th>日期</th>
                                <th>状态</th>
                                <th>处理</th>
                            </tr>
                            <tr ng-if="!productSelected.returnExchangeList||!productSelected.returnExchangeList.length"><td class="font-size-12 fa fa-info-circle text-danger" colspan="6">该商品无退/换货请求记录</td></tr>
                            <tr ng-repeat="returnExchange in productSelected.returnExchangeList" class="padding-top-5">
                                <td class="font-size-12">
                                    <span ng-if="returnExchange.type==='return'">退货</span>
                                    <span ng-if="returnExchange.type==='exchange'">换货</span>
                                </td>
                                <td class="font-size-12">{{returnExchange.amount}}</td>
                                <td class="font-size-12">{{returnExchange.reason}}<span ng-if="!returnExchange.reason">无</span></td>
                                <td class="font-size-12">{{returnExchange.date | date:'yyyy-MM-dd'}}</td>
                                <td class="font-size-12">
                                    <span class="fa fa-warning text-danger" ng-if="!returnExchange.handler">未处理</span>
                                    <span ng-if="returnExchange.handler" class="fa fa-smile-o text-success">已由{{returnExchange.administrator.name}}处理</span>
                                </td>
                                <td class="font-size-12">
                                    <button class="btn btn-primary btn-xs" ng-if="!returnExchange.handler" data-ng-click="handler(returnExchange)">标记为已处理</button>
                                    <button class="btn btn-primary btn-xs" ng-if="returnExchange.handler" data-ng-click="handler(returnExchange)">标记为未处理</button>
                                </td>
                            </tr>
                        </table>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
