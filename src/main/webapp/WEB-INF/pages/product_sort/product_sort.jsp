<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="bg-info" ng-controller="productSortCtrl">
    <div class="container" id="productSortAppMain">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row">
            <ul class="breadcrumb col-md-3 col-sm-5">
                <li><a href="${path}">首页</a></li>
                <li>${productSubCategory.productCategory.categoryName}</li>
                <li class="active">${productSubCategory.subCategoryName}</li>
            </ul>
        </div>

        <div class="row margin-bottom-40">
                <div class="col-md-10 col-sm-10 btn-group btn-group-xs">
                        <%--<button class="btn btn-primary btn-small" ng-click="toSort('default');">--%>
                            <%--综合排序<i ng-class="{'fa':true,'fa-chevron-down':sort.asc&&sort.field=='default','fa-chevron-up':!sort.asc&&sort.field=='default'}"></i></button>--%>
                        <button class="btn btn-primary btn-small" ng-click="toSort('sales');">
                                销量排序<i ng-class="{'fa':true,'fa-chevron-down':sort.asc&&sort.field=='sales','fa-chevron-up':!sort.asc&&sort.field=='sales'}"></i></button>
                        <button class="btn btn-primary btn-small" ng-click="toSort('price');">
                            价格排序<i ng-class="{'fa':true,'fa-chevron-down':sort.asc&&sort.field=='price','fa-chevron-up':!sort.asc&&sort.field=='price'}"></i></button>
                        <button class="btn btn-primary btn-small" ng-click="toSort('evaluate');">
                            评论排序<i ng-class="{'fa':true,'fa-chevron-down':sort.asc&&sort.field=='evaluate','fa-chevron-up':!sort.asc&&sort.field=='evaluate'}"></i></button>
                </div>

        </div>

        <div class="row">
            <div class="col-lg-3 col-sm-3 padding-left-5 padding-right-0 margin-top-20 height-290" ng-repeat="productSeries in _page.content">
                <div class="thumbnail">
                    <a ng-href="${path}/product_series/{{productSeries.id}}">
                        <img ng-src="${path}/statics/img/img_not_found.jpg" class="img-responsive img-thumbnail" ng-if="!productSeries.pictures" >
                        <img ng-src="${path}/{{productSeries.pictures[0].picture}}" class="img-responsive img-thumbnail height-265"  ng-if="productSeries.pictures">
                    </a>
                    <div class="sticker sticker-new" ng-if="productSeries.newProduct"></div>
                    <div class="sticker sticker-sale" ng-if="productSeries.hotSell"></div>
                    <div class="row margin-left-0">
                        <a href="${path}/product_series/{{productSeries.id}}" class="pull-left">{{productSeries.name}}</a>
                        <i class="fa fa-rmb pi-price"></i>{{productSeries.commonPrice | number:2}}&nbsp;&nbsp;
                        <a href="javascript:void(0)"
                           class="fa fa-shopping-cart btn btn-danger btn-xs pull-right margin-right-20" data-ng-click="popover(productSeries.id);">添加到购物车</a>

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
                            <th>价格</th>
                            <td class="text-left"><i class="fa fa-rmb"></i>{{productSelected.productSeries.commonPrice}}
                                <em ng-if="productSelected.productSeries.currentPrice &&productSelected.productSeries.currentPrice.prevPrice &&lowPrice()">
                                    <del><i class="fa fa-rmb"></i>{{productSelected.productSeries.currentPrice.prevPrice.price}}</del>
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
                                <td> <button class="btn btn-primary add2cart pull-right fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button></td>
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


