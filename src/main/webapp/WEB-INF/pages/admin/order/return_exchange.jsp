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
        <button onclick="window.location.reload();" class="btn btn-primary">刷新<i class="fa fa-refresh"></i></button>
        <input type="text" class="form-control input-sm" style="width: 300px;" placeholder="结果中搜索：订单号,联系人,电话,商品名,地址等"/>
        <%--<span class="input-group-btn" style="width: auto"></span>--%>
            <%--<button class="btn btn-primary btn-sm input-group-btn" style="width: auto">查找<i class="fa fa-search"></i></button>--%>

        <%--<a href="${path}/admin/home_page_block/create_input" class="btn btn-primary">编辑区块<i class="fa fa-plus"></i></a>--%>
    </div>
    <div class="row table-responsive">
        <table class="table table-hover table-condensed table-bordered font-size-12">
            <tr>
                <th>订单号</th>
                <th>送货地址</th>
                <th>商品</th>
                <th>联系人/电话</th>
                <th>付款日期</th>
                <th>操作</th>
            </tr>
            <tr ng-if="!orders||!orders.length">
                <td colspan="6" class="fa-2x">所有的订单都处理过了<i class="fa fa-smile-o"></i></td>
            </tr>
            <tr ng-repeat="order in orders">
                <td>...{{order.id |limitTo:-5}}</td>
                <td>{{order.acceptAddress}}</td>
                <td>
                    <span ng-repeat="productSelected in order.productSelectedList">{{productSelected.productSeries.name}}
                        (<span ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.value}}</span>)
                        &times;{{productSelected.amount}} </span>
                </td>
                <td>{{order.acceptPersonName}}/{{order.contactPhone}}</td>
                <td>{{order.payDate | date:'yyyy-MM-dd'}}</td>
                <td class="btn-group btn-group-xs">
                    <a class="btn btn-primary"  ng-href="${path}/admin/order/return_exchange_order/{{order.id}}">查看<i class="fa fa-check"></i></a>
                </td>
            </tr>
        </table>
    </div>
</div>
