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
            <li><a href="">购物车</a></li>
            <li class="active">调整购物车</li>
        </ul>
        <div class="col-md-9 col-sm-7">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive" ng-app>
                            <form action="${path}/cart/adjust" method="post" id="form"  enctype='application/json'>
                                <table summary="Shopping cart">
                                    <tr>
                                        <th class="shopping-cart-image"></th>
                                        <th class="shopping-cart-description">商品信息</th>
                                        <th class="shopping-cart-price">商品单价</th>
                                        <th class="shopping-cart-ref-no">商品数量</th>
                                        <th class="shopping-cart-price">商品金额</th>
                                        <th class="shopping-cart-price">库存信息</th>
                                        <th class="shopping-cart-total">交易操作</th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">
                                            <tr>
                                                <td colspan="5">您的购物车中还没有商品</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="totalPrice" value="0"/>
                                            <c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">
                                                <c:set var="totalPrice" value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                                <tr name="productSelected"
                                                    data-product-series-id="${productSelected.productSeriesId}"
                                                    data-product-series-name="${productSelected.productSeries.name}"
                                                    data-amount="${productSelected.amount}"
                                                    data-common-price="${productSelected.productSeries.commonPrice}">
                                                    <td class="shopping-cart-image" name="pictures0" data-pictures0="${productSelected.productSeries.pictures[0]}">
                                                        <a href="${path}/product/${productSelected.productSeriesId}">
                                                            <img src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                    </td>
                                                    <td class="shopping-cart-description">
                                                        <h3>${productSelected.productSeries.name}</h3>
                                                        <c:forEach var="productPropertyValue" items="${productSelected.productPropertyValueList}">
                                                            <span name="productPropertyValue"
                                                                  data-product-property-value-id="${productPropertyValue.id}"
                                                                  data-product-property-value-value="${productPropertyValue.value}"
                                                                  data-product-property-value-product-property-id="${productPropertyValue.productProperty.id}" >
                                                            ${productPropertyValue.value}
                                                            </span>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="shopping-cart-price">
                                                    <span>￥<fmt:formatNumber value="${productSelected.productSeries.commonPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
                                                    </td>
                                                    <td class="shopping-cart-quantity">
                                                    <span style=" font-size:14px;">
                                                        <input type="number" name="amount"
                                                               ng-model="amount_${selectedIndex.index}" min="1"
                                                               <c:if test="${not empty productSelected.productSeries.productStore.remain}">max="${productSelected.productSeries.productStore.remain}" </c:if>
                                                               ng-init="amount_${selectedIndex.index}=${productSelected.amount}"/>
                                                    </span>
                                                    </td>
                                                    <td class="shopping-cart-price">
                                                        <%--<span>￥{{amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice} | number:2}}</span>--%>
                                                        <span>{{amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice}| number:2}}</span>
                                                    </td>
                                                    <td>
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
                                                    <td class="shopping-cart-total">
                                                        <p><a href="${path}/cart/remove/${selectedIndex.index}">删除</a></p>
                                                        <p>移到我的关注</p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="4">
                                                    总计：{{<c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">amount_${selectedIndex.index}+</c:forEach>0}}件商品,共
                                                    {{<c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice}+</c:forEach>0 | number:2}}元
                                                </td>
                                                <td><button  class="btn btn-primary col-lg-8" type="button" id="toBill">确&nbsp;&nbsp;&nbsp;认</button></td>
                                            </tr>
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
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                    <h2 class="modal-title">提示:</h2>
                </div>
                <div class="modal-body">
                    <p>您的订单已经生产，订单号为<span class="text-info text-order-id"></span>，
                    总计<span class="text-info text-total-amount"></span>件商品，
                    总价为<span class="text-info text-total-price"></span>元。</p>
                    <p>点击“下一步”按钮您可以完善订单信息。</p>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-lg-7"><a class="btn btn-danger" id="ensure-to-bill" href="${path}/cart/to_bill">下一步</a></div>
                        <div class="col-lg-5">
                            <a class="btn btn-primary" href="${path}/order/cancel">继续逛逛</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
