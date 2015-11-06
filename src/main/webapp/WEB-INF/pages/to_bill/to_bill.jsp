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
            <li><a href="">购物车</a></li>
            <li class="active">填写订单</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive" ng-app>
                            <form action="${path}/index/order/submit" id="form" autocomplete="off">
                                <table summary="Shopping cart">
                                    <tr>
                                        <th class="shopping-cart-description"  colspan="2">填写并核对订单</th>
                                    </tr>
                                    <tr>
                                        <th class="shopping-cart-image" colspan="4">生成订单号为：${order.id}</th>
                                    </tr>
                                    <tr>
                                        <td class="shopping-cart-image">收货人信息：</td>
                                        <td class="shopping-cart-description">${order.user.name}</td>
                                        <td class="shopping-cart-price" colspan="2" ng-controller="appCtrl">
                                            <input select-address p="p" c="c" a="a" d="d" ng-model="xxx" placeholder="请选择所在地" type="text" class="form-control" />
                                        </td>
                                        <td class="shopping-cart-quantity">1390306***6</td>
                                        <td class="shopping-cart-total">
                                           <a href="${path}/cart/remove/${selectedIndex.index}">删除</a>
                                            <a href="${path}/cart/remove/${selectedIndex.index}">编辑</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="shopping-cart-description"  colspan="2">支付方式</th>
                                        <th class="shopping-cart-image" colspan="4"></th>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div class="radio-button radio-inline"><label><input type="radio" value="1" name="payWay" />货到付款</label></div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="2" name="payWay" />在线支付</label></div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="3" name="payWay" />公司转账</label></div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="4" name="payWay" />邮局汇款</label></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="shopping-cart-description"  colspan="2">送货清单</th>
                                        <th class="shopping-cart-image" colspan="4"></th>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${empty order ||empty order.productSelectedList}">
                                            <tr>
                                                <td colspan="5">您的购物车中还没有商品</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="totalPrice" value="0"/>
                                            <c:set var="totalCount" value="0"/>

                                            <c:forEach var="productSelected"
                                                       items="${order.productSelectedList}"
                                                       varStatus="selectedIndex">
                                                <c:set var="totalPrice" value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                                <tr>
                                                    <td class="shopping-cart-image">
                                                        <a href="${path}/product/${productSelected.productSeriesId}"><img
                                                                src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                    </td>
                                                    <td class="shopping-cart-description">
                                                        <h3>${productSelected.productSeries.name}</h3>

                                                    </td>
                                                    <td class="shopping-cart-price">
                                                        <c:forEach var="productPropertyValue"
                                                                   items="${productSelected.productPropertyValueList}">
                                                            ${productPropertyValue.value}
                                                        </c:forEach>
                                                    </td>
                                                    <td class="shopping-cart-quantity">
                                                        <span>￥<fmt:formatNumber
                                                                value="${productSelected.productSeries.commonPrice}"
                                                                pattern="##.##"
                                                                minFractionDigits="2"></fmt:formatNumber>* ${productSelected.amount}</span>
                                                        <c:set var="totalCount" value="${totalCount+productSelected.amount}"/>

                                                    </td>
                                                    <td class="shopping-cart-price">
                                                        <span>￥${productSelected.productSeries.commonPrice}</span>
                                                    </td>
                                                    <td class="shopping-cart-total">
                                                       有货
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <th colspan="4">
                                                    总计：${totalCount}件商品,共<fmt:formatNumber value="${totalPrice}" pattern="##.##"  minFractionDigits="2"></fmt:formatNumber>元
                                                </th>
                                                    <%--<td><button href="#" class="btn btn-primary col-lg-8" data-toggle="modal" data-target="#myModal">去结算</button></td>--%>
                                                <td><button  class="btn btn-primary col-lg-8" type="submit">提交订单</button></td>
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
