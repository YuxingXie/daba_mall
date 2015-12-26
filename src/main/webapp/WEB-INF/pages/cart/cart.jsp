<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<div class="container"  id="cartAdjustAppMain">
    <div ng-controller="cartAdjustController">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">购物车</a></li>
            <li class="active">调整购物车</li>
        </ul>
        <div class="row" data-class="table-responsive">
        <form action="${path}/cart/adjust" method="post" id="form"  enctype='application/json'>
            <table class="table table-bordered table-striped table-condensed text-center">
                <tr>
                    <th class="text-center"></th>
                    <th class="text-center">商品信息</th>
                    <th class="text-center">商品单价</th>
                    <th class="text-center">商品数量</th>
                    <th class="text-center">商品金额</th>
                    <th class="text-center">库存信息</th>
                    <th class="text-center">交易操作</th>
                </tr>
                <tr ng-if="!cart||!cart.productSelectedList||cart.productSelectedList.length==0">
                    <td colspan="5">您的购物车中空空如也!<a href="${path}">返回首页继续购物</a></td>
                </tr>

                <tr ng-if="cart&&cart.productSelectedList&&cart.productSelectedList.length>0" ng-repeat="productSelected in cart.productSelectedList" >
                        <td>
                            <a ng-href="${path}/product_series/{{productSelected.productSeries.id}}">
                                <img class="img-responsive img-ico-sm center-block" ng-src="${path}/{{productSelected.productSeries.pictures[0].picture}}"></a>
                        </td>
                        <td>
                            <b>{{productSelected.productSeries.name}}</b>
                                <em name="productPropertyValue" ng-repeat="productPropertyValue in productSelected.productPropertyValueList">
                                {{productPropertyValue.value}}
                                </em>
                        </td>
                        <td>
                        <span class="fa fa-rmb">{{productSelected.productSeries.commonPrice | number:2}}</span>
                        </td>
                        <td>
                        <span style=" font-size:14px;">
                            <input type="number" name="amount" style="width: 100px;" ng-model="cart.productSelectedList[$index].amount" class="form-control center-block" min="1" ng-change="change()"/>
                        </span>
                        </td>
                        <td>
                            <span>{{productSelected.productSeries.commonPrice*productSelected.amount| number:2}}</span>
                        </td>
                        <td>
                            <span ng-if="!productSelected.productSeries.productStore">无库存信息</span>
                            <span ng-if="productSelected.productSeries.productStore&&productSelected.productSeries.productStore.remain">
                            剩余{{productSelected.productSeries.productStore.remain}}件
                            </span>
                            <span ng-if="productSelected.productSeries.productStore&&!productSelected.productSeries.productStore.remain">无法获取</span>
                        </td>
                        <td>
                            <a href="${path}/cart/remove/{{$index}}" class="fa fa-trash">删除</a>&nbsp;&nbsp;
                            <a href="${path}/cart/add_to_interest/{{$index}}" class="fa fa-heart-o">添加到我的关注</a>
                        </td>
                </tr>
                <tr>
                    <td colspan="6" class="text-right">
                        总计：<b>{{totalAmount}}</b>件商品,共<b>{{totalPrice | number:2}}</b> 元
                    </td>
                    <td><input  class="btn btn-primary btn-sm" type="button" id="toBill" data-ng-click="toBill()" ng-if="cart&&cart.productSelectedList&&cart.productSelectedList.length>0" value="确认"/></td>
                </tr>

            </table>
        </form>

        </div>
        <div class="modal fade active" id="orderModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 400px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title">提示:</h2>
                    </div>
                    <div class="modal-body">
                        <p>您的订单已经生产，订单号为<span class="text-info text-order-id">{{order.id}}</span>，
                            总计<span class="text-info text-total-amount">{{order.totalAmount}}</span>件商品，
                            总价为<span class="text-info text-total-price">{{order.totalPrice}}</span>元。</p>
                        <p>点击“下一步”按钮您可以完善订单信息。</p>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-lg-7"><a class="btn btn-danger" id="ensure-to-bill" ng-href="${path}/order/to_submit/{{order.id}}">下一步</a></div>
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
