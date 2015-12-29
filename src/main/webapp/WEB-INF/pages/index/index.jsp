<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- END SLIDER -->
<div ng-controller="indexController">
    <div class="page-slider margin-bottom-35">
        <!--LayerSlider begin-->
        <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">
            <!--LayerSlider layer-->
            <div class="ls-layer ls-layer2" style="slidedirection: right; transition2d: 110,111,112,113; ">
                <img src="${path}/${top3[0][1]}" class="ls-bg" alt="Slide background">
                <div class="ls-s-1 ls-title title" style=" top: 40%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                    <strong class="title">${top3[0][2]}</strong>
                    ${top3[0][3]}
                    <em class="title">${top3[0][4]}</em>
                </div>

                <div class="ls-s-2 ls-price title" style=" top: 50%; left: 45%; slidedirection : fade; slideoutdirection : fade; durationout : 109750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                    <b>${top3[0][5]}</b>
                    <strong><span>￥</span>${top3[0][6]}</strong>
                </div>

                <a href="javascript:void(0)" data-href="${path}/product_series/${top3[0][0]}" class="ls-s-1 ls-more mini-text add2cart" style=" top: 72%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; display: inline-block; white-space: nowrap;">
                    添加到购物车
                </a>
            </div>
            <div class="ls-layer ls-layer5" style="slidedirection: right; transition2d: 110,111,112,113; ">
                <img src="${path}/${top3[1][1]}" class="ls-bg" alt="Slide background">

                <div class="ls-s-1 title" style=" top: 35%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                    ${top3[1][2]}
                </div>

                <div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                    <span>${top3[1][3]}</span>
                    <a href="javascript:void(0)" data-href="${path}/product_series/${top3[1][0]}" class="add2cart">添加到购物车</a>
                </div>
            </div>
            <!--LayerSlider layer-->
            <div class="ls-layer ls-layer3" style="slidedirection: right; transition2d: 92,93,105; ">
                <img src="${path}/${top3[2][1]}" class="ls-bg" alt="Slide background">

                <div class="ls-s-1 ls-title" style=" top: 83px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                    ${top3[2][2]}
                    <strong>${top3[2][3]}</strong>
                    ${top3[2][4]}
                </div>

                <div class="ls-s-1" style=" top: 333px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;">
                    <a href="javascript:void(0)" data-href="${path}/product_series/${top3[2][0]}" class="ls-buy add2cart">
                        添加到购物车
                    </a>
                    <div class="ls-price">
                        <span>${top3[2][5]}</span>
                        <strong><sup>￥</sup>${top3[2][6]}</strong>
                    </div>
                </div>
            </div>

            <!--LayerSlider layer-->

        </div>
        <!--LayerSlider end-->
    </div>
    <div class="bg-light-primary">
        <div class="container main">
            <div class="row margin-bottom-40">
                <div class="row">
                    <h2 class="col-lg-10 col-sm-10">新品上市</h2>
                    <p class="col-lg-10 col-sm-10">国家专利制作工艺,为您打造健康美味的生态食品</p>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${empty newProducts}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                        <c:otherwise>
                            <c:forEach items="${newProducts}" var="productSeries" varStatus="pdVarStatus">
                                <div class="col-lg-3 col-sm-3 padding-left-5 padding-right-0 margin-top-20 height-290">
                                <c:choose>
                                    <c:when test="${empty productSeries.pictures}">
                                        <img src="${path}/statics/img/img_not_found.jpg" class="img-responsive img-thumbnail" >
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="interval" value="${2000+(pdVarStatus.index*50)}"/>
                                        <div class="carousel slide" id="${productSeries.id}" data-ride="carousel"data-interval="${interval}">
                                                <ol class="carousel-indicators">
                                                    <c:forEach var="picture" items="${productSeries.pictures}" varStatus="varStatus">
                                                        <c:set var="active" value="${varStatus.index eq 0?'class=\"active\"':''}"/>
                                                            <li data-target="#${productSeries.id}" data-slide-to="${varStatus.index}" ${active}></li>
                                                    </c:forEach>
                                                </ol>
                                                <div class="carousel-inner">
                                                    <c:forEach var="picture" items="${productSeries.pictures}" varStatus="varStatus">
                                                        <c:set var="active" value="${varStatus.index eq 0?'active':''}"/>
                                                        <div class="item ${active}"><a href="${path}/product_series/${productSeries.id}">
                                                            <img src="${path}/${picture.picture}" class="img-responsive img-thumbnail"></a>
                                                        </div>
                                                    </c:forEach>

                                                </div>
                                                <%--<a class="carousel-control left" href="#${productSeries.id}" data-slide="prev">&lsaquo;</a>--%>
                                                <%--<a class="carousel-control right" href="#${productSeries.id}"data-slide="next">&rsaquo;</a>--%>
                                        </div>
                                        <c:if test="${productSeries.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                    </c:otherwise>
                                </c:choose>
                                <div class="bg-info">
                                    <div class="row margin-left-2 padding-top-10 padding-bottom-10">
                                        <a href="${path}/product_series/${productSeries.id}" class="fa fa-2x">${productSeries.name}</a>
                                        <i class="fa fa-rmb pi-price fa-2x">${productSeries.commonPrice}</i>

                                    </div>
                                    <div class="row margin-left-2 padding-bottom-10 padding-right-0">
                                        <div class="col-lg-12 col-sm-12 margin-left--10">
                                            <div class="btn-group btn-group-xs pull-right">
                                                <c:set var="interested" value="false" />
                                                <c:choose>

                                                    <c:when test="${not empty interests}">

                                                        <c:forEach var="interest" items="${interests}">
                                                            <c:if test="${interest.productSeries.id eq productSeries.id}">
                                                                <c:set var="interested" value="true"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        ${interest}
                                                        <c:if test="${interested eq 'true'}">
                                                            <btn class="btn btn-danger" ng-click="toggleInterest('${productSeries.id}')">已关注<i class="fa fa-heart-o"></i></btn>
                                                        </c:if>
                                                        <c:if test="${interested eq 'false'}">
                                                            <btn class="btn btn-danger" ng-click="toggleInterest('${productSeries.id}')">关注<i class="fa fa-heart-o"></i></btn>
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${interest}--
                                                        <btn class="btn btn-danger" ng-click="toggleInterest('${productSeries.id}')">关注<i class="fa fa-heart-o"></i></btn>
                                                    </c:otherwise>
                                                </c:choose>

                                                <button class="fa fa-shopping-cart btn btn-danger" data-ng-click="popover('${productSeries.id}');">添加到购物车</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row margin-left-10 margin-right-5 text-left padding-bottom-10">
                                        <div class="col-lg-12 col-sm-12"><em>
                                            <c:choose>
                                                <c:when test="${fn:length(productSeries.description) > 30}">${fn:substring(productSeries.description, 0, 30)}...</c:when>
                                                <c:otherwise>${productSeries.description}</c:otherwise>
                                            </c:choose>
                                        </em></div>
                                    </div>
                                </div>
                                </div>

                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row margin-bottom-40">
                <div class="row">
                    <h2 class="col-lg-10 col-sm-10">热卖商品</h2>
                    <p class="col-lg-10 col-sm-10">独一无二的制作工艺，让我们的产品成为您的首选</p>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${empty hotSells}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                        <c:otherwise>
                            <c:forEach items="${hotSells}" var="productSeries">
                                <div class="col-lg-3 col-sm-3 padding-left-5 padding-right-0 margin-top-20 height-290">
                                    <div class="thumbnail">
                                        <a href="${path}/product_series/${productSeries.id}">
                                            <c:choose>
                                                <c:when test="${empty productSeries.pictures}">

                                                    <img src="${path}/statics/img/img_not_found.jpg" class="img-responsive img-thumbnail" >
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${path}/${productSeries.pictures[0].picture}" class="img-responsive img-thumbnail height-265" >
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <c:if test="${productSeries.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                        <div class="row margin-left-0">
                                            <a href="${path}/product_series/${productSeries.id}" class="pull-left">${productSeries.name}</a>
                                            <i class="fa fa-rmb pi-price"></i>${productSeries.commonPrice}&nbsp;&nbsp;


                                        </div>
                                        <div class="row margin-left-0">
                                            <a href="javascript:void(0)" class="fa fa-shopping-cart btn btn-danger btn-xs pull-right margin-right-20"
                                               data-ng-click="popover('${productSeries.id}');">添加到购物车</a>
                                        </div>
                                        <div class="row  margin-left-0 margin-right-0 text-left bg-info height-50">
                                            <em>
                                                <c:choose>
                                                    <c:when test="${fn:length(productSeries.description) > 30}">${fn:substring(productSeries.description, 0, 30)}...</c:when>
                                                    <c:otherwise>${productSeries.description}</c:otherwise>
                                                </c:choose>
                                            </em>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <%--<div class="row pull-right"><input type="button" value="更多热卖商品" class="btn btn-primary fa fa-search"/></div>--%>
            </div>

            <div class="row margin-bottom-40">
                <div class="row">
                    <h2 class="col-lg-10 col-sm-10">特价优惠</h2>
                    <p class="col-lg-10 col-sm-10">活动期间享受优惠，实惠多多！</p>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${empty lowPrices}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                        <c:otherwise>
                            <c:forEach items="${lowPrices}" var="productSeries">
                                <div class="col-lg-3 col-sm-3 padding-left-5 padding-right-0 margin-top-20 height-290">
                                    <div class="thumbnail">
                                        <a href="${path}/product_series/${productSeries.id}">
                                            <c:choose>
                                                <c:when test="${empty productSeries.pictures}">

                                                    <img src="${path}/statics/img/img_not_found.jpg" class="img-responsive img-thumbnail" >
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${path}/${productSeries.pictures[0].picture}" class="img-responsive img-thumbnail height-265" >
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <c:if test="${productSeries.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                        <div class="row margin-left-0">
                                            <a href="${path}/product_series/${productSeries.id}" class="pull-left">${productSeries.name}</a>
                                            <i class="fa fa-rmb pi-price"></i>${productSeries.commonPrice}&nbsp;&nbsp;
                                            <a href="javascript:void(0)"
                                               class="fa fa-shopping-cart btn btn-danger btn-xs pull-right margin-right-20" data-ng-click="popover('${productSeries.id}');">添加到购物车</a>

                                        </div>
                                        <div class="row  margin-left-0 margin-right-0 text-left bg-info height-50">
                                            <em>
                                                <c:choose>
                                                    <c:when test="${fn:length(productSeries.description) > 30}">${fn:substring(productSeries.description, 0, 30)}...</c:when>
                                                    <c:otherwise>${productSeries.description}</c:otherwise>
                                                </c:choose>
                                            </em>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <%--<div class="row pull-right"><input type="button" value="更多特价商品" class="btn btn-primary fa fa-search"/></div>--%>
            </div>


        </div>
    </div>

</div>
