<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">搜索结果页</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h1>搜索结果页</h1>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <form action="${path}/index/product/search" method="post">
                            <div class="input-group">
                                <input type="text" placeholder="重新搜索" class="form-control" name="keyWord"
                                       value="${keyWord}">
                      <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">搜索</button>
                      </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row list-view-sorting clearfix">
                <div class="col-md-10 col-sm-10" style=" width:100%;">
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后恢复默认排序">综合排序&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后按照价格从高到低排序">价格排序&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后按照销量从多到少排序">销量排序&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后按照评论从多到少排序">评论排序&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后按照人气从高到低排序">热卖商品&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label"><a href="#" title="点击后按照人气从高到低排序">新品上市&nbsp;&nbsp;<i--%>
                                <%--class="fa fa-chevron-down"></i></a></label>--%>
                    <%--</div>--%>

                </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
                <!-- PRODUCT ITEM START -->
                <c:choose>
                    <c:when test="${empty _page.content}">
                        对不起，没有找到合适的记录!
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="productSeries" items="${_page.content}">
                            <div class="col-md-12 col-sm-0 col-xs-12">
                                <div class="product-item">
                                    <a href="${path}/product/${productSeries.id}"><img src="${path}/${productSeries.pictures[0]}" class="pull-left resule-thumb"
                                         alt="${productSeries.name}"></a>

                                    <div class="introduce">
                                        <h3><a href="${path}/product/${productSeries.id}" class="high-lighter">${productSeries.name}</a></h3>

                                        <p class="ware-desc pull-left high-lighter">${productSeries.description}</p>
                                    </div>
                                    <div class="price-avail pull-right">
                                        <div class="form-groupx">
                                            <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true"
                                                 data-rateit-readonly="true"></div>
                                        </div>
                                        <p class="discuss">评论数&nbsp;:&nbsp;<a>${productSeries.evaluateCount}</a></p>

                                        <p class="price">￥${productSeries.commonPrice}</p>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view"
                                           data-prod="${productSeries.id}">添加到购物车</a>
                                    </div>
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
                <div class="col-md-12 col-sm-12">
                    <ul class="pagination pull-right">
                        <c:set var="maxShowPage" value="3"/>
                        <c:set var="totalPages" value="${_page.totalPages}"/>
                        <c:if test="${page gt 1}">
                            <li>
                                <a href="javascript:void(0)" class="prev-pages">&laquo;
                                    <form action="${path}/index/product/search" method="post">
                                        <input type="hidden" name="keyWord" value="${keyWord}">
                                        <input type="hidden" name="page" value="${page-1}">
                                    </form>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="${page}" end="${page+maxShowPage}" varStatus="varStatus">
                            <c:choose>
                                <c:when test="${varStatus.index eq page}">
                                    <li class="now-page" pageIndex="${varStatus.index}">
                                        <span>${varStatus.index}</span></li>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${varStatus.index le totalPages}">
                                        <li class="li-form" pageIndex="${varStatus.index}">
                                            <a href="javascript:void(0) ">${varStatus.index}</a>

                                            <form action="${path}/index/product/search" method="post">
                                                <input type="hidden" name="keyWord" value="${keyWord}">
                                                <input type="hidden" name="page" value="${varStatus.index}">
                                            </form>
                                        </li>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                        <c:if test="${page+maxShowPage lt totalPages}">
                            <li>
                                <a href="javascript:void(0)" class="next-pages">&raquo;
                                    <form action="${path}/index/product/search" method="post">
                                        <input type="hidden" name="keyWord" value="${keyWord}">
                                        <input type="hidden" name="page" value="${page+1}">
                                    </form>
                                </a>

                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- END PAGINATOR -->
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN SIDEBAR -->
        <div class="sidebar col-md-3 col-sm-5">
            <div class="sidebar-products clearfix">
                <h2>为您推荐</h2>


                <c:forEach items="${recommendList}" var="productSeries">
                    <div class="item">
                        <a href="item.html"><img src="${path}/statics/assets/temp/products/k1.jpg" alt="腊肉"></a>
                        <h3><a href="item.html">腊肉的防腐能力强，能延长保存时间</a></h3>
                        <div class="price">$31.00</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
</div>
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <form name="popForm">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
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
                <div class="col-md-6 col-sm-6 col-xs-9">
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



