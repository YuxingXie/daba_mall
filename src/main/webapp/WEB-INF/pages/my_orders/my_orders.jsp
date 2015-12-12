<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="container" id="myOrdersAppMain">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">我的订单</li>
        </ul>
        <div class="table-responsive" ng-controller="myOrdersController">
            <table class="table table-hover table-bordered table-striped text-center">
                <c:choose>
                    <c:when test="${empty orders}">
                        <div class="col-lg-5 text-info text-center">您没有生成过订单<a href="${path}">返回首页</a></div>
                    </c:when>
                    <c:otherwise>
                        <tr class="margin-top-10">
                            <th class="text-center">订单号</th>
                            <th class="text-center">下单日期</th>
                            <th class="text-center">订单状态</th>
                            <th class="text-center">商品金额</th>
                            <th class="text-center">操作</th>
                        </tr>
                        <c:forEach var="order" items="${orders}" varStatus="selectedIndex">
                            <tr class="margin-top-10">
                                <td>
                                    <c:choose>
                                        <c:when test="${fn:length(order.id) > 4}">....${fn:substring(order.id, fn:length(order.id)-4, fn:length(order.id))}</c:when>
                                        <c:otherwise>${order.id}</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><fmt:formatDate value="${order.orderDate}" type="date" dateStyle="default"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${empty order.submitStatus or order.submitStatus eq 'n'}">未提交</c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${empty order.payStatus or order.payStatus eq 'n'}">已提交,未付款</c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${not empty order.receiveStatus}">
                                                            <c:choose>
                                                                <c:when test="${order.receiveStatus eq 'none'}">已付款,未收货</c:when>
                                                                <c:when test="${order.receiveStatus eq 'part'}">已付款,未全部收货</c:when>
                                                                <c:otherwise>已收货</c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>未知</c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><i class="fa fa-rmb"></i><fmt:formatNumber value="${order.totalPrice}" pattern="##.##"></fmt:formatNumber></td>
                                <td>
                                    <a href="javascript:void(0)"
                                       <%--data-toggle="modal" data-target="#orderDetail" --%>
                                       class="fa fa-search btn btn-primary btn-xs" data-ng-click="orderDetail('${order.id}')">查看详情</a>
                                    <c:choose>
                                        <c:when test="${empty order.submitStatus or order.submitStatus eq 'n'}">
                                            <a href="${path}/cart/to_bill/${order.id}" class="fa fa-check-square-o btn btn-primary btn-xs">提交订单</a>
                                            <a href="javascript:void(0)" class="fa fa-trash btn btn-primary btn-xs" data-ng-click="deleteOrder('${order.id}')">删除订单</a>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${empty order.payStatus or order.payStatus eq 'n'}">
                                                    <a href="${path}/order/submit/${order.id}" class="fa  fa-cc-visa btn btn-primary btn-xs">去付款</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${not empty order.receiveStatus}">
                                                            <c:choose>
                                                                <c:when test="${order.receiveStatus eq 'none'}">
                                                                    <a class="fa fa-sign-in btn btn-primary btn-xs" href="${path}/order/receive/${order.id}">确认收货</a>
                                                                </c:when>
                                                                <c:when test="${order.receiveStatus eq 'part'}">
                                                                    <a class="fa fa-sign-in btn btn-primary btn-xs" href="${path}/order/receive/${order.id}">确认收货</a>
                                                                    <a class="fa fa-pencil btn btn-primary btn-xs" href="${path}/order/evaluate/${order.id}">去评价</a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${order.evaluateStatus eq 'none' or order.evaluateStatus eq 'part'}">
                                                                        <a class="fa fa-pencil btn btn-primary btn-xs" href="${path}/order/evaluate/${order.id}">去评价</a>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>未知</c:otherwise>
                                                    </c:choose>
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
            <div class="modal fade active" id="orderDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 68%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                            <p class="modal-title" id="myModalLabel">订单详情&nbsp;&nbsp;订单号:{{order.id}}</p>
                        </div>
                        <div class="modal-body">
                            <div class="row margin-top-10">
                                <div class="col-lg-3 col-sm-3 text-center">商品信息</div>
                                <div class="col-lg-2 col-sm-2 text-center">单价</div>
                                <div class="col-lg-2 col-sm-2 text-center">数量</div>
                                <div class="col-lg-2 col-sm-2 text-center">总价</div>
                                <div class="col-lg-3 col-sm-3 fa fa-wrench" ng-init="hasEmptyProduct=false;totalPrice=0">快捷操作 </div>
                            </div>
                            <div class="row margin-top-10" ng-repeat="productSelected in order.productSelectedList">
                                <div class="col-lg-8 col-sm-8 text-center" ng-show="!productSelected.productSeries.id">
                                    <span ng-init="hasEmptyProduct=true">没有找到您当时选择的商品，商品可能已被移除或下架,如果您已经付款请联系客服，如果没有付款，您可以删除该订单。</span>
                                </div>
                                <div class="col-lg-3 col-sm-3 text-center">
                                    <img class="thumbnail img-ico-md pull-left" ng-src="${path}/{{productSelected.productSeries.pictures[0]}}">
                                    <a ng-href="${path}/product_series/{{productSelected.productSeries.id}}">{{productSelected.productSeries.name}}</a>
                                    <span ng-repeat="productPropertyValue in productSelected.productPropertyValueList"> {{productPropertyValue.value}}</span>
                                </div>

                                <div class="col-lg-2 col-sm-2 text-center fa fa-rmb">
                                    {{productSelected.productSeries.commonPrice | number:2}}
                                </div>
                                <div class="col-lg-2 col-sm-2 text-center">{{productSelected.amount}}</div>
                                <div class="col-lg-2 col-sm-2 text-center fa fa-rmb">
                                    {{productSelected.amount*productSelected.productSeries.commonPrice | number:2}}
                                </div>
                                <div class="col-lg-3 col-sm-3 text-center">
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6"></div>
                                <div class="col-lg-2 col-sm-2" ng-if="hasEmptyProduct||!order.payStatus||order.payStatus==='n'">
                                    <button type="button" class="btn btn-primary" aria-hidden="true" data-ng-click="deleteOrder(order.id)">删除订单</button>
                                </div>
                                <div class="col-lg-2 col-sm-2" ng-if="hasEmptyProduct&&order.payStatus==='y'">
                                    <input type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;" value="联系客服"/>
                                </div>
                                <div class="col-lg-2 col-sm-2">
                                    <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade active" id="confirmDeleteOrderModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="width: 400px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h2 class="modal-title">提示</h2>
                        </div>
                        <div class="modal-body">
                            您确定删除此订单吗?
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 col-lg-push-3 col-sm-push-3">
                                    <button class="btn btn-danger fa fa-trash" id="ensure-delete">确定</button>
                                    <button class="btn btn-primary" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>

