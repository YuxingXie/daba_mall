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
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h1>全部商品<c:if
                                test="${not empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">
                            <li>您的购物车中有商品${fn:length(sessionScope.cart.productSelectedList)}</li>
                        </c:if></h1>
                    </div>

                </div>
            </div>
            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive" ng-app>
                            <form action="${path}/cart/to_bill">
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

                                            <c:forEach var="productSelected"
                                                       items="${sessionScope.cart.productSelectedList}"
                                                       varStatus="selectedIndex">
                                                <c:set var="totalPrice"
                                                       value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                                <tr>
                                                    <td class="shopping-cart-image">
                                                        <a href="${path}/product/${productSelected.productSeriesId}"><img
                                                                src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                    </td>
                                                    <td class="shopping-cart-description">
                                                        <h3>${productSelected.productSeries.name}</h3>
                                                        <c:forEach var="productPropertyValue"
                                                                   items="${productSelected.productPropertyValueList}">
                                                            ${productPropertyValue.value}
                                                        </c:forEach>
                                                    </td>
                                                    <td class="shopping-cart-price">
                                                    <span>￥<fmt:formatNumber
                                                            value="${productSelected.productSeries.commonPrice}"
                                                            pattern="##.##"
                                                            minFractionDigits="2"></fmt:formatNumber></span>
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
                                                <%--<td><button href="#" class="btn btn-primary col-lg-8" data-toggle="modal" data-target="#myModal">去结算</button></td>--%>
                                                <td><button  class="btn btn-primary col-lg-8" type="submit">去结算</button></td>
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
        <!-- BEGIN SIDEBAR -->
        <div class="sidebar col-md-3 col-sm-5">
            <div class="sidebar-products clearfix">
                <h2>为您推荐</h2>
                <c:forEach items="${recommendList}" var="productSeries">
                    <div class="item">
                        <a href="item.html"><img src="${path}/statics/assets/temp/products/k1.jpg" alt="腊肉"></a>

                        <h3><a href="item.html">腊肉的防腐能力强，能延长保存时间</a></h3>

                        <div class="price">$31.00</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
