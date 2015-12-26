<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">搜索结果页</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-12">
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-3 col-sm-3 text-right">
                        <h1>搜索到以下商品</h1>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <form action="${path}/index/product/search" method="post">
                            <div class="input-group">
                                <input type="text" placeholder="重新搜索" class="form-control" name="keyWord" required="true" value="${keyWord}">
                      <span class="input-group-btn">
                        <button class="btn btn-primary pull-left" type="submit">搜索</button>
                      </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- BEGIN PRODUCT LIST -->
            <div class="product-list">
                <!-- PRODUCT ITEM START -->
                <c:choose>
                    <c:when test="${empty _page.content}">
                    <div class="row text-danger high-lighter text-center" style="margin-top: 20px;margin-bottom: 10px;">
                        <h6>对不起，没有找到关于"${keyWord}"的记录!</h6>
                    </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="productSeries" items="${_page.content}" varStatus="varStatus">
                            <c:choose>
                                <c:when test="${varStatus.index mod 2 eq 0}">
                                    <div class="row text-center" style="margin-top: 5px;margin-bottom: 5px;">
                                 </c:when>
                                <c:otherwise>
                                    <div class="row text-center bg-info" style="margin-top: 5px;margin-bottom: 5px;">
                                </c:otherwise>
                            </c:choose>

                                <div class="col-lg-1 col-sm-1">
                                    <a href="${path}/product_series/${productSeries.id}">
                                        <img src="${path}/${productSeries.pictures[0].picture}" class="pull-left resule-thumb" alt="${productSeries.name}">
                                    </a>
                                </div>

                                <div class="col-lg-3 col-sm-3 pull-left">
                                    <div>
                                    <a href="${path}/product_series/${productSeries.id}" class="high-lighter">${productSeries.name}</a>
                                </div>
                                </div>
                                <div class="col-lg-2 col-sm-2 ">
                                    <p class="fa">${productSeries.productSubCategory.subCategoryName}</p>
                                </div>
                                <div class="col-lg-4 col-sm-4 ">
                                    <p class="fa fa-file-text-o high-lighter pull-left">${productSeries.description}</p>
                                </div>
                                <div class="col-lg-2 col-sm-2">
                                    <ul class="list-group">
                                        <c:choose>
                                            <c:when test="${varStatus.index mod 2 eq 0}">

                                                <li class="list-group-item fa fa-inbox ">库存:<a><c:choose><c:when test="${empty productSeries.productStore}">0</c:when><c:otherwise>${productSeries.productStore.remain}</c:otherwise></c:choose></a></li>
                                                <li class="list-group-item fa fa-pencil">评论数:<a>${productSeries.evaluateCount}</a></li>
                                                <li class="list-group-item fa fa-rmb">价格:<a>${productSeries.commonPrice}</a></li>
                                                <li class="list-group-item btn btn-primary fa fa-shopping-cart fancybox-fast-view" data-prod="${productSeries.id}"></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="list-group-item list-group-item-info fa fa-inbox ">库存:<a><c:choose><c:when test="${empty productSeries.productStore}">0</c:when><c:otherwise>${productSeries.productStore.remain}</c:otherwise></c:choose></a></li>
                                                <li class="list-group-item list-group-item-info fa fa-pencil">评论数:<a>${productSeries.evaluateCount}</a></li>
                                                <li class="list-group-item list-group-item-info fa fa-rmb">价格:<a>${productSeries.commonPrice}</a></li>
                                                <li class="list-group-item list-group-item-info btn btn-primary fa fa-shopping-cart fancybox-fast-view" data-prod="${productSeries.id}"></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                            </div>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>


                <!-- PRODUCT ITEM END -->
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row" style=" padding-bottom:20px;">
                <div id="infoPage"></div>
            </div>
            <!-- END PAGINATOR -->
        </div>
        <!-- END CONTENT -->

    </div>
    <!-- END SIDEBAR & CONTENT -->

</div>
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <form name="popForm">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-sm-3">
                    <div class="product-main-image">
                        <img src="${path}/statics/assets/temp/products/model7.jpg" alt="Cool green dress with red bell"
                             class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="#" class="active"><img alt="Berry Lace Dress"
                                                        src="${path}/statics/assets/temp/products/model3.jpg"></a>
                        <a href="#"><img alt="Berry Lace Dress"
                                         src="${path}/statics/assets/temp/products/model4.jpg"></a>
                        <a href="#"><img alt="Berry Lace Dress"
                                         src="${path}/statics/assets/temp/products/model5.jpg"></a>
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
                            状态: <strong>货源充足</strong>
                        </div>
                    </div>
                    <div class="description" style=" direction:ltr;">
                        <p></p>
                    </div>
                    <div class="product-page-options">

                    </div>
                    <div class="product-page-cart">
                        <div class="product-quantity">
                            <input id="product-quantity" type="text" value="1" name="product-quantity"
                                   class="form-control input-sm">
                        </div>
                        <button class="btn btn-primary pop add2cart" type="button">添加到购物车</button>
                        <button class="btn btn-default" type="submit">更多商品</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>



