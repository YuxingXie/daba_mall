<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<div class="container"  id="myInterestsAppMain">
    <div ng-controller="myInterestsController">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">我的关注</li>
        </ul>
        <%--<div id="msg">已成功加入购物车！</div>--%>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover text-center" summary="Shopping cart">
                <tr>
                    <th class="text-center">商品信息</th>
                    <th class="text-center">单价</th>
                    <th class="text-center">库存信息</th>
                    <th class="text-center">操作</th>
                </tr>
                <tr ng-if="!interests||interests.length==0">
                    <td colspan="5">您没有关注任何商品!<a href="${path}">返回首页继续购物</a></td>
                </tr>
                <tr name="interest" ng-if="interests&&interests.length>0" ng-repeat="interest in interests" >
                    <td>
                        <img class="img-responsive img-ico-sm text-right inline-block" ng-src="${path}/{{interest.productSeries.pictures[0].picture}}">
                        <a class="inline-block" ng-href="${path}/product_series/{{interest.productSeries.id}}">{{interest.productSeries.name}}</a>
                    </td>

                    <td>
                    <span class="fa fa-rmb">{{interest.productSeries.commonPrice | number:2}}</span>
                    </td>
                    <td>
                        <span ng-if="!interest.productSeries.productStore">无库存信息</span>
                        <span ng-if="interest.productSeries.productStore&&interest.productSeries.productStore.remain">
                        剩余{{interest.productSeries.productStore.remain}}件
                        </span>
                        <span ng-if="interest.productSeries.productStore&&!interest.productSeries.productStore.remain">无法获取</span>
                    </td>
                    <td>
                        <a ng-href="${path}/personal/interests/remove/{{interest.id}}" class="fa fa-trash">删除</a>
                        <a href="javascript:void(0)" class="fa fa-shopping-cart" data-ng-click="popover(interest.productSeries.id)">添加到购物车</a>
                    </td>
                </tr>
            </table>

        </div>

        <div class="modal fade active" id="showProductModal" tabindex="-1" role="dialog" aria-labelledby="showProductModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <table>
                            <tr>
                                <th class="modal-title" >{{productSelected.productSeries.name}}</th>
                                <th class="center-block">
                                    <div class="center-block" star rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="true"></div>
                                </th>
                            </tr>
                        </table>

                    </div>
                    <form name="popForm" class="bg-success">
                        <div class="row">
                            <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                                <a ng-href="${path}/{{productSelected.productSeries.pictures[0].bigPicture}}">
                                    <img ng-src="${path}/{{productSelected.productSeries.pictures[0].picture}}" alt="" width="320" height="180" />
                                </a>
                            </div>
                            <ul class="thumbnails easyzoom-thumbnails">
                                <li ng-repeat="picture in productSelected.productSeries.pictures">
                                    <a ng-href="${path}/{{picture.bigPicture}}" data-standard="${path}/{{picture.picture}}">
                                        <img ng-src="${path}/{{picture.picture}}" alt="" class="img-ico-md" />
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="row table-responsive">
                            <table class="table table-condensed">
                                <th>价格<i class="fa fa-rmb"></i></th>
                                <td class="text-left">{{productSelected.productSeries.commonPrice}}
                                    <em ng-if="productSelected.productSeries.currentPrice &&productSelected.productSeries.currentPrice.prevPrice && productSelected.productSeries.currentPrice<productSelected.productSeries.currentPrice.prevPrice">
                                        <i class="fa fa-rmb"></i>{{productSelected.productSeries.currentPrice.prevPrice.price}}
                                    </em>
                                </td>
                                <th>库存<i class="fa fa-cubes"></i></th>
                                <td class="text-left">{{productSelected.productSeries.productStore.remain}}</td>
                                </tr>
                                <tr>
                                    <td colspan="4"><i>{{productSelected.productSeries.description}}</i></td>
                                </tr>
                                <tr>
                                    <th>选择商品<i class="fa fa-flag"></i></th>
                                    <th colspan="3">
                                        <span ng-repeat="productProperty in productSelected.productSeries.productProperties">
                                        <i class="fa fa-spin fa-sun-o"></i>{{productProperty.propertyName}}:
                                        <select  ng-model="$parent.productSelected.productPropertyValueList[$index]"
                                                 required="true"
                                                 ng-options="productPropertyValue.value for productPropertyValue in productProperty.propertyValues"></select>

                                        </span>

                                    </th>
                                </tr>
                                <tr>
                                    <th>输入数量<i class="fa fa-cube"></i></th>
                                    <td><input type="number" min="1" class="" ng-model="productSelected.amount" style="max-width: 100px;"></td>
                                    <td> <button data-toggle="tooltip" data-original-title="xxx" data-placement="left" data-trigger="click" data-selector="#cart-block"
                                                 class="btn btn-primary add2cart pull-right fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button></td>
                                    <td>
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
