<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head lang="en" >
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">
    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

    <!-- Fonts START -->
    <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&subset=all" rel="stylesheet" type="text/css">--%>
    <%--<link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">--%>
    <%--<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->--%>
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- Global styles END -->
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-1.10.2.min.js"></script>
    <!-- Page level plugin styles START -->
    <link href="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="${path}/statics/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/statics/assets/plugins/layerslider/css/layerslider.css" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${path}/statics/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Theme styles END -->


    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular-route.js"></script>

    <script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
    <title>大坝生态农业</title>
</head>

<body>

<div data-ng-view></div>
<%--&lt;%&ndash;start&ndash;%&gt;--%>
<%--<div class="topscoll">--%>
    <%--<div class="pre-header">--%>
        <%--<div class="container">--%>
            <%--<div class="row">--%>
                <%--<div class="col-md-6 col-sm-6 additional-nav">--%>
                    <%--<ul class="list-unstyled list-inline pull-right" style=" float:left !important;">--%>
                        <%--<li><a href="login-page.html">注册</a></li>--%>
                        <%--<li><a href="login-page.html">登录</a></li>--%>
                        <%--<li><a href="checkout.html">结账</a></li>--%>
                        <%--<li><a href="#">我的账户</a></li>--%>
                        <%--<li><a href="#">我的收藏</a></li>--%>
                    <%--</ul>--%>
                <%--</div><div class="col-md-6 col-sm-6 additional-shop-info">--%>
                <%--<ul class="list-unstyled list-inline" style=" float:right !important;">--%>
                    <%--<li><i class="fa fa-phone"></i><span>87654321</span></li>--%>
                    <%--<li class="langs-block">--%>
                        <%--<a href="javascript:void(0);" class="current">中文 <i class="fa fa-angle-down"></i></a>--%>
                        <%--<div class="langs-block-others-wrapper"><div class="langs-block-others">--%>
                            <%--<a href="javascript:void(0);">英语</a>--%>
                        <%--</div></div>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<!-- BEGIN HEADER -->--%>
    <%--<div role="navigation" class="navbar header no-margin">--%>
        <%--<div class="container">--%>
            <%--<div class="navbar-header">--%>
                <%--<!-- BEGIN RESPONSIVE MENU TOGGLER -->--%>
                <%--<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">--%>
                    <%--<span class="sr-only">Toggle navigation</span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                <%--</button>--%>
                <%--<!-- END RESPONSIVE MENU TOGGLER -->--%>
                <%--<a href="index.html" class="navbar-brand"><img src="${path}/statics/assets/img/logo_red.png" alt="大坝生态农业"></a><!-- LOGO -->--%>
            <%--</div>--%>
            <%--<!-- BEGIN CART -->--%>
            <%--<div class="cart-block">--%>
                <%--<div class="cart-info">--%>
                    <%--<a href="javascript:void(0);" class="cart-info-value">11</a>--%>
                <%--</div>--%>
                <%--<a href="#"><i class="fa fa-shopping-cart"></i></a>--%>
                <%--<!-- BEGIN CART CONTENT -->--%>
                <%--<div class="cart-content-wrapper">--%>
                    <%--<div class="cart-content">--%>
                        <%--<ul class="scroller" style="height: 250px;">--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg" width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">乡里腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="item.html"><img src="${path}/statics/assets/temp/cart-img.jpg"  width="37" height="34"></a>--%>
                                <%--<span class="cart-content-count">x 1</span>--%>
                                <%--<strong><a href="item.html">双凫铺腊肉</a></strong>--%>
                                <%--<em>￥123</em>--%>
                                <%--<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<div class="text-right">--%>
                            <%--<a href="shopping-cart.html" class="btn btn-default">查看购物车</a>--%>
                            <%--<a href="checkout.html" class="btn btn-primary">结账付款</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<!-- END CART CONTENT -->--%>
            <%--</div>--%>
            <%--<!-- END CART -->--%>
            <%--<!-- BEGIN NAVIGATION -->--%>
            <%--<div class="collapse navbar-collapse mega-menu">--%>
                <%--<ul class="nav navbar-nav">--%>
                    <%--<li class="dropdown">--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">--%>
                            <%--网站地图--%>
                            <%--<i class="fa fa-angle-down"></i>--%>
                        <%--</a>--%>
                        <%--<!-- BEGIN DROPDOWN MENU -->--%>
                        <%--<ul class="dropdown-menu" aria-labelledby="mega-menu">--%>
                            <%--<li>--%>
                                <%--<div class="nav-content">--%>
                                    <%--<!-- BEGIN DROPDOWN MENU - COLUMN -->--%>
                                    <%--<div class="nav-content-col">--%>
                                        <%--<h3>熏腊制品</h3>--%>
                                        <%--<ul>--%>
                                            <%--<li><a href="#">烟熏腊肉</a></li>--%>
                                            <%--<li><a href="#">生态干鱼</a></li>--%>
                                            <%--<li><a href="#">腊肠</a></li>--%>
                                            <%--<li><a href="#">酱板鸭</a></li>--%>
                                        <%--</ul>--%>
                                    <%--</div>--%>
                                    <%--<!-- END DROPDOWN MENU - COLUMN -->--%>
                                    <%--<!-- BEGIN DROPDOWN MENU - COLUMN -->--%>
                                    <%--<div class="nav-content-col">--%>
                                        <%--<h3>鲜活水产</h3>--%>
                                        <%--<ul>--%>
                                            <%--<li><a href="#">黄材中华鲟</a></li>--%>
                                            <%--<li><a href="#">大龙虾</a></li>--%>
                                            <%--<li><a href="#">皇帝蟹</a></li>--%>
                                            <%--<li><a href="#">三文鱼</a></li>--%>
                                            <%--<li><a href="#">黄鲳</a></li>--%>
                                            <%--<li><a href="#">甲鱼</a></li>--%>
                                            <%--<li><a href="#">黄鸭叫</a></li>--%>
                                            <%--<li><a href="#">泥鳅/黄鳝</a></li>--%>
                                        <%--</ul>--%>
                                    <%--</div>--%>
                                    <%--<!-- END DROPDOWN MENU - COLUMN -->--%>
                                    <%--<!-- BEGIN DROPDOWN MENU - COLUMN -->--%>
                                    <%--<div class="nav-content-col">--%>
                                        <%--<h3>新品上市</h3>--%>
                                        <%--<ul>--%>
                                            <%--<li><a href="#">黄材中华鲟</a></li>--%>
                                            <%--<li><a href="#">生态干鱼</a></li>--%>
                                            <%--<li><a href="#">烟熏腊肉</a></li>--%>
                                        <%--</ul>--%>

                                        <%--<h3>热卖商品</h3>--%>
                                        <%--<ul>--%>
                                            <%--<li><a href="#">黄鸭叫</a></li>--%>
                                            <%--<li><a href="#">泥鳅/黄鳝</a></li>--%>
                                        <%--</ul>--%>
                                    <%--</div>--%>
                                    <%--<!-- END DROPDOWN MENU - COLUMN -->--%>
                                    <%--<!-- BEGIN DROPDOWN MENU - BRANDS -->--%>
                                    <%--<!--<div class="nav-brands">--%>
                                      <%--<ul>--%>
                                        <%--<li><a href="#"><img title="esprit" alt="esprit" src="${path}/statics/assets/temp/brands/esprit.jpg"></a></li>--%>
                                        <%--<li><a href="#"><img title="gap" alt="gap" src="${path}/statics/assets/temp/brands/gap.jpg"></a></li>--%>
                                        <%--<li><a href="#"><img title="next" alt="next" src="${path}/statics/assets/temp/brands/next.jpg"></a></li>--%>
                                        <%--<li><a href="#"><img title="puma" alt="puma" src="${path}/statics/assets/temp/brands/puma.jpg"></a></li>--%>
                                        <%--<li><a href="#"><img title="zara" alt="zara" src="${path}/statics/assets/temp/brands/zara.jpg"></a></li>--%>
                                      <%--</ul>--%>
                                    <%--</div>-->--%>
                                    <%--<!-- END DROPDOWN MENU - BRANDS -->--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<!-- END DROPDOWN MENU -->--%>
                    <%--</li>--%>
                    <%--<li><a href="#">官网首页</a></li>--%>
                    <%--<li class="dropdown">--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">--%>
                            <%--我的大坝--%>
                            <%--<i class="fa fa-angle-down"></i>--%>
                        <%--</a>--%>
                        <%--<!-- BEGIN DROPDOWN MENU -->--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="order-form.html">我的订单</a></li>--%>
                            <%--<li><a href="order-form.html">待处理订单</a></li>--%>
                            <%--<li><a href="order-form.html">我的关注</a></li>--%>
                            <%--<li><a href="order-form.html">退货换货</a></li>--%>
                        <%--</ul>--%>
                        <%--<!-- END DROPDOWN MENU -->--%>
                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">--%>
                            <%--手机大坝--%>
                            <%--<i class="fa fa-angle-down"></i>--%>
                        <%--</a>--%>
                        <%--<!-- BEGIN DROPDOWN MENU -->--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#">手机用户首次下单买100送30</a></li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li><a href="#">android客户端下载</a></li>--%>
                            <%--<li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li><a href="#">ios客户端下载客户端</a></li>--%>
                            <%--<li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>--%>
                        <%--</ul>--%>
                        <%--<!-- END DROPDOWN MENU -->--%>
                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">--%>
                            <%--新品上市--%>
                            <%--<i class="fa fa-angle-down"></i>--%>
                        <%--</a>--%>
                        <%--<!-- BEGIN DROPDOWN MENU -->--%>
                        <%--<ul class="dropdown-menu" aria-labelledby="mega-menu-catalogue">--%>
                            <%--<li>--%>
                                <%--<div class="nav-content">--%>
                                    <%--<div class="product-item">--%>
                                        <%--<div class="pi-img-wrapper">--%>
                                            <%--<a href="item.html"><img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress"></a>--%>
                                        <%--</div>--%>
                                        <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                        <%--<div class="pi-price">￥29.00</div>--%>
                                        <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                    <%--</div>--%>
                                    <%--<div class="product-item">--%>
                                        <%--<div class="pi-img-wrapper">--%>
                                            <%--<a href="item.html"><img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress"></a>--%>
                                        <%--</div>--%>
                                        <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                        <%--<div class="pi-price">￥52.00</div>--%>
                                        <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                    <%--</div>--%>
                                    <%--<div class="product-item">--%>
                                        <%--<div class="pi-img-wrapper">--%>
                                            <%--<a href="item.html"><img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress"></a>--%>
                                        <%--</div>--%>
                                        <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                        <%--<div class="pi-price">￥36.00</div>--%>
                                        <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<!-- END DROPDOWN MENU -->--%>
                    <%--</li>--%>
                    <%--<li class="dropdown">--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">--%>
                            <%--客服服务--%>
                            <%--<i class="fa fa-angle-down"></i>--%>
                        <%--</a>--%>
                        <%--<!-- BEGIN DROPDOWN MENU -->--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#">关于我们</a></li>--%>
                            <%--<li><a href="#">售后服务</a></li>--%>
                            <%--<li class="dropdown-submenu">--%>
                                <%--<a href="#">在线客服 <i class="fa fa-angle-right"></i></a>--%>
                                <%--<ul class="dropdown-menu">--%>
                                    <%--<li><a href="#">联系电话：0731-87654321</a></li>--%>
                                    <%--<li><a href="#">企业QQ：888888</a></li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>
                            <%--<li><a href="#">意见建议</a></li>--%>
                            <%--<li><a href="#">客服邮箱</a></li>--%>
                        <%--</ul>--%>
                        <%--<!-- END DROPDOWN MENU -->--%>
                    <%--</li>--%>

                    <%--<!-- BEGIN TOP SEARCH -->--%>
                    <%--<li class="menu-search">--%>
                        <%--<span class="sep"></span>--%>
                        <%--<i class="fa fa-search search-btn"></i>--%>
                        <%--<div class="search-box">--%>
                            <%--<form action="#">--%>
                                <%--<div class="input-group">--%>
                                    <%--<input type="text" placeholder="查找" class="form-control">--%>
                                    <%--<span class="input-group-btn">--%>
                                        <%--<button class="btn btn-primary" type="submit">查找</button>--%>
                                    <%--</span>--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<!-- END TOP SEARCH -->--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END NAVIGATION -->--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>
