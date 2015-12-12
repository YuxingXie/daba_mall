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
        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center" summary="Shopping cart">
                <tr>
                    <th colspan="2" class="text-center">商品信息</th>
                    <th class="text-center">单价</th>
                    <th class="text-center">库存信息</th>
                    <th class="text-center">操作</th>
                </tr>
                <tr ng-if="!interests||interests.length==0">
                    <td colspan="5">您没有关注任何商品!<a href="${path}">返回首页继续购物</a></td>
                </tr>

                <tr name="interest" ng-if="interests&&interests.length>0" ng-repeat="interest in interests" >
                    <td>
                        <img class="img-responsive img-ico-sm text-right" ng-src="${path}/{{interest.productSeries.pictures[0]}}">
                    </td>
                    <td class="text-left">
                        <a ng-href="${path}/product_series/{{interest.productSeries.id}}">{{interest.productSeries.name}}</a>
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
                        <a href="javascript:void(0)" class="fa fa-shopping-cart" ng-click="popover(interest.productSeries.id)">添加到购物车</a>
                    </td>
                </tr>
            </table>

        </div>
        <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
                <form name="popForm">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="product-main-image">
                                <img ng-src="${path}/{{productSeries.pictures[0]}}" class="img-responsive">
                            </div>
                            <div class="product-other-images" ng-repeat="picture in productSeries.pictures" style="display: inline-block" >
                                    <a ng-if="$index===0" href="javascript:void(0)" class="active"><img ng-src="${path}/{{picture}}"></a>
                                    <a ng-if="$index!==0" href="javascript:void(0)"><img ng-src="${path}/{{picture}}"></a>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1 style=" text-align:center;">{{productSeries.name}}</h1>
                            <div class="price-availability-block clearfix">
                                <div class="price">
                                    <strong><span>$</span>{{productSeries.commonPrice | number:2}}</strong>
                                    <em ng-if="productSeries.currentPrice &&productSeries.currentPrice.prevPrice">$<span>62.00</span></em>
                                </div>
                                <div class="availability">
                                    库存: <strong>{{productSeries.productStore.remain}}</strong>
                                </div>
                            </div>
                            <div class="description" style=" direction:ltr;">
                                <p>{{productSeries.description}}</p>
                            </div>
                            <div class="product-page-options">
                                <input type="hidden" name="productSeriesId" value="{{productSeries.id}}"/>
                                <div class="pull-left" ng-repeat="productProperty in productSeries.productProperties">
                                    <label class="control-label" style=" direction:ltr;">{{productProperty.propertyName}}&nbsp;:&nbsp;</label>
                                    <select class="form-control input-sm product-property" name="productPropertyId">
                                        <option ng-repeat="propertyValue in productProperty.propertyValues" value="{{propertyValue.id}}">{{propertyValue.value}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="product-page-cart">
                                <div class="product-quantity">
                                    <input id="product-quantity" type="number" value="1" name="product-quantity" class="form-control"/>
                                </div>
                                <button class="btn btn-primary add2cart" type="button">添加到购物车</button>
                                <button class="btn btn-default" type="button">更多商品</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
