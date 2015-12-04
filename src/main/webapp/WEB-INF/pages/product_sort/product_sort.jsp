<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="main" ng-app="productSortApp" id="productSortAppMain">
      <div class="container" ng-controller="productSortCtrl">
        <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="row">
              <ul class="breadcrumb col-md-3 col-sm-5">
                <li><a href="${path}">首页</a></li>
                <li>${productSubCategory.productCategory.categoryName}</li>
                <li class="active">${productSubCategory.subCategoryName}</li>
              </ul>
            </div>
          <!-- BEGIN CONTENT -->
          <div class="row list-view-sorting clearfix">
              <div class="col-md-10 col-sm-10">
                  <div class="pull-left">
                      <label class="control-label"><a href="#" title="点击后恢复默认排序">综合排序&nbsp;&nbsp;<i
                              class="fa fa-chevron-down"></i></a></label>
                  </div>
                  <div class="pull-left">
                      <label class="control-label"><a href="#" title="点击后按照价格从高到低排序">价格排序&nbsp;&nbsp;<i
                              class="fa fa-chevron-down"></i></a></label>
                  </div>
                  <div class="pull-left">
                      <label class="control-label"><a href="#" title="点击后按照销量从多到少排序">销量排序&nbsp;&nbsp;<i
                              class="fa fa-chevron-down"></i></a></label>
                  </div>
                  <div class="pull-left">
                      <label class="control-label"><a href="#" title="点击后按照评论从多到少排序">评论排序&nbsp;&nbsp;<i
                              class="fa fa-chevron-down"></i></a></label>
                  </div>
              </div>
              <div class="row"  ng-show="!_page">
                  <c:forEach items="${_page.content}" varStatus="i"  var="productSeries">
                      <div class="col-sm-3 col-lg-3">
                          <div class="product-item">
                              <div class="pi-img-wrapper">
                                  <img class="img-responsive" src="${path}/${productSeries.pictures[0]}"/>
                                  <div>
                                      <a href="${path}/${productSeries.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                      <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="${productSeries.id}"  data-url="${path}/product_series/popover/${productSeries.id}">详情</a>
                                  </div>
                              </div>
                              <h3><a href="${path}/product_series/${productSeries.id}">${productSeries.name}</a></h3>
                              <div class="pi-price fa fa-bank">${productSeries.commonPrice}</div>
                              <a href="javascript:void(0)" data-href="${path}/cart/${productSeries.id}" class="btn btn-default add2cart">添加到购物车</a>
                                <c:if test="${productSeries.newProduct}"><div class="sticker sticker-new"></div></c:if>
                              <c:if test="${productSeries.evaluateCount ge 1000}"><div class="sticker sticker-sale"></div></c:if>
                          </div>
                      </div>
                  </c:forEach>
                  </div>
              <div class="row"  ng-show="_page">
                  <div class="col-sm-3 col-lg-3" ng-repeat="productSeries in _page.content">
                      <div class="product-item">
                          <div class="pi-img-wrapper">
                              <img class="img-responsive" ng-src="${path}/{{productSeries.pictures[0]}}"/>
                              <div>
                                  <a ng-href="${path}/{{productSeries.pictures[0]}}" class="btn btn-default fancybox-button">大图</a>
                                  <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="{{productSeries.id}}"  data-url="${path}/product_series/popover/{{productSeries.id}}">详情</a>
                              </div>
                          </div>
                          <h3><a ng-href="${path}/product_series/{{productSeries.id}}">{{productSeries.name}}</a></h3>
                          <i class="fa fa-jpy">{{productSeries.commonPrice}}</i>
                          <a href="javascript:void(0)" data-href="${path}/cart/{{productSeries.id}}" class="btn btn-default add2cart">添加到购物车</a>
                              <div class="sticker sticker-new" ng-show="productSeries.newProduct"></div>
                          <div class="sticker sticker-sale" ng-show="productSeries.evaluateCount>=1000"></div>
                      </div>
                  </div>
              </div>
              <div class="row" style="padding-bottom:20px;" id="infoPage">
                  <tm-pagination conf="paginationConf"></tm-pagination>
              </div>
          </div>

          <!-- END CONTENT -->
      </div>
</div>