<%--<!-- END HEADER -->--%>
<%--<!-- BEGIN SLIDER -->--%>
<%--<div class="page-slider margin-bottom-35">--%>
    <%--<!--LayerSlider begin-->--%>
    <%--<div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">--%>
        <%--<!--LayerSlider layer-->--%>
        <%--<!--LayerSlider layer-->--%>
        <%--<div class="ls-layer ls-layer2" style="slidedirection: right; transition2d: 110,111,112,113; ">--%>
            <%--<img src="${path}/statics/assets/temp/sliders/slide2/bg.jpg" class="ls-bg" alt="Slide background">--%>
            <%--<div class="ls-s-1 ls-title title" style=" top: 40%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">--%>
                <%--<strong class="title">黄材水产</strong>--%>
                <%--新品上市--%>
                <%--<em class="title">中华鲟</em>--%>
            <%--</div>--%>

            <%--<div class="ls-s-2 ls-price title" style=" top: 50%; left: 45%; slidedirection : fade; slideoutdirection : fade; durationout : 109750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">--%>
                <%--<b>优惠价</b>--%>
                <%--<strong><span>￥</span>25</strong>--%>
            <%--</div>--%>

            <%--<a href="#" class="ls-s-1 ls-more mini-text" style=" top: 72%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; display: inline-block; white-space: nowrap;">--%>
                <%--添加到购物车--%>
            <%--</a>--%>
        <%--</div>--%>
        <%--<div class="ls-layer ls-layer5" style="slidedirection: right; transition2d: 110,111,112,113; ">--%>
            <%--<img src="${path}/statics/assets/temp/sliders/slide5/bg.jpg" class="ls-bg" alt="Slide background">--%>

            <%--<div class="ls-s-1 title" style=" top: 35%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">--%>
                <%--本地<br>--%>
                <%--生态腊鱼--%>
            <%--</div>--%>

            <%--<div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">--%>
                <%--<span>货源充足，放心购买</span>--%>
                <%--<a href="#">添加到购物车</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!--LayerSlider layer-->--%>
        <%--<div class="ls-layer ls-layer3" style="slidedirection: right; transition2d: 92,93,105; ">--%>
            <%--<img src="${path}/statics/assets/temp/sliders/slide3/bg.jpg" class="ls-bg" alt="Slide background">--%>

            <%--<div class="ls-s-1 ls-title" style=" top: 83px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">--%>
                <%--正宗乡里腊肉--%>
                <%--<strong>源自宁乡</strong>--%>
                <%--您购买的不二选择--%>
            <%--</div>--%>

            <%--<div class="ls-s-1" style=" top: 333px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;">--%>
                <%--<a href="#" class="ls-buy">--%>
                    <%--添加到购物车--%>
                <%--</a>--%>
                <%--<div class="ls-price">--%>
                    <%--<span>最新优惠价</span>--%>
                    <%--<strong><sup>￥</sup>49</strong>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--<!--LayerSlider layer-->--%>

    <%--</div>--%>
    <%--<!--LayerSlider end-->--%>
