<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" ng-app="productSortApp" id="productSortAppMain" ng-controller="productSortCtrl">
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
          </div>
          <div class="row"  ng-show="!_page">
              <%--<c:forEach items="${_page.content}" varStatus="i"  var="productSeries">--%>
                  <%--<div class="col-sm-3 col-lg-3">--%>
                              <%--<img class="img-responsive img-thumbnail" src="${path}/${productSeries.pictures[0]}"/>--%>
                              <%--<div>--%>
                                  <%--<a href="${path}/${productSeries.pictures[0]}" class="btn btn-default fancybox-button">大图</a>--%>
                                  <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="${productSeries.id}"  data-url="${path}/product_series/popover/${productSeries.id}">详情</a>--%>
                              <%--</div>--%>

                          <%--<h3><a href="${path}/product_series/${productSeries.id}">${productSeries.name}</a></h3>--%>
                          <%--<div class="fa fa-rmb">${productSeries.commonPrice}</div>--%>
                          <%--<a href="javascript:void(0)" data-href="${path}/cart/${productSeries.id}" class="fa fa-shopping-cart btn btn-default add2cart">添加到购物车</a>--%>
                            <%--<c:if test="${productSeries.newProduct}"><div class="sticker sticker-new"></div></c:if>--%>
                          <%--<c:if test="${productSeries.evaluateCount ge 1000}"><div class="sticker sticker-sale"></div></c:if>--%>

                  <%--</div>--%>
              <%--</c:forEach>--%>
                  <c:forEach items="${_page.content}" var="prod">
                      <div class="col-lg-3 col-sm-3 thumbnail text-center margin-bottom-15">
                          <a href="${path}/product_series/${prod.id}"><img src="${path}/${prod.pictures[0]}" class="img-responsive img-thumbnail product-show" ></a>
                          <div class="row"> <p class="fa fa-rmb pi-price col-lg-8 col-sm-8 text-left">${prod.commonPrice}</p></div>
                          <div class="row">
                              <p class="pi-description col-lg-12 col-sm-12 text-left"> <a href="${path}/product_series/${prod.id}">${prod.name}</a>
                                  <c:choose>
                                      <c:when test="${fn:length(prod.description) > 20}">${fn:substring(prod.description, 0, 20)}...</c:when>
                                      <c:otherwise>${prod.description}</c:otherwise>
                                  </c:choose>
                              </p>
                          </div>
                          <div class="row margin-bottom-20">
                                <span class="col-lg-6 col-sm-6 col-lg-push-6 col-sm-push-6">
                                    <a href="#product-pop-up" data-prod="${prod.id}" class="fa fa-shopping-cart btn btn-danger fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">添加到购物车</a>
                                 </span>
                              <c:if test="${prod.newProduct}"><div class="sticker sticker-new"></div></c:if>
                          </div>
                      </div>
                  </c:forEach>
              </div>
          <div class="row"  ng-show="_page">
              <!--不需要-->
              <%--<div class="col-sm-3 col-lg-3" ng-repeat="productSeries in _page.content">--%>
                  <%--<div class="product-item">--%>
                      <%--<div class="pi-img-wrapper">--%>
                          <%--<img class="img-responsive" ng-src="${path}/{{productSeries.pictures[0]}}"/>--%>
                          <%--<div>--%>
                              <%--<a ng-href="${path}/{{productSeries.pictures[0]}}" class="btn btn-default fancybox-button">大图</a>--%>
                              <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="{{productSeries.id}}"  data-url="${path}/product_series/popover/{{productSeries.id}}">详情</a>--%>
                          <%--</div>--%>
                      <%--</div>--%>
                      <%--<h3><a ng-href="${path}/product_series/{{productSeries.id}}">{{productSeries.name}}</a></h3>--%>
                      <%--<i class="fa fa-jpy">{{productSeries.commonPrice}}</i>--%>
                      <%--<a href="javascript:void(0)" data-href="${path}/cart/{{productSeries.id}}" class="btn btn-default add2cart">添加到购物车</a>--%>
                          <%--<div class="sticker sticker-new" ng-show="productSeries.newProduct"></div>--%>
                      <%--<div class="sticker sticker-sale" ng-show="productSeries.evaluateCount>=1000"></div>--%>
                  <%--</div>--%>
              <%--</div>--%>



                  <!--需要-->
                  <div class="col-lg-3 col-sm-3 thumbnail text-center margin-bottom-15" ng-repeat="productSeries in _page.content">
                      <a ng-href="${path}/product_series/{{productSeries.id}}">
                          <img ng-src="${path}/{{productSeries.pictures[0]}}" class="img-responsive img-thumbnail product-show" >
                      </a>
                      <div class="row"> <p class="fa fa-rmb pi-price col-lg-8 col-sm-8 text-left">{{productSeries.commonPrice}}</p></div>
                      <div class="row">
                          <p class="pi-description col-lg-12 col-sm-12 text-left">
                              <a ng-href="${path}/product_series/{{productSeries.id}}">{{productSeries.name}}</a>{{productSeries.description | cut:true:20:' ...'}}
                          </p>
                      </div>
                      <div class="row margin-bottom-20">
                                <span class="col-lg-6 col-sm-6 col-lg-push-6 col-sm-push-6">
                                    <a href="#product-pop-up" data-prod="{{productSeries.id}}" class="fa fa-shopping-cart btn btn-danger fancybox-fast-view" data-url="${path}/product_series/popover/{{productSeries.id}}">添加到购物车</a>
                                 </span>
                          <div class="sticker sticker-new" ng-show="productSeries.newProduct"></div>
                          <div class="sticker sticker-sale" ng-show="productSeries.evaluateCount>=1000"></div>
                      </div>
                  </div>
          </div>
          <div class="row" style="padding-bottom:20px;" id="infoPage">
              <tm-pagination conf="paginationConf"></tm-pagination>
          </div>


          <!-- END CONTENT -->
    <div id="product-pop-up" style="display: none;">
        <div class="product-page product-pop-up">
            <form name="popForm">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="product-main-image">
                            <img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive">
                        </div>
                        <div class="product-other-images">
                            <a href="javascript:void(0)" class="active"><img src="${path}/statics/assets/temp/products/model3.jpg"></a>
                            <a href="javascript:void(0)"><img src="${path}/statics/assets/temp/products/model4.jpg"></a>
                            <a href="javascript:void(0)"><img src="${path}/statics/assets/temp/products/model5.jpg"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <h1 style=" text-align:center;">帝王蟹</h1>
                        <div class="price-availability-block clearfix">
                            <div class="price">
                                <strong><span>$</span>47.00</strong>
                                <em>$<span>62.00</span></em>
                            </div>
                            <div class="availability">
                                库存: <strong>货源充足</strong>
                            </div>
                        </div>
                        <div class="description" style=" direction:ltr;">
                            <p></p>
                        </div>
                        <div class="product-page-options">

                        </div>
                        <div class="product-page-cart">
                            <div class="product-quantity">
                                <input id="product-quantity" type="text" value="1" name="product-quantity" class="form-control input-sm">
                            </div>
                            <button class="btn btn-primary add2cart" type="button">添加到购物车</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

