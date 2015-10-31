<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="main" data-description="from cart page">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">购物车</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive" ng-app>
                            <form action="${path}/cart/to_bill" method="post" id="form"  enctype='application/json'>
                                <input type="hidden" name="cart"/>
                                <table summary="Shopping cart">
                                    <tr>
                                        <th class="shopping-cart-image"></th>
                                        <th class="shopping-cart-description">商品信息</th>
                                        <th class="shopping-cart-price">商品单价</th>
                                        <th class="shopping-cart-ref-no">商品数量</th>
                                        <th class="shopping-cart-price">商品金额</th>
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
                                                    data-amount="${productSelected.amount}"
                                                    data-common-price="${productSelected.productSeries.commonPrice}">
                                                    <td class="shopping-cart-image" name="pictures0" data-pictures0="${productSelected.productSeries.pictures[0]}">
                                                        <a href="${path}/product/${productSelected.productSeriesId}">
                                                            <img src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                        <%--<input type="hidden" name="cart[productSelectedList][${selectedIndex.index}][amount]" value="${productSelected.amount}">--%>
                                                        <%--<input type="hidden" name="cart[productSelectedList][${selectedIndex.index}][productSeriesId]" value="${productSelected.productSeriesId}">--%>

                                                    </td>
                                                    <td class="shopping-cart-description">
                                                        <h3>${productSelected.productSeries.name}</h3>
                                                        <c:forEach var="productPropertyValue" items="${productSelected.productPropertyValueList}">
                                                            <span name="productPropertyValue"
                                                                  data-product-property-value-id="${productPropertyValue.id}"
                                                                  data-product-property-value-value="${productPropertyValue.value}"
                                                                  data-product-property-value-product-property-id="${productPropertyValue.productPropertyId}" >
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
                                                               ng-init="amount_${selectedIndex.index}=${productSelected.amount}"/>
                                                    </span>
                                                    </td>
                                                    <td class="shopping-cart-price">
                                                        <span>￥{{amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice} | number:2}}</span>
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
                                                <td><button  class="btn btn-primary col-lg-8" type="button" id="toBill">去结算</button></td>
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
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