<%--</div>--%>
<%--<!-- END SLIDER -->--%>

<%--<div class="main">--%>
    <%--<div class="container">--%>
        <%--<!-- BEGIN SALE PRODUCT & 新品上市 -->--%>
        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2>新品上市</h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>
        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2></h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>

                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="${path}/statics/assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>
        <%--<!-- END SALE PRODUCT & NEW ARRIVALS -->--%>

        <%--<!-- BEGIN SALE PRODUCT & 热卖商品 -->--%>
        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2>热卖商品</h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>


        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2></h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>
        <%--<!-- END SALE PRODUCT & NEW ARRIVALS -->--%>

        <%--<!-- BEGIN SALE PRODUCT & 特价优惠 -->--%>
        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2>特价优惠</h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>


        <%--<div class="row margin-bottom-40">--%>
            <%--<!-- BEGIN SALE PRODUCT -->--%>
            <%--<div class="col-md-12 sale-product">--%>
                <%--<h2></h2>--%>
                <%--<div class="bxslider-wrapper">--%>
                    <%--<ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model1.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">帝王蟹</a></h3>--%>
                                <%--<div class="pi-price">￥82.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-sale"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model2.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">豆腐乳</a></h3>--%>
                                <%--<div class="pi-price">￥19.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model6.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">酱板鸭</a></h3>--%>
                                <%--<div class="pi-price">￥78.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model4.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">黄材中华鲟</a></h3>--%>
                                <%--<div class="pi-price">￥20.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model5.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">大龙虾</a></h3>--%>
                                <%--<div class="pi-price">￥9.90</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model3.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">乡里腊肉</a></h3>--%>
                                <%--<div class="pi-price">￥32.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="product-item">--%>
                                <%--<div class="pi-img-wrapper">--%>
                                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">--%>
                                    <%--<div>--%>
                                        <%--<a href="assets/temp/products/model7.jpg" class="btn btn-default fancybox-button">大图</a>--%>
                                        <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<h3><a href="item.html">生态干鱼</a></h3>--%>
                                <%--<div class="pi-price">￥56.00</div>--%>
                                <%--<a href="#" class="btn btn-default add2cart">添加到购物车</a>--%>
                                <%--<div class="sticker sticker-new"></div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<!-- END SALE PRODUCT -->--%>
        <%--</div>--%>
        <%--<!-- END SALE PRODUCT & NEW ARRIVALS -->--%>

    <%--</div>--%>
