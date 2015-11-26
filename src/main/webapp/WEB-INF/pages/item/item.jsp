<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">物品详情</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <c:forEach var="productCategory" items="${f:getProductCategories()}">

                <li class="list-group-item clearfix dropdown
                <c:if test="${productSeries.productSubCategory.productCategory.id eq productCategory.id}"> active</c:if>
                        "><a href="javascript:void(0);" class="collapsed">
                    <i class="fa fa-angle-right"></i>
                    ${productCategory.categoryName}
                    <i class="fa fa-angle-down"></i>
                  </a>
                  <ul class="dropdown-menu" style="display:block;">
                    <c:forEach var="subCategory" items="${f:getProductSubCategoriesByCategoryId(productCategory.id)}">
                      <li <c:if test="${productSeries.productSubCategory.id eq subCategory.id}">class="list-group-item dropdown clearfix active"</c:if>>
                        <a href="${path}/sort/${subCategory.id}"><i class="fa fa-circle"></i>${subCategory.subCategoryName}</a>
                      </li>
                    </c:forEach>
                  </ul>
                </li>
              </c:forEach>
            </ul>
            <div class="sidebar-products clearfix">
              <h2>热销商品</h2>
              <c:forEach var="productSeries" items="${hotSells}">
                <div class="item">
                  <a href="${path}/product/${productSeries.id}"><img src="${path}/${productSeries.pictures[0]}"></a>
                  <h3><a href="${path}/product/${productSeries.id}">${productSeries.name}</a></h3>
                  <div class="price">$${productSeries.commonPrice}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img src="${path}/${productSeries.pictures[0]}" alt="${productSeries.name}" class="img-responsive" data-BigImgSrc="${path}/${productSeries.pictures[0]}">
                  </div>
                  <div class="product-other-images">
                    <c:forEach var="pic" items="${productSeries.pictures}" varStatus="varStatus">
                      <a href="#" <c:if test="${varStatus.index eq 0}">class="active"</c:if>><img class="product-image" src="${path}/${pic}"></a>
                    </c:forEach>
                  </div>
                </div>

                <div class="col-md-6 col-sm-6">
                  <form name="cartForm">
                    <input type="hidden" name="productSeriesId" value="${productSeries.id}">
                    <h1>${productSeries.name}</h1>
                    <div class="price-availability-block clearfix">
                      <div class="price">
                        <strong><span>￥</span>${productSeries.commonPrice}</strong>
                        <%--<em>￥<span>62.00</span></em>--%>
                      </div>
                      <div class="availability">
                        状态:<strong>
                        <c:choose>
                          <c:when test="${empty productSeries.productStore}">
                            无库存信息
                          </c:when>
                          <c:otherwise>
                            <c:choose>
                              <c:when test="${not empty productSeries.productStore.remain}">
                                剩余${productSeries.productStore.remain}件
                              </c:when>
                              <c:otherwise>
                                无法获取
                              </c:otherwise>
                            </c:choose>
                          </c:otherwise>
                        </c:choose>
                      </strong>
                      </div>
                    </div>
                    <div class="description">
                      <p>${productSeries.description}</p>
                    </div>
                    <div class="product-page-options">
                      <c:forEach var="productProperty" items="${f:getProductPropertiesById(productSeries.id)}">
                        <div class="pull-left">
                          <label class="control-label" style=" direction:ltr;">${productProperty.propertyName}&nbsp;:&nbsp;</label>
                          <select class="form-control input-sm" name="productPropertyId" data-product-property-id="${productProperty.id}">
                            <c:forEach var="propertyValue" items="${productProperty.propertyValues}" varStatus="varStatus">
                              <option value="${propertyValue.id}">${propertyValue.value}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </c:forEach>
                    </div>
                    <div class="product-page-cart">
                      <div class="product-quantity">
                        <input type="text" value="1" readonly class="form-control input-sm" id="product-quantity">
                      </div>
                      <button class="btn btn-primary add2cart" type="submit">添加到购物车</button>
                    </div>
                    <div class="review">
                      <input type="range" value="4" step="0.25" id="backing4">
                      <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                      </div>
                      <a href="#"><c:choose><c:when test="${empty productSeries.evaluateCount}">0</c:when><c:otherwise>${ productSeries.evaluateCount}</c:otherwise></c:choose>条评论</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">发表评论</a>
                    </div>
                    <ul class="social-icons">
                      <div class="bdsharebuttonbox">
                        <a href="#" class="bds_more" data-cmd="more"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                        <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                      </div>
                    </ul>
                  </form>
                </div>
                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Description" data-toggle="tab">商品介绍</a></li>
                    <li><a href="#Information" data-toggle="tab">规格参数</a></li>
                    <li><a href="#Reviews" data-toggle="tab">商品评论</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                      <p>由于不同地区自然条件和饮食习惯的不同，腌腊鱼的生产工艺也有所差异，其风味也就不同</p>
                      <div class="imgdisp">
                      <%--<img src="images/1.jpg">--%>
                      <%--<img src="images/2.jpg">--%>
                      <%--<img src="images/3.jpg">--%>
                      <%--<img src="images/4.jpg">--%>
                      <%--<img src="images/5.jpg">--%>
                      <%--<img src="images/6.jpg">--%>
                      <%--<img src="images/7.jpg">--%>
                      <%--<img src="images/8.jpg">--%>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="Information">
                      <table class="datasheet">
                        <tr>
                          <th colspan="2">规格参数</th>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">进口/国产：</td>
                          <td>国产</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">配送范围：</td>
                          <td>湖南/重庆/江西/湖北/广西/其它地区</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">净重(g)：</td>
                          <td>300</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">包装：</td>
                          <td>袋装</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">产品标准号：</td>
                          <td>DB43/344-2015</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">储藏方法：</td>
                          <td>放入冰箱冷冻</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">商品添加剂：</td>
                          <td>无</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">配料表：</td>
                          <td>鱼、调料</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">食品保质期：</td>
                          <td>180天</td>
                        </tr>
                      </table>
                    </div>
                    <div class="tab-pane fade" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>马云</strong>
                          <em>2015/06/20 - 07:37</em>
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>商品评价是指生产厂家、商家或者消费者根据具体商品的性能、规格、材质、使用寿命、外观等商品的内在价值设定一个可量化或定性的评价体系，由消费者对商品使用价值进行评价的过程。</p>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">

        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>


    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->

