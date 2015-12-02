<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">我的订单</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-12">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive">
                            <form action="${path}/cart/adjust" method="post" id="form" enctype='application/json'>
                                <input type="hidden" name="cart"/>
                                <table summary="Shopping cart">
                                    <c:choose>
                                        <c:when test="${empty orders}">
                                            <tr>
                                                <th colspan="5" class="text-info center-block shopping-cart-description">您没有生成过订单</th><th><a href="${path}">返回首页</a> </th>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th class="shopping-cart-image">订单号</th>
                                                <th class="shopping-cart-description">下单日期</th>
                                                <th class="shopping-cart-price">订单状态</th>
                                                <th class="shopping-cart-ref-no">商品金额</th>
                                                <th class="shopping-cart-price">操作</th>
                                            </tr>

                                            <c:forEach var="order" items="${orders}" varStatus="selectedIndex">
                                                <tr>
                                                    <td><a href="javascript:void(0);"
                                                           data-toggle="modal"
                                                           data-target="#orderDetail${selectedIndex.index}">${order.id}</a></td>
                                                    <td><fmt:formatDate value="${order.orderDate}" type="both" dateStyle="default"/></td>
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
                                                    <td><fmt:formatNumber value="${order.totalPrice}" pattern="##.##"></fmt:formatNumber></td>
                                                    <td><a href="javascript:void(0)" data-toggle="modal" data-target="#orderDetail${selectedIndex.index}">查看详情</a>
                                                        <c:choose>
                                                            <c:when test="${empty order.submitStatus or order.submitStatus eq 'n'}"><a href="${path}/cart/to_bill/${order.id}">提交订单</a></c:when>
                                                            <c:otherwise>
                                                                <c:choose>
                                                                    <c:when test="${empty order.payStatus or order.payStatus eq 'n'}"><a href="${path}/order/submit/${order.id}">去付款</a></c:when>
                                                                    <c:otherwise>
                                                                        <c:choose>
                                                                            <c:when test="${not empty order.receiveStatus}">
                                                                                <c:choose>
                                                                                    <c:when test="${order.receiveStatus eq 'none'}"><a class="fa-sign-in" href="${path}/order/receive/${order.id}">确认收货</a></c:when>
                                                                                    <c:when test="${order.receiveStatus eq 'part'}"><a class="fa-sign-in" href="${path}/order/receive/${order.id}">确认收货</a><a class="fa-pencil" href="${path}/order/evaluate/${order.id}">去评价</a></c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${order.evaluateStatus eq 'none' or order.evaluateStatus eq 'part'}"><a href="${path}/order/evaluate/${order.id}">去评价</a></c:if>
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
                                                    <td>
                                                        <div class="modal fade"
                                                             id="orderDetail${selectedIndex.index}" tabindex="-1"
                                                             role="dialog" aria-labelledby="myModalLabel"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog" style="width: 68%;">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                                                                        <h2 class="modal-title" id="myModalLabel">
                                                                            订单详情&nbsp;&nbsp;订单号:${order.id}
                                                                        </h2>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <table>
                                                                            <tr>
                                                                                <th colspan="2">商品信息</th>
                                                                                <th>单价</th>
                                                                                <th>数量</th>
                                                                                <th>总价</th>
                                                                                <th></th>
                                                                            </tr>
                                                                            <c:set var="totalPrice" value="0"/>
                                                                            <c:set var="hasEmptyProduct" value="false"/>
                                                                            <c:forEach var="productSelected" items="${order.productSelectedList}"
                                                                                       varStatus="selectedIndex">
                                                                                <c:set var="totalPrice" value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>

                                                                                <c:choose>
                                                                                    <c:when test="${empty productSelected.productSeries.id}">
                                                                                        <tr>
                                                                                            <td class="text-center" colspan="6">
                                                                                                <c:set var="hasEmptyProduct" value="true"/>
                                                                                                没有找到您当时选择的商品，商品可能已被移除或下架,如果您已经付款请联系客服，如果没有付款，您可以删除该订单。
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <tr name="productSelected"
                                                                                            data-product-series-id="${productSelected.productSeries.id}"
                                                                                            data-amount="${productSelected.amount}"
                                                                                            data-common-price="${productSelected.productSeries.commonPrice}">
                                                                                            <td class="shopping-cart-image" name="pictures0"
                                                                                                data-pictures0="${productSelected.productSeries.pictures[0]}">
                                                                                                <a href="${path}/product/${productSelected.productSeries.id}">
                                                                                                    <img src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                                                            </td>
                                                                                            <td class="shopping-cart-description">
                                                                                                <h3>${productSelected.productSeries.name}</h3>
                                                                                                <c:forEach var="productPropertyValue" items="${productSelected.productPropertyValueList}">
                                                                                                    <span>${productPropertyValue.value}</span>
                                                                                                </c:forEach>
                                                                                            </td>
                                                                                            <td class="shopping-cart-price">
                                                                                                ￥<fmt:formatNumber
                                                                                                    value="${productSelected.productSeries.commonPrice}"
                                                                                                    pattern="##.##"
                                                                                                    minFractionDigits="2"></fmt:formatNumber>
                                                                                            </td>
                                                                                            <td class="shopping-cart-quantity">${productSelected.amount}</td>
                                                                                            <td class="shopping-cart-price">
                                                                                                ￥<fmt:formatNumber
                                                                                                    value="${productSelected.amount*productSelected.productSeries.commonPrice}"
                                                                                                    pattern="##.##"
                                                                                                    minFractionDigits="2"></fmt:formatNumber>
                                                                                            </td>
                                                                                        </tr>

                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </table>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <div class="col-lg-8 col-sm-8"></div>

                                                                            <c:if test="${hasEmptyProduct && (empty order.payStatus || order.payStatus eq 'n')}">
                                                                                <div class="col-lg-2 col-sm-2">
                                                                                    <input type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;" value="删除订单"/>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${hasEmptyProduct &&  order.payStatus eq 'y'}">
                                                                                <div class="col-lg-2 col-sm-2">
                                                                                    <input type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;" value="联系客服"/>
                                                                                </div>
                                                                            </c:if>
                                                                        <div class="col-lg-2 col-sm-2">
                                                                            <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;">关闭</button>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="confirmDeleteOrderModal" tabindex="-1" role="dialog"
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
                            <div class="col-lg-6"></div>
                            <div class="col-lg-6">
                                <a class="btn btn-danger" id="ensure-delete">确定</a>
                                <a class="btn btn-primary" data-dismiss="modal">取消</a>
                            </div>
                        </div>
                    </div>


            </div>


        </div>


    </div>
</div>