<%--</div>--%>

<%--<!-- BEGIN BRANDS -->--%>

<%--<!-- END BRANDS -->--%>

<%--<!-- BEGIN STEPS -->--%>
<%--<div class="steps3 steps3red">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-truck"></i>--%>
                <%--<div>--%>
                    <%--<h2>品质保证</h2>--%>
                    <%--<em>我们只生产生态绿色食品</em>--%>
                <%--</div>--%>
                <%--<span>&nbsp;</span>--%>
            <%--</div>--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-gift"></i>--%>
                <%--<div>--%>
                    <%--<h2>商务合作</h2>--%>
                    <%--<em>我们的强大需要您的加入</em>--%>
                <%--</div>--%>
                <%--<span>&nbsp;</span>--%>
            <%--</div>--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-phone"></i>--%>
                <%--<div>--%>
                    <%--<h2>87654321</h2>--%>
                    <%--<em>24小时竭诚为您服务热线</em>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- END STEPS -->--%>

<%--<!-- BEGIN PRE-FOOTER -->--%>
<%--<div class="pre-footer">--%>
    <%--<div class="container">--%>
        <%--<hr>--%>
        <%--<div class="row">--%>
            <%--<!-- BEGIN BOTTOM ABOUT BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>关于我们</h2>--%>
                <%--<p>长沙大坝生态农业科技有限公司组建于2013年，注册资本1000万元，现有固定员工180人。公司致力于现代生态高效农业产业化集群开发，着力打造全民创业、万众创新的平台，着力解决千家万户的"菜篮子"、"米袋子"、"果盘子"所需。</p>--%>
                <%--<p>公司拥有"一中心，二平台，三基地"。即特色农产品展示中心；特色农产品研发孵化平台，特色农产品信息交流平台；长沙大坝生态金棋现代农业示范基地，长沙大坝生态黄材水库有机野生鱼类养殖基地，长沙大坝生态干鱼加工基地。</p>--%>
            <%--</div>--%>
            <%--<!-- END BOTTOM ABOUT BLOCK -->--%>
            <%--<!-- BEGIN BOTTOM INFO BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>企业动态</h2>--%>
                <%--<ul class="list-unstyled">--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">公司崇尚的文化</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">大坝精神</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">我们有一支优秀的团队</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">企业历史</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">打造特色农产品信息交流平台</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">人民出版社出版大坝书籍</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">中央电视访谈大坝团队成功经历</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END INFO BLOCK -->--%>
            <%--<!-- BEGIN TWITTER BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>媒体报道</h2>--%>
                <%--<ul class="list-unstyled">--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">大坝生态农业在美国上市</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">挺近世界500强的艰辛历程</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">成为国内首支团队完整的电商企业</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">荣获优秀企业称号</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">公司年营业额占据福布斯榜首</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END TWITTER BLOCK -->--%>
            <%--<!-- BEGIN BOTTOM CONTACTS -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>联系我们</h2>--%>
                <%--<address class="margin-bottom-40">--%>
                    <%--联系电话：0731-87654321<br>--%>
                    <%--企业QQ：88888888<br>--%>
                    <%--公司微信：weixin_daba<br>--%>
                    <%--电子邮件: <a href="mailto:info@metronic.com">info@metronic.com</a><br>--%>
                <%--</address>--%>
            <%--</div>--%>
            <%--<!-- END BOTTOM CONTACTS -->--%>
        <%--</div>--%>
        <%--<hr>--%>



    <%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<!-- END PRE-FOOTER -->--%>

