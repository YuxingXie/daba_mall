<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row">
          <ul class="breadcrumb col-md-3 col-sm-5">
            <li><a href="${path}">首页</a></li>
            <li>${productSubCategory.productCategory.categoryName}</li>
            <li class="active">${productSubCategory.subCategoryName}</li>
          </ul>

        </div>

          <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->

          <!-- END SIDEBAR -->
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
                      <div class="pull-left">
                          <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">热卖商品&nbsp;&nbsp;<i
                                  class="fa fa-chevron-down"></i></a></label>
                      </div>
                      <div class="pull-left">
                          <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">新品上市&nbsp;&nbsp;<i
                                  class="fa fa-chevron-down"></i></a></label>
                      </div>

                  </div>
              </div>
                  <div class="row">
                      <div class="col-lg-11">
                          <c:set var="numberPerLine" value="4"/>
                          <c:set var="maxNumber" value="${fn:length(productSubCategory.productSeriesList)}"/>
                          <c:set var="totalLine" value="${maxNumber/numberPerLine}"/>
                          <%--${maxNumber}个数,每行${numberPerLine}个,共${totalLine}行<br/>--%>
                          <c:forEach items="${productSubCategory.productSeriesList}" varStatus="i"  var="productSeries">
                          <c:if test="${i.index mod numberPerLine eq 0}">
                              <%--begin:--%>
                          <div class="row">
                              </c:if>
                                  <%--${i}--%>
                              <div class="col-sm-3 col-lg-3">
                                  <div class="product-item">
                                      <div class="pi-img-wrapper">
                                          <img class="img-responsive" src="${path}/${productSeries.pictures[0]}"/>
                                          <div>
                                                  <a href="${path}/${productSeries.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                              <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-prod="${productSeries.id}"  data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                          </div>
                                      </div>
                                      <h3><a href="${path}/product_series/${productSeries.id}">${productSeries.name}</a></h3>
                                      <div class="pi-price">￥${productSeries.commonPrice}</div>
                                      <a href="javascript:void(0)" data-href="${path}/cart/${productSeries.id}" class="btn btn-default add2cart">添加到购物车</a>
                                          <%--新品--%>
                                          <%--<div class="sticker sticker-new"></div>--%>
                                      <c:if test="${productSeries.evaluateCount ge 1000}"><div class="sticker sticker-sale"></div></c:if>
                                  </div>
                              </div>
                              <c:choose>
                              <c:when test="${(i.index+1)/numberPerLine eq totalLine}">
                                  <%--最后一行--%>
                              <c:if test="${(i.index+1) eq maxNumber}">
                          </div>
                              <%--结尾--%>
                          </c:if>
                          </c:when>
                          <c:otherwise>
                          <c:if test="${(i.index+1) mod numberPerLine eq 0}">
                              <%--第${(i+1)/numberPerLine}行结尾<br/>--%>
                      </div>
                      </c:if>
                      </c:otherwise>
                      </c:choose>
                      </c:forEach>
                  </div>
              </div>


          </div>


          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
