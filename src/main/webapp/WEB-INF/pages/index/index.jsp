<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->

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

            <a href="javascript:void(0)" data-href="${path}/product/${top3[0][0]}" class="ls-s-1 ls-more mini-text add2cart" style=" top: 72%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; display: inline-block; white-space: nowrap;">
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
                <a href="javascript:void(0)" data-href="${path}/product/${top3[1][0]}" class="add2cart">添加到购物车</a>
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
                <a href="javascript:void(0)" data-href="${path}/product/${top3[2][0]}" class="ls-buy add2cart">
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
<!-- END SLIDER -->

<div class="container main">

        <div class="row margin-bottom-40 bg-primary">
            <div class="row">
                <h2 class="col-lg-10 col-sm-10">新品上市</h2>
                <p class="col-lg-10 col-sm-10">国家专利制作工艺,为您打造健康美味的生态食品</p>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${empty newProducts}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                    <c:otherwise>
                        <c:forEach items="${newProducts}" var="prod">
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
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row pull-right"><input type="button" value="更多新品" class="btn btn-primary fa fa-search"/></div>
        </div>

        <div class="row margin-bottom-40 bg-red">
            <div class="row">
                <h2 class="col-lg-10 col-sm-10">热卖商品</h2>
                <p class="col-lg-10 col-sm-10">独一无二的制作工艺，让我们的产品成为您的首选</p>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${empty hotSells}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                    <c:otherwise>
                        <c:forEach items="${hotSells}" var="prod">
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
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row pull-right"><input type="button" value="更多热卖商品" class="btn btn-primary fa fa-search"/></div>
        </div>

        <div class="row margin-bottom-40 bg-light-green">
            <div class="row">
                <h2 class="col-lg-10 col-sm-10">特价优惠</h2>
                <p class="col-lg-10 col-sm-10">活动期间享受优惠，实惠多多！</p>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${empty lowPrices}"><p class="col-lg-10 col-sm-10">敬请期待!</p></c:when>
                    <c:otherwise>
                        <c:forEach items="${lowPrices}" var="prod">
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
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row pull-right"><input type="button" value="更多特价商品" class="btn btn-primary fa fa-search"/></div>
        </div>

        <!-- END SALE PRODUCT & NEW ARRIVALS -->

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