<%--<!-- BEGIN FOOTER -->--%>
<%--<div class="footer padding-top-15">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<!-- BEGIN COPYRIGHT -->--%>
            <%--<div class="col-md-6 col-sm-6 padding-top-10">--%>
                <%--www.daba.com2015&copy; 湘ICP备88888888号-8--%>
            <%--</div>--%>
            <%--<!-- END COPYRIGHT -->--%>
            <%--<!-- BEGIN PAYMENTS -->--%>
            <%--<div class="col-md-6 col-sm-6">--%>
                <%--<ul class="list-unstyled list-inline pull-right margin-bottom-15">--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/american-express.jpg" alt="We accept American Express" title="We accept American Express"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/MasterCard.jpg" alt="We accept MasterCard" title="We accept MasterCard"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/PayPal.jpg" alt="We accept PayPal" title="We accept PayPal"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa"></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END PAYMENTS -->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- END FOOTER -->--%>

<%--<!-- BEGIN fast view of a product -->--%>
<%--<div id="product-pop-up" style="display: none; width: 700px;">--%>
    <%--<div class="product-page product-pop-up">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-3">--%>
                <%--<div class="product-main-image">--%>
                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">--%>
                <%--</div>--%>
                <%--<div class="product-other-images">--%>
                    <%--<a href="#" class="active"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model3.jpg"></a>--%>
                    <%--<a href="#"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model4.jpg"></a>--%>
                    <%--<a href="#"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model5.jpg"></a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-9">--%>
                <%--<h1 style=" text-align:center;">烟熏腊鱼</h1>--%>
                <%--<div class="price-availability-block clearfix">--%>
                    <%--<div class="price">--%>
                        <%--<strong><span>￥</span>47.00</strong>--%>
                        <%--<em>￥<span>62.00</span></em>--%>
                    <%--</div>--%>
                    <%--<div class="availability">--%>
                        <%--状态: <strong>货源充足</strong>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="description" style=" direction:ltr;">--%>
                    <%--<p>腊鱼是将鱼洗净腌制晒干后的称呼，鲫鱼、草鱼、鲤鱼都可以制作腊鱼。腌制腊鱼是我国传统水产加工食品，其风味独特，耐贮藏，在我国南方的饮食文化中有着重要地位。在腌腊鱼的加工过程中，由于微生物和原料鱼中酶类的作用</p>--%>
                <%--</div>--%>
                <%--<div class="product-page-options">--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label" style=" direction:ltr;">产地&nbsp;:&nbsp;</label>--%>
                        <%--<select class="form-control input-sm">--%>
                            <%--<option>黄材</option>--%>
                            <%--<option>横市</option>--%>
                            <%--<option>双凫铺</option>--%>
                            <%--<option>大成桥</option>--%>
                            <%--<option>回龙铺</option>--%>
                            <%--<option>宁乡</option>--%>
                        <%--</select>--%>

                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                        <%--<label class="control-label" style=" direction:ltr;">种类&nbsp;:&nbsp;</label>--%>
                        <%--<select class="form-control input-sm">--%>
                            <%--<option>三文鱼腊鱼</option>--%>
                            <%--<option>福寿鱼腊鱼</option>--%>
                            <%--<option>草鱼腊鱼</option>--%>
                        <%--</select>--%>

                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="product-page-cart">--%>
                    <%--<div class="product-quantity">--%>
                        <%--<input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">--%>
                    <%--</div>--%>
                    <%--<button class="btn btn-primary" type="submit">添加到购物车</button>--%>
                    <%--<button class="btn btn-default" type="submit">更多商品</button>--%>
                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--end--%>
