<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">订单商品评价</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-12">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-responsive">
                            <form action="${path}/cart/adjust" method="post" id="form" enctype='application/json'>
                                <input type="hidden" name="cart"/>
                                <table class="table table-hover">
                                    <tr><th colspan="5">提示：如果您的订单中多个商品项为同一个产品的不同规格，我们认为这些商品项是同一个商品。订单中的同一个商品只能评价一次。</th></tr>
                                    <c:choose>
                                        <c:when test="${empty order}">
                                            <tr>
                                                <th colspan="5" class="text-info center-block shopping-cart-description">不知为什么订单不见了</th><th><a href="${path}">返回首页</a>或联系客服 </th>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                        <tr>
                                            <th colspan="2" class="text-center">商品信息</th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th>总价</th>
                                            <th>收货状态</th>
                                            <th>操作</th>
                                        </tr>
                                        <c:forEach var="productSelected" items="${order.productSelectedList}" varStatus="selectedIndex">
                                            <c:choose>
                                                <c:when test="${empty productSelected.productSeries.id}">
                                                    <tr>
                                                        <td class="text-center" colspan="6">
                                                            没有找到您当时选择的商品，商品可能已被移除或下架,如果您已经付款请联系客服，如果没有付款，您可以删除该订单。
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr name="productSelected">
                                                        <td class="">
                                                            <img class="img-ico-md img-responsive" src="${path}/${productSelected.productSeries.pictures[0].picture}">
                                                        </td>
                                                        <td >
                                                            <a href="${path}/product_series/${productSelected.productSeries.id}">${productSelected.productSeries.name}</a>
                                                            <c:forEach var="productPropertyValue" items="${productSelected.productPropertyValueList}">${productPropertyValue.value} </c:forEach>
                                                        </td>
                                                        <td>
                                                            ￥<fmt:formatNumber value="${productSelected.productSeries.commonPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
                                                        </td>
                                                        <td>${productSelected.amount}</td>
                                                        <td>
                                                            ￥<fmt:formatNumber value="${productSelected.amount*productSelected.productSeries.commonPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
                                                        </td>
                                                        <td>
                                                                <c:choose>
                                                                    <c:when test="${empty productSelected.receiveStatus or productSelected.receiveStatus eq 'n'}">未收货</c:when>
                                                                    <c:otherwise>
                                                                        <c:choose>
                                                                            <c:when test="${empty productSelected.productEvaluate}">已收货,未评价</c:when>
                                                                            <c:otherwise>已评价</c:otherwise>
                                                                        </c:choose>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${empty productSelected.receiveStatus or productSelected.receiveStatus eq 'n'}"><a class="fa fa-sign-in" href="${path}/order/receive_item?id=${order.id}&index=${selectedIndex.index}">确认收货</c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${empty productSelected.productEvaluate}"><a class="fa fa-pencil" href="${path}/product_series/${productSelected.productSeries.id}?orderId=${order.id}">去评价</a></c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
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



    <div class="modal fade active" id="evaluteModal" tabindex="-1" role="dialog"
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
                                <a class="btn btn-danger fa fa-trash fa-fw" id="ensure-evalute">确定</a>
                                <a class="btn btn-primary" data-dismiss="modal">取消</a>
                            </div>
                        </div>
                    </div>


            </div>


        </div>


    </div>
</div>

