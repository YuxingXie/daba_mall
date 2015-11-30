<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          <form action="${path}/index/product/search" method="post" class="form-inline breadcrumb col-md-4 col-sm-6"autocomplete="off">
            <div class="input-group">
              <input type="text" placeholder="搜索产品" class="form-control" name="keyWord"
                     value="${keyWord}">
                        <span class="input-group-btn">
                          <button class="btn btn-primary" type="submit">搜索</button>
                        </span>
            </div>
          </form>
        </div>
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <aside class="sidebar">
              <nav class="sidebar-nav">
                <ul class="metismenu" id="menu">
                  <c:forEach var="productCategory" items="${f:getProductCategories()}">
                    <c:if test="${productSubCategory.productCategory.id eq productCategory.id}"><li class="active"></c:if>
                    <c:if test="${productSubCategory.productCategory.id ne productCategory.id}"><li></c:if>
                        <a href="#" aria-expanded="true">
                          <span class="sidebar-nav-item-icon fa fa-inbox fa-lg"></span>
                          <span class="sidebar-nav-item">${productCategory.categoryName}</span>
                          <span class="fa arrow"></span>
                        </a>
                        <ul aria-expanded="true">
                          <c:forEach var="subCategory" items="${f:getProductSubCategoriesByCategoryId(productCategory.id)}">
                              <li class="col-lg-offset-1 col-sm-offset-1">
                                <a href="${path}/product_series/sort/${subCategory.id}">
                                  <span class="sidebar-nav-item-icon fa  fa-long-arrow-right"></span>
                                    ${subCategory.subCategoryName}
                                  <c:if test="${productSubCategory.id eq subCategory.id}"><span class="sidebar-nav-item-icon fa   fa-flag-o pull-right"></span></c:if>
                                </a>
                              </li>
                          </c:forEach>
                        </ul>
                      </li>
                  </c:forEach>
                </ul>
                </nav>
            </aside>
          </div>
          <!-- END SIDEBAR -->
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
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
              <div class="row"><p class="demo demo4_top pull-right"></p></div>
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