<script type="text/javascript">
    var myApp = angular.module("myApp", ['ngRoute']);
    myApp.config(['$routeProvider', function ($routeProvider) {
        //在这里定义路由
        $routeProvider
                .when("/", {templateUrl: '${path}/content.do', controller: 'HomeController'})
                .when("/login", {templateUrl: 'views/login.html', controller: 'LoginController'})
                .when("/inbox/:name", {templateUrl: 'views/inbox.html', controller: 'InboxController'})
                .when("/dashboard", {
                    templateUrl: 'views/dashboard.html',
                    controller: 'DashboardController'
//            ,resolve:{user:function(SessionService){return SessionService.getCurrentUser()}}
                })
                .otherwise({redirectTo: '/'});
    }])
            .controller("HomeController", function ($scope) {})
            .controller("LoginController", function ($scope,$location, $log) {
                $log.info($location.search());
//                 $location.path("/inbox/xx");
            })
            .controller("DashboardController", function ($scope) {})
            .controller("InboxController", function ($scope, $routeParams, $log) {
                $log.info($routeParams.name)
            }).run(['$rootScope', '$location',"$route", function($rootScope, $location,$route) {
                $rootScope.$on('$routeChangeSuccess', function(evt, current, previous) {
                    console.log('route have already changed');
                    App.init();
                    App.initBxSlider();
                    Index.initLayerSlider();
                    App.initImageZoom();
                    App.initTouchspin();
                });
            }])
    ;
</script>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<%--<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script><!-- pop up -->
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<%--<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>--%>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>--%>
<script type="text/javascript">
    jQuery(document).ready(function() {
//        App.init();
//        App.initBxSlider();
//        Index.initLayerSlider();
//        App.initImageZoom();
//        App.initTouchspin();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
