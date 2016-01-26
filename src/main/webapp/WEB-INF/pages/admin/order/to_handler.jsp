<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="HandlerOrderController">
    <div class="row margin-top-10"><div class="center-block font-size-17-5 text-center"><b>待处理订单</b></div></div>
    <div class="row btn-group btn-group-sm input-group padding-top-15">
        <a href="${path}/admin/index/index" class="btn btn-primary">返回首页<i class="fa fa-reply"></i></a>
        <button onclick="window.location.reload();" class="btn btn-primary">刷新<i class="fa fa-refresh"></i></button>
        <input type="text" class="form-control input-sm" style="width: 300px;" placeholder="结果中搜索：订单号,联系人,电话,商品名,地址等"/>
        <%--<span class="input-group-btn" style="width: auto"></span>--%>
            <%--<button class="btn btn-primary btn-sm input-group-btn" style="width: auto">查找<i class="fa fa-search"></i></button>--%>

        <%--<a href="${path}/admin/home_page_block/create_input" class="btn btn-primary">编辑区块<i class="fa fa-plus"></i></a>--%>
    </div>
    <div class="row table-responsive margin-top-10">
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
                    <button class="btn btn-primary" data-ng-click="toHandler(order)">处理<i class="fa fa-check"></i></button>

                </td>
            </tr>
        </table>
    </div>
    <div class="modal fade active" id="orderDetail" tabindex="-1" role="dialog" aria-labelledby="orderDetailLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 68%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                    <h4>订单处理</h4>
                </div>
                <div class="modal-body table-responsive">
                    <table class="table table-hover table-condensed table-bordered">
                        <tr>
                            <td colspan="5">
                                <p class="modal-title" id="orderDetailLabel">订单详情&nbsp;&nbsp;用户名：{{order.user.name}}，订单编号：{{order.id}}，用户邮箱：{{order.user.email}}，用户手机：{{order.user.phone}},
                                收件人姓名：{{order.acceptPersonName}}，收件人联系电话：{{order.contactPhone}}。</p></td>
                        </tr>
                        <tr>
                            <th class="text-center">商品信息</th>
                            <th class="text-center">单价</th>
                            <th class="text-center">数量</th>
                            <th class="text-center">总价</th>
                            <th class="text-center" ng-init="hasEmptyProduct=false;totalPrice=0">处理信息</th>
                        </tr>
                        <tr ng-repeat="productSelected in order.productSelectedList">
                            <%--<td class="text-center" ng-show="!productSelected.productSeries.id">--%>
                                <%--<span ng-init="hasEmptyProduct=true">没有找到商品，商品可能已被移除或下架</span>--%>
                            <%--</td>--%>
                            <td class="font-size-12 text-center">
                                <img  ng-src="${path}/{{productSelected.productSeries.pictures[0].iconPicture}}">
                                <div>
                                    {{productSelected.productSeries.name}}
                                    <span ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.productProperty.propertyName}}:{{productPropertyValue.value}}</span>
                                </div>

                            </td>

                            <td class="font-size-12 text-center">
                                <i class=" fa fa-rmb"></i>{{productSelected.productSeries.commonPrice | number:2}}/{{productSelected.productSeries.measurementUnit}}
                            </td>
                            <td class="font-size-12 text-center">{{productSelected.amount}}</td>
                            <td class="font-size-12 text-center">
                                <i class=" fa fa-rmb"></i>{{productSelected.amount*productSelected.productSeries.commonPrice | number:2}}
                            </td>
                            <td class="font-size-12 text-center">
                                <div class="row text-left" ng-repeat="handlerInfo in productSelected.handlerInfoList">
                                    {{handlerInfo.date|date:'yyyy-MM-dd hh:mm'}}:{{handlerInfo.description}}
                                </div>
                                <div class="row">
                                    <textarea ng-model="productSelected.newHandlerInfo.description" style="width:100%" placeholder="填入处理信息，比如商品已出库，已交由某快递送货等"></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="font-size-12 text-right" colspan="5">该订单是否已全部处理完？
                                <label><input type="radio" ng-model="order.handler" value="true" name="handler" />是</label>
                                <label><input type="radio" ng-model="order.handler" value="false" name="handler"/>否</label>
                            </td>
                        </tr>
                    </table>

                </div>

                <div class="modal-footer">
                    <div class="row">
                        <div class="col-lg-6 col-sm-6 text-right"></div>
                        <div class="col-lg-4 col-sm-4 text-left">

                        </div>
                        <div class="col-lg-2 col-sm-2">
                            <button type="button" class="btn btn-primary" aria-hidden="true" data-ng-click="handler()">确定</button>
                            <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
