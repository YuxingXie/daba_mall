<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
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
          <div class="col-md-9 col-sm-9">
              <div class="row list-view-sorting clearfix">
                  <div class="col-md-10 col-sm-10" style=" width:100%;">
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
                  <%--<div class="row"  ng-show="_page">--%>
                  <%--<div class="col-lg-11" ng-init="numberPerLine=4;maxNumber=_page.content.length;totalLine=maxNumber/numberPerLine">--%>
                      <%--<div class="row" ng-repeat="productSeries in _page.content">--%>
                          <%--<div class="col-sm-3 col-lg-3">--%>
                              <%--<div class="product-item">--%>
                                  <%--<div class="pi-img-wrapper">--%>
                                      <%--<img class="img-responsive" src="${path}/{{productSeries.pictures[0]}}"/>--%>
                                      <%--<div>--%>
                                          <%--<a href="${path}/{{productSeries.pictures[0]}}" class="btn btn-default fancybox-button">大图</a>--%>
                                          <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="{{productSeries.id}}"  data-url="${path}/product_series/popover/{{productSeries.id}}">详情</a>--%>
                                      <%--</div>--%>
                                  <%--</div>--%>
                                  <%--<h3><a href="${path}/product_series/{{productSeries.id}}">{{productSeries.name}}</a></h3>--%>
                                  <%--<div class="pi-price fa fa-rmb fa-fw">{{productSeries.commonPrice}}</div>--%>
                                  <%--<a href="javascript:void(0)" data-href="${path}/cart/{{productSeries.id}}" class="btn btn-default add2cart">添加到购物车</a>--%>
                                      <%--<div class="sticker sticker-new" ng-show="productSeries.newProduct"></div>--%>
                                  <%--<div class="sticker sticker-sale" ng-show="productSeries.evaluateCount>=1000"></div>--%>
                              <%--</div>--%>
                          <%--</div>--%>
                      <%--</div>--%>

                  <%--</div>--%>

              <%--</div>--%>
                  <div class="row" style="padding-bottom:20px;">
                  <%--<div class="col-sm-8 col-lg-8 col-lg-push-4 col-sm-push-4">--%>
                      <%--<ul id="infoPage" class="pagination" ng-init="totalPages:_page.totalPages;currentPage:1;maxShow:5">--%>
                      <%--<ul id="infoPage" class="pagination" ng-init="totalPages=10;currentPage=1;maxShow=5;">--%>
                          <%--<li class="disabled"><a href="javascript:void(0)" ><i class="fa fa-fast-backward"></i></a> </li>--%>
                          <%--<li><a href="javascript:void(0)"><i class="fa fa-backward"></i></a> </li>--%>
                          <%--<li class="active"><a href="javascript:void(0)">1</a> </li>--%>
                          <%--<li><a href="javascript:void(0)">2</a> </li>--%>
                          <%--<li><a href="javascript:void(0)">3</a> </li>--%>
                          <%--<li ng-repeat="number in 100"><a href="javascript:void(0)">md</a></li>--%>
                          <%--<li><a href="javascript:void(0)"><i class="fa fa-forward"></i></a> </li>--%>
                          <%--<li><a href="javascript:void(0)"><i class="fa fa-fast-forward"></i></a> </li>--%>
                      <%--</ul>--%>
                      <tm-pagination conf="paginationConf"></tm-pagination>



            </div>
              </div>
          </div>
          <!-- END CONTENT -->
    </div>
</div>

