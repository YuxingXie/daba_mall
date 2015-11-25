<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<div class="main"  ng-app="cartAdjustApp">
    <div class="container"  ng-controller="cartAdjustController">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">购物车</a></li>
            <li class="active">调整购物车</li>
        </ul>
        <div class="col-md-9 col-sm-7"  ng-init="totalPrice=0">

            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive">
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

                                    <tr ng-if="!cart||!cart.productSelectedList">
                                        <td colspan="5">您的购物车中还没有商品</td>
                                    </tr>

                                    <tr name="productSelected" ng-if="cart&&cart.productSelectedList" ng-repeat="productSelected in cart.productSelectedList" >
                                            <td class="shopping-cart-image">
                                                <a ng-href="${path}/product/{{productSelected.productSeriesId}}">
                                                    <img ng-src="${path}/{{productSelected.productSeries.pictures[0]}}"></a>
                                            </td>
                                            <td class="shopping-cart-description">
                                                <h3>{{productSelected.productSeries.name}}</h3>
                                                    <span name="productPropertyValue" ng-repeat="productPropertyValue in productSelected.productPropertyValueList">
                                                    {{productPropertyValue.value}}
                                                    </span>
                                            </td>
                                            <td class="shopping-cart-price">
                                            <span>￥{{productSelected.productSeries.commonPrice | number:2}}</span>
                                            </td>
                                            <td class="shopping-cart-quantity">
                                            <span style=" font-size:14px;">
                                                <input type="number" name="amount" ng-model="productSelected.amount" class="form-control" min="1" ng-change="change()"/>
                                            </span>
                                            </td>
                                            <td class="shopping-cart-price">
                                                <span>{{productSelected.productSeries.commonPrice*productSelected.amount| number:2}}</span>
                                            </td>
                                            <td>
                                                <span ng-if="!productSelected.productSeries.productStore">无库存信息</span>
                                                <span ng-if="productSelected.productSeries.productStore&&productSelected.productSeries.productStore.remain">
                                                剩余{{productSelected.productSeries.productStore.remain}}件
                                                </span>
                                                <span ng-if="productSelected.productSeries.productStore&&!productSelected.productSeries.productStore.remain">无法获取</span>
                                            </td>
                                            <td class="shopping-cart-total">
                                                <p><a href="${path}/cart/remove/{{$index}}">删除</a></p>
                                                <p>移到我的关注</p>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            总计：{{totalAmount}}件商品,共{{totalPrice | number:2}} 元
                                        </td>
                                        <td><button  class="btn btn-primary col-lg-8" type="button" id="toBill" data-ng-click="toBill()">确&nbsp;&nbsp;&nbsp;认</button></td>
                                    </tr>

                                </table>
                            </form>
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
</div>
