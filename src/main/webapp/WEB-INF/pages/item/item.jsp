<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

    <div class="main" ng-app="productSeriesApp">
      <div class="container" ng-controller="productSeriesCtrl">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">物品详情</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <aside class="sidebar">
              <nav class="sidebar-nav">
                <ul class="metismenu" id="menu">
                  <c:forEach var="productCategory" items="${f:getProductCategories()}">

                    <li class="active" ng-show="data.productSeries.productSubCategory.productCategory.id=='${productCategory.id}'">
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
                                  ${subCategory.subCategoryName}<span ng-if="data.productSeries.productSubCategory.id =='${subCategory.id}'" class="sidebar-nav-item-icon fa fa-flag-o pull-right"></span >
                              </a>
                            </li>
                          </c:forEach>
                        </ul>
                  </li>
                  <li ng-show="data.productSeries.productSubCategory.productCategory.id!='${productCategory.id}'">
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
                                ${subCategory.subCategoryName}<span ng-if="data.productSeries.productSubCategory.id =='${subCategory.id}'" class="sidebar-nav-item-icon fa fa-flag-o pull-right"></span >
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
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img data-tag="pic1" ng-src="${path}/{{data.productSeries.pictures[0]}}" alt="{{data.productSeries.name}}" class="img-responsive" data-BigImgSrc="${path}/{{data.productSeries.pictures[0]}}">
                  </div>
                  <div class="product-other-images" >
                      <a ng-repeat="pic in data.productSeries.pictures" href="#"><img class="product-image" ng-src="${path}/{{pic}}"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <form name="cartForm">
                    <input type="hidden" name="productSeriesId" value="{{data.productSeries.id}}">
                    <h1>{{data.productSeries.name}}</h1>
                    <div class="price-availability-block clearfix">
                      <div class="price">
                        <strong><span class="fa fa-rmb fa-5x"></span>{{data.productSeries.commonPrice}}</strong>
                        <%--<em><span class="fa fa-rmb fa-5x">62.00</span></em>--%>
                      </div>
                      <div class="availability">
                        状态:
                        <strong ng-if="!data.productSeries.productStore">无库存信息</strong>
                        <strong ng-if="data.productSeries.productStore &&!data.productSeries.productStore.remain">剩余{{data.productSeries.productStore.remain}件</strong>
                        <strong ng-if="data.productSeries.productStore &&data.productSeries.productStore.remain"> 无法获取</strong>

                      </strong>
                      </div>
                    </div>
                    <div class="description">
                      <p>{{data.productSeries.description}}</p>
                    </div>
                    <div class="product-page-options">
                        <div class="pull-left" ng-repeat="productProperty in data.productSeries.productProperties">
                          <label class="control-label" style=" direction:ltr;">{{productProperty.propertyName}}&nbsp;:&nbsp;</label>
                          <select class="form-control input-sm" name="productPropertyId" data-product-property-id="{{productProperty.id}}" >
                              <option value="{{propertyValue.id}}" ng-repeat="propertyValue in productProperty.propertyValues">{{propertyValue.value}}</option>
                          </select>
                        </div>
                    </div>
                    <div class="product-page-cart">
                      <div class="product-quantity">
                        <input type="text" value="1" readonly class="form-control input-sm" id="product-quantity">
                      </div>
                      <button class="btn btn-primary add2cart fa fa-shopping-cart fa-lg" type="button">添加到购物车</button>
                    </div>
                    <div class="review">
                      <%--<input type="range" name="productSeriesEvaluateGrade" ng-model="productSeriesEvaluateGrade" step="0.5" id="backing4" disabled/>--%>
                      <%--<div class="rateit"  data-rateit-resetable="false"  data-rateit-ispreset="false" data-rateit-min="0" data-rateit-max="5" data-rateit-value="{{data.productSeries.productSeriesEvaluateGrade}}">--%>
                        <input id="input-21d" value="{{data.productSeries.productSeriesEvaluateGrade}}" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm">
                    </div>
                      <%--<c:choose><c:when test="${empty page.totalElements}">0</c:when><c:otherwise>${ productSeries.evaluateCount}</c:otherwise></c:choose>条评论--%>
                      {{data._page.totalElements}}条评论
                      <%--<c:if test="${not empty requestScope.order}">--%>
                        &nbsp;&nbsp;|&nbsp;&nbsp;<a ng-if="data.order" href="javascript:void(0)" class="tour-step1" data-toggle="modal" data-target="#evaluateModal">发表评论</a>
                      <%--</c:if>--%>
                    </div>
                    <ul class="social-icons">
                        <div class="bdsharebuttonbox">
                          <a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone"></a><a href="#" class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq" data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a href="#" class="bds_weixin" data-cmd="weixin"></a></div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"这里的东西太好吃了,都是生态环保的湖南宁乡土特产,你也来看看吧！","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16","tag":"pic1"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                    </ul>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
          <div class="product-page-content">
            <ul id="myTab" class="nav nav-tabs">
              <li <c:if test="${!activeEvaluate}">class="active"</c:if>><a href="#Description" data-toggle="tab">商品介绍</a></li>
              <li><a href="#Information" data-toggle="tab">规格参数</a></li>

              <li class="tour-step2<c:if test="${activeEvaluate}"> active</c:if>"><a href="#Reviews" data-toggle="tab">商品评论(${_page.totalElements})</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade<c:if test="${!activeEvaluate}"> in active</c:if>" id="Description">
                    <c:choose>
                      <c:when test="${empty productSeries.productBrochures}">
                        <tr>
                          <td class="datasheet-features-type" colspan="2">抱歉，暂无商品介绍宣传册。</td>
                        </tr>
                      </c:when>
                      <c:otherwise>
                        <c:choose>
                          <c:when test="${productSeries.productBrochures eq 'img'}">
                              <img src="${path}/${productSeries.productBrochures.url}"/>
                          </c:when>
                          <c:when test="${productSeries.productBrochures eq 'page'}">
                              <iframe src="${productSeries.productBrochures.url}"  scroling="no"  width="100%" height="2600px;" name="float" frameborder="0"></iframe>
                          </c:when>
                          <c:otherwise></c:otherwise>
                        </c:choose>
                      </c:otherwise>
                    </c:choose>
                </div>
              <div class="tab-pane fade" id="Information">
                <table class="datasheet">
                  <tr>
                    <th colspan="2">规格参数</th>
                  </tr>
                  <c:choose>
                    <c:when test="${empty productSeries.instructionManual}">
                      <tr>
                        <td class="datasheet-features-type" colspan="2">抱歉，暂无规格参数说明。</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${productSeries.instructionManual}" var="instructionManualItem">
                        <tr>
                          <td class="datasheet-features-type">${instructionManualItem.key}：</td>
                          <td>${instructionManualItem.value}</td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </table>
              </div>
              <div class="tab-pane fade<c:if test="${activeEvaluate}"> in active</c:if>" id="Reviews">
                <!--<p>There are no reviews for this product.</p>-->

                <c:forEach var="productEvaluate" items="${_page.content}" varStatus="varStatus">
                  <div style="margin-bottom:10px;" class="container table-bordered<c:if test="${varStatus.index mod 2 eq 1}"> bg-info</c:if>" ng-init="showEvaluate${productEvaluate.id}=false">
                      <div class="row">
                          <div class="col-sm-2 col-lg-2">
                            <strong class="fa fa-user">
                              <c:choose>
                                <c:when test="${productEvaluate.anonymous}">匿名用户</c:when>
                                <c:otherwise>${productEvaluate.order.user.name}</c:otherwise>
                              </c:choose>
                            </strong>
                          </div>
                          <div class="col-sm-1 col-lg-1">
                              <em><fmt:formatDate value="${productEvaluate.date}" type="both" dateStyle="default"/></em>
                          </div>
                          <div class="col-sm-2 col-lg-2 pull-right">
                              <div class="rateit" data-rateit-value="${productEvaluate.grade}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                          </div>
                      </div>
                      <div class="row review-item-content">
                        <div class="col-lg-2 col-sm-2">
                          <div class="review-item-image">
                            <img ng-src="${path}/${productEvaluate.pictures[0]}"/>
                          </div>
                        </div>
                        <div class="col-lg-8 col-sm-8">
                          <pre class="fa fa-file-text-o">${productEvaluate.content}</pre>
                        </div>

                      </div>
                      <div class="row">
                        <div class="col-sm-2 col-lg-2 pull-right">
                          <a class="fa fa-pencil-square-o" href="javascript:void(0)" data-ng-click="showEvaluate${productEvaluate.id}=!showEvaluate${productEvaluate.id};replies('${productEvaluate.id}')">回复(0)</a>&nbsp;
                          <a class="fa fa-thumbs-o-up" href="javascript:void(0)">赞(0)</a>
                        </div>
                      </div>
                      <div class="row" ng-show="showEvaluate${productEvaluate.id}">
                        <div class="col-sm-1 col-lg-1"></div>
                        <form action="/product_series/evaluate/reply" method="post" name="reply${productEvaluate.id}Form">
                          <div class="col-sm-10 col-lg-10"style="margin-bottom: 8px;">
                            <textarea ng-model="content" name="content" placeholder="发表评论" rows="1" style="width: 100%;" class="form-control" required="true"></textarea>
                          </div>
                          <div class="col-sm-1 col-lg-1">
                            <input type="button" ng-disabled="reply${productEvaluate.id}Form.$invalid" value="回复" class="btn btn-small"/>
                          </div>
                        </form>
                      </div>

                      <div class="row" ng-show="showEvaluate${productEvaluate.id}" ng-repeat="evaluateReply in evaluateReplies">
                              <div class="col-sm-1 col-lg-1 text-right"><i class="fa fa-user"></i><strong>{{evaluateReply.replyUser.name}}</strong></div>
                              <div class="col-sm-10 col-lg-10">
                                <pre>{{evaluateReply.content}}</pre>
                              </div>
                      </div>


                  </div>
                </c:forEach>
                <div class="row" style="padding-bottom:20px;">
                  <div id="infoPage"></div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>
<div class="modal fade" id="evaluateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <form name="evaluateForm" id="evaluateForm" action="${path}/order/evaluate/product" novalidate="novalidate" method="POST" enctype="multipart/form-data">

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h2 class="modal-title">评论</h2>
      </div>
      <div class="modal-body">
          <fieldset>
            <div class="form-group has-feedback">
              <div class="row">
                <label class="col-lg-2 control-label">满意度<span class="require">*</span></label>

                <div class="col-lg-8 has-success">
                  <input type="range" value="3" step="1" id="backing0" name="grade"/>
                  <div class="rateit" data-rateit-backingfld="#backing0" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label class="col-lg-2 control-label">评价内容 <span class="require">*</span></label>
                <div class="col-lg-8 has-success">
                  <textarea name="content" class="form-control text-area" rows="6"  placeholder="请发表您的评价" required="true"></textarea>
                </div>
              </div>
              </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label  class="col-lg-2 control-label">上传图片</label>
                <div class="col-lg-8 has-success">
                  <input name="files" id="file-5" class="file"  data-preview-class="bg-info" type="file"
                         data-max-file-size="100"  data-max-file-count="3"
                         multiple data-preview-file-type="any" data-show-upload="false">
                  <input type="hidden" value="${order.id}" name="orderId"/>
                  <input type="hidden" value="${productSeries.id}" name="productSeriesId "/>
                </div>
              </div>
            </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label  class="col-lg-2 control-label">匿名评论</label>
                <div class="col-lg-8 col-sm-8 form-inline">
                  <input type="checkbox" name="anonymous" value="true" />
                </div>
              </div>
            </div>
          </fieldset>
      </div>
      <div class="modal-footer">
        <div class="col-lg-6 col-sm-6"></div>
        <div class="col-lg-4 col-sm-4">
          <button type="submit" class="btn btn-primary" >提交</button>
          <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true">关闭</button>
        </div>
      </div>
    </div>
  </div>
  </form>

</div>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
