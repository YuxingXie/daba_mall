<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="bg-info">
    <div class="container" id="productSortAppMain"  ng-controller="productSortCtrl">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row">
            <ul class="breadcrumb col-md-3 col-sm-5">
                <li><a href="${path}">首页</a></li>
                <li>${productSubCategory.productCategory.categoryName}</li>
                <li class="active">${productSubCategory.subCategoryName}</li>
            </ul>
        </div>
        <!-- BEGIN CONTENT -->
        <div class="row margin-bottom-40">
                <div class="col-md-10 col-sm-10 btn-group btn-group-xs"ng-init="defaultSort=true;priceSort=true;salesSort=true;evaluateSort=true">
                        <button class="btn btn-primary btn-small" ng-click="defaultSort=!defaultSort">综合排序<i ng-class="{'fa':true,'fa-chevron-down':defaultSort,'fa-chevron-up':!defaultSort}"></i></button>
                        <button class="btn btn-primary btn-small" ng-click="priceSort=!priceSort">价格排序<i ng-class="{'fa':true,'fa-chevron-down':priceSort,'fa-chevron-up':!priceSort}"></i></button>
                        <button class="btn btn-primary btn-small" ng-click="salesSort=!salesSort">销量排序<i ng-class="{'fa':true,'fa-chevron-down':salesSort,'fa-chevron-up':!salesSort}"></i></button>
                        <button class="btn btn-primary btn-small" ng-click="evaluateSort=!evaluateSort">评论排序<i ng-class="{'fa':true,'fa-chevron-down':evaluateSort,'fa-chevron-up':!evaluateSort}"></i></button>
                </div>

        </div>

        <div class="row">
            <div class="col-lg-3 col-sm-3 padding-left-5 padding-right-0 margin-top-20 height-290" ng-repeat="productSeries in _page.content | orderBy:'commonPrice':true">
                <div class="thumbnail">
                    <a ng-href="${path}/product_series/{{productSeries.id}}">
                        <img ng-src="${path}/statics/img/img_not_found.jpg" class="img-responsive img-thumbnail" ng-if="!productSeries.pictures" >
                        <img ng-src="${path}/{{productSeries.pictures[0].picture}}" class="img-responsive img-thumbnail height-265"  ng-if="productSeries.pictures">
                    </a>
                    <div class="sticker sticker-new" ng-if="productSeries.newProduct"></div>
                    <div class="sticker sticker-sale" ng-if="productSeries.evaluateCount>=1000"></div>
                    <div class="row margin-left-0">
                        <a href="${path}/product_series/{{productSeries.id}}" class="pull-left">{{productSeries.name}}</a>
                        <i class="fa fa-rmb pi-price"></i>{{productSeries.commonPrice}}&nbsp;&nbsp;
                        <a href="javascript:void(0)"
                           class="fa fa-shopping-cart btn btn-danger btn-xs pull-right margin-right-20" data-ng-click="popover('{{productSeries.id}}');">添加到购物车</a>

                    </div>
                    <div class="row  margin-left-0 margin-right-0 text-left bg-info height-50">
                        <em>
                            {{productSeries.description | cut:true:20:' ...'}}
                        </em>
                    </div>

                </div>
            </div>

        </div>

        <div class="row" style="padding-bottom:20px;" id="infoPage">
            <tm-pagination conf="paginationConf"></tm-pagination>
        </div>
        <!-- END CONTENT -->
    </div>
</div>


