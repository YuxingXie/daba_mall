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
        <div class="shopping-cart-data clearfix">
            <div class="table-wrapper-responsive" ng-app>
                <form class="form-horizontal form-without-legend" novalidate="novalidate" action="${path}/index/order/submit" id="form" autocomplete="off" method="post">
                    <table summary="Shopping cart">
                        <tr>
                            <th class="bg-info text-center" colspan="2">填写并核对订单</th>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div class="form-group has-feedback">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">订单号</label>
                                        </div>
                                        <div class="col-lg-5 has-success">
                                            ${order.id}<input type="hidden" name="id" value="${order.id}"/>
                                        </div>
                                    </div><br/>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">收件人姓名<span class="require">*</span></label>
                                        </div>
                                            <div class="col-lg-5 has-success">
                                                <input type="text"  name="acceptPersonName" value="${order.user.name}"
                                                                                placeholder="请填写收件人姓名" class="form-control"/>
                                                <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>
                                    </div><br/>
                                    <div class="row" ng-controller="appCtrl">
                                        <div class="col-lg-2">
                                            <label class="control-label">收件地址<span class="require">*</span></label>
                                        </div>
                                        <div class="col-lg-8 has-success">
                                            <input name="acceptAddress" select-address p="p" c="c" a="a" d="d" ng-model="xxx"
                                                   placeholder="请选择收件地址" type="text" class="form-control"/>
                                            <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                        </div>
                                    </div><br/>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">联系电话<span class="require">*</span></label>
                                        </div>
                                            <div class="col-lg-8 has-success">
                                                <input name="contactPhone" placeholder="请填写联系电话" type="tel" class="form-control" value="${order.user.phone}"/>
                                                <span ng-show="signupForm.name.$valid" class="glyphicon glyphicon-ok form-control-feedback"></span>
                                            </div>
                                     </div><br/>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <label class="control-label">付款方式<span class="require">*</span></label>
                                        </div>
                                        <div class="col-lg-8 has-success">
                                            <div class="radio-button radio-inline"><label><input type="radio" value="1"
                                                                                                 name="payWay"/>货到付款</label>
                                            </div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="2"
                                                                                                 name="payWay"/>在线支付</label>
                                            </div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="3"
                                                                                                 name="payWay"/>公司转账</label>
                                            </div>
                                            <div class="radio-button radio-inline"><label><input type="radio" value="4"
                                                                                                 name="payWay"/>邮局汇款</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="bg-info text-center" colspan="2">送货清单</th>
                        </tr>
                        <c:choose>
                            <c:when test="${empty sessionScope.order ||empty sessionScope.order.productSelectedList}">
                                <tr>
                                    <th colspan="5">不知道什么原因，您订单中没有商品。</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:set var="totalPrice" value="0"/>
                                <c:set var="totalCount" value="0"/>
                                <c:forEach var="productSelected"
                                           items="${order.productSelectedList}"
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
                                            <c:set var="totalCount"
                                                   value="${totalCount+productSelected.amount}"/>

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
                                        总计：${totalCount}件商品,共<fmt:formatNumber value="${totalPrice}"
                                                                               pattern="##.##"
                                                                               minFractionDigits="2"></fmt:formatNumber>元
                                    </th>
                                        <%--<td><button href="#" class="btn btn-primary col-lg-8" data-toggle="modal" data-target="#myModal">去结算</button></td>--%>
                                    <td>
                                        <button class="btn btn-primary col-lg-8" type="submit">提交订单</button>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </form>
            </div>
        </div>





    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
