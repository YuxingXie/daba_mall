<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="page-slider">
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
                ${top3[1][2]}<br>${top3[1][3]}
            </div>

            <div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                <span>${top3[1][4]}</span>
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
