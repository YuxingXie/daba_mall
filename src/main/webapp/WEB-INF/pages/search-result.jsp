<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<head>
  <meta charset="utf-8">
  <title>搜索结果页</title>

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
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">              
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"><!-- for slider-range -->
  <link href="assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
  <link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
  <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css">  
  <link href="assets/css/custom.css" rel="stylesheet" type="text/css">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
    <!-- BEGIN TOP BAR -->
<div class="topscoll">
 <div class="pre-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right" style=" float:left !important;">
                    	<li><a href="login-page.html">注册</a></li>
                        <li><a href="login-page.html">登录</a></li>
                        <li><a href="checkout.html">结账</a></li>
                        <li><a href="#">我的账户</a></li>
                        <li><a href="#">我的收藏</a></li> 
                    </ul>
                </div><div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline" style=" float:right !important;">
                        <li><i class="fa fa-phone"></i><span>87654321</span></li>
                        <li class="langs-block">
                            <a href="javascript:void(0);" class="current">中文 <i class="fa fa-angle-down"></i></a>
                            <div class="langs-block-others-wrapper"><div class="langs-block-others">
                              <a href="javascript:void(0);">英语</a>
                            </div></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>        
    </div>

    <!-- BEGIN HEADER -->
  <div role="navigation" class="navbar header no-margin">
        <div class="container">
            <div class="navbar-header">
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <a href="index.html" class="navbar-brand"><img src="assets/img/logo_red.png" alt="大坝生态农业"></a><!-- LOGO -->
            </div>
            <!-- BEGIN CART -->
            <div class="cart-block">
                <div class="cart-info">
                    <a href="javascript:void(0);" class="cart-info-value">11</a>
                </div>
                <a href="#"><i class="fa fa-shopping-cart"></i></a>
                <!-- BEGIN CART CONTENT -->
                <div class="cart-content-wrapper">
                  <div class="cart-content">
                    <ul class="scroller" style="height: 250px;">
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                       <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                       <a href="item.html"><img src="assets/temp/cart-img.jpg" width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="item.html"><img src="assets/temp/cart-img.jpg"  width="37" height="34"></a>
                        <span class="cart-content-count">x 1</span>
                        <strong><a href="item.html">乡里腊肉</a></strong>
                        <em>￥123</em>
                        <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                      </li>
                    </ul>
                    <div class="text-right">
                      <a href="shopping-cart.html" class="btn btn-default">查看购物车</a>
                      <a href="checkout.html" class="btn btn-primary">结账付款</a>
                    </div>
                  </div>
                </div>
                <!-- END CART CONTENT -->
            </div>
            <!-- END CART -->
            <!-- BEGIN NAVIGATION -->
            <div class="collapse navbar-collapse mega-menu">
                <ul class="nav navbar-nav">
                	<li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                        网站地图
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu" aria-labelledby="mega-menu">
                        <li>
                          <div class="nav-content">
                            <!-- BEGIN DROPDOWN MENU - COLUMN -->
                            <div class="nav-content-col">
                              <h3>熏腊制品</h3>
                              <ul>
                                <li><a href="#">烟熏腊肉</a></li>
                                <li><a href="#">生态干鱼</a></li>
                                <li><a href="#">腊肠</a></li>
                                <li><a href="#">酱板鸭</a></li>
                              </ul>
                            </div>
                            <!-- END DROPDOWN MENU - COLUMN -->
                            <!-- BEGIN DROPDOWN MENU - COLUMN -->
                            <div class="nav-content-col">
                              <h3>鲜活水产</h3>
                              <ul>
                                <li><a href="#">黄材中华鲟</a></li>
                                <li><a href="#">大龙虾</a></li>
                                <li><a href="#">皇帝蟹</a></li>
                                <li><a href="#">三文鱼</a></li>
                                <li><a href="#">黄鲳</a></li>
                                <li><a href="#">甲鱼</a></li>
                                <li><a href="#">黄鸭叫</a></li>
                                <li><a href="#">泥鳅/黄鳝</a></li>
                              </ul>
                            </div>
                            <!-- END DROPDOWN MENU - COLUMN -->
                            <!-- BEGIN DROPDOWN MENU - COLUMN -->
                            <div class="nav-content-col">
                              <h3>新品上市</h3>
                              <ul>
                                <li><a href="#">黄材中华鲟</a></li>
                                <li><a href="#">生态干鱼</a></li>
                                <li><a href="#">烟熏腊肉</a></li>
                              </ul>

                              <h3>热卖商品</h3>
                              <ul>
                                <li><a href="#">黄鸭叫</a></li>
                                <li><a href="#">泥鳅/黄鳝</a></li>
                              </ul>
                            </div>
                            <!-- END DROPDOWN MENU - COLUMN -->
                            <!-- BEGIN DROPDOWN MENU - BRANDS -->
                            <!--<div class="nav-brands">
                              <ul>
                                <li><a href="#"><img title="esprit" alt="esprit" src="assets/temp/brands/esprit.jpg"></a></li>
                                <li><a href="#"><img title="gap" alt="gap" src="assets/temp/brands/gap.jpg"></a></li>
                                <li><a href="#"><img title="next" alt="next" src="assets/temp/brands/next.jpg"></a></li>
                                <li><a href="#"><img title="puma" alt="puma" src="assets/temp/brands/puma.jpg"></a></li>
                                <li><a href="#"><img title="zara" alt="zara" src="assets/temp/brands/zara.jpg"></a></li>
                              </ul>
                            </div>-->
                            <!-- END DROPDOWN MENU - BRANDS -->
                          </div>
                        </li>
                      </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>
                	<li><a href="#">官网首页</a></li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                        我的大坝
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu">
                        <li><a href="feature-typography.html">我的订单</a></li>
                        <li><a href="feature-forms.html">待处理订单</a></li>
                        <li><a href="feature-buttons.html">我的关注</a></li>
                        <li><a href="feature-icons.html">退货换货</a></li>
                      </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                        手机大坝
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu">
                  	<li><a href="#">手机用户首次下单买100送30</a></li>
                    <li class="divider"></li>
                    <li><a href="#">android客户端下载</a></li>
                    <li><a href="#"><img src="images/tuo_ma.png" class="tuo_ma"></a></li>
                    <li class="divider"></li>
                    <li><a href="#">ios客户端下载客户端</a></li>
                    <li><a href="#"><img src="images/tuo_ma.png" class="tuo_ma"></a></li>
                  </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>
                     <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                        新品上市
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu" aria-labelledby="mega-menu-catalogue">
                        <li>
                          <div class="nav-content">
                            <div class="product-item">
                              <div class="pi-img-wrapper">
                                <a href="item.html"><img src="assets/temp/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                              </div>
                              <h3><a href="item.html">黄材中华鲟</a></h3>
                              <div class="pi-price">￥29.00</div>
                              <a href="#" class="btn btn-default add2cart">添加到购物车</a>
                            </div>
                            <div class="product-item">
                              <div class="pi-img-wrapper">
                                <a href="item.html"><img src="assets/temp/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                              </div>
                              <h3><a href="item.html">乡里腊肉</a></h3>
                              <div class="pi-price">￥52.00</div>
                              <a href="#" class="btn btn-default add2cart">添加到购物车</a>
                            </div>
                            <div class="product-item">
                              <div class="pi-img-wrapper">
                                <a href="item.html"><img src="assets/temp/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                              </div>
                              <h3><a href="item.html">生态干鱼</a></h3>
                              <div class="pi-price">￥36.00</div>
                              <a href="#" class="btn btn-default add2cart">添加到购物车</a>
                            </div>
                          </div>
                        </li>
                      </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                        客服服务
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu">
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">售后服务</a></li>
                        <li class="dropdown-submenu">
                          <a href="#">在线客服 <i class="fa fa-angle-right"></i></a>
                          <ul class="dropdown-menu">
                            <li><a href="#">联系电话：0731-87654321</a></li>
                            <li><a href="#">企业QQ：888888</a></li>
                          </ul>
                        </li>
                        <li><a href="#">意见建议</a></li>
                        <li><a href="#">客服邮箱</a></li>
                      </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>
                   
                    <!-- BEGIN TOP SEARCH -->
                    <li class="menu-search">
                        <span class="sep"></span>
                        <i class="fa fa-search search-btn"></i>
                        <div class="search-box">
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" placeholder="查找" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">查找</button>
                                    </span>
                                </div>
                            </form>
                        </div> 
                    </li>
                    <!-- END TOP SEARCH -->
                </ul>
            </div>
            <!-- END NAVIGATION -->
        </div>
    </div>
    
</div>
    <!-- END HEADER -->

    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
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
                  <form action="#">
                    <div class="input-group">
                      <input type="text" placeholder="重新搜索" class="form-control">
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
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后恢复默认排序">综合排序&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后按照价格从高到低排序">价格排序&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后按照销量从多到少排序">销量排序&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后按照评论从多到少排序">评论排序&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">热卖商品&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
                <div class="pull-left">
                  <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">新品上市&nbsp;&nbsp;<i class="fa fa-chevron-down"></i></a></label>
                </div>
               
              </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
              <!-- PRODUCT ITEM START -->
              <div class="col-md-12 col-sm-0 col-xs-12">
                 <div class="product-item">
                    <img id="resule-thumb" src="assets/temp/products/model2.jpg" class="pull-left" alt="豆腐乳">                 
                  <div class="introduce">
                  <h3><a href="#">豆腐乳</a></h3>
                  <p class="ware-desc pull-left">是中国流传数千年的汉族传统民间美食，因其口感好、营养高，闻起来有股臭，吃起来特别的香味深受中国老百姓及东南亚地区人民的喜爱，是一道经久不衰的美味佳肴。</p>
                  </div>
					<div class="price-avail pull-right">
                        <div class="form-groupx">
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                  <p class="discuss">评论数&nbsp;:&nbsp;<a>23011</a></p>
                  <p class="price">￥29.00</p>
                 	<a href="#" class="btn btn-default add2cart">添加到购物车</a>
                  </div>
                </div>
              </div>
              
               <div class="col-md-12 col-sm-0 col-xs-12">
                <div class="product-item">
                    <img id="resule-thumb" src="assets/temp/products/model2.jpg" class="pull-left" alt="豆腐乳">                 
                  <div class="introduce">
                  <h3><a href="#">豆腐乳</a></h3>
                  <p class="ware-desc pull-left">是中国流传数千年的汉族传统民间美食，因其口感好、营养高，闻起来有股臭，吃起来特别的香味深受中国老百姓及东南亚地区人民的喜爱，是一道经久不衰的美味佳肴。</p>
                  </div>
					<div class="price-avail pull-right">
                        <div class="form-groupx">
                          <div class="rateit" data-rateit-value="4" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                  <p class="discuss">评论数&nbsp;:&nbsp;<a>23011</a></p>
                  <p class="price">￥29.00</p>
                 	<a href="#" class="btn btn-default add2cart">添加到购物车</a>
                  </div>
                </div>
              </div>
              
               <div class="col-md-12 col-sm-0 col-xs-12">
               <div class="product-item">
                    <img id="resule-thumb" src="assets/temp/products/model2.jpg" class="pull-left" alt="豆腐乳">                 
                  <div class="introduce">
                  <h3><a href="#">豆腐乳</a></h3>
                  <p class="ware-desc pull-left">是中国流传数千年的汉族传统民间美食，因其口感好、营养高，闻起来有股臭，吃起来特别的香味深受中国老百姓及东南亚地区人民的喜爱，是一道经久不衰的美味佳肴。</p>
                  </div>
					<div class="price-avail pull-right">
                        <div class="form-groupx">
                          <div class="rateit" data-rateit-value="4.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                  <p class="discuss">评论数&nbsp;:&nbsp;<a>23011</a></p>
                  <p class="price">￥29.00</p>
                 	<a href="#" class="btn btn-default add2cart">添加到购物车</a>
                  </div>
                </div>
              </div>
              
               <div class="col-md-12 col-sm-0 col-xs-12">
                <div class="product-item">
                    <img id="resule-thumb" src="assets/temp/products/model2.jpg" class="pull-left" alt="豆腐乳">                 
                  <div class="introduce">
                  <h3><a href="#">豆腐乳</a></h3>
                  <p class="ware-desc pull-left">是中国流传数千年的汉族传统民间美食，因其口感好、营养高，闻起来有股臭，吃起来特别的香味深受中国老百姓及东南亚地区人民的喜爱，是一道经久不衰的美味佳肴。</p>
                  </div>
					<div class="price-avail pull-right">
                        <div class="form-groupx">
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                  <p class="discuss">评论数&nbsp;:&nbsp;<a>23011</a></p>
                  <p class="price">￥29.00</p>
                 	<a href="#" class="btn btn-default add2cart">添加到购物车</a>
                  </div>
                </div>
              </div>
              
               <div class="col-md-12 col-sm-0 col-xs-12">
                <div class="product-item">
                    <img id="resule-thumb" src="assets/temp/products/model2.jpg" class="pull-left" alt="豆腐乳">                 
                  <div class="introduce">
                  <h3><a href="#">豆腐乳</a></h3>
                  <p class="ware-desc pull-left">是中国流传数千年的汉族传统民间美食，因其口感好、营养高，闻起来有股臭，吃起来特别的香味深受中国老百姓及东南亚地区人民的喜爱，是一道经久不衰的美味佳肴。</p>
                  </div>
					<div class="price-avail pull-right">
                        <div class="form-groupx">
                          <div class="rateit" data-rateit-value="3.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>
                  <p class="discuss">评论数&nbsp;:&nbsp;<a>23011</a></p>
                  <p class="price">￥29.00</p>
                 	<a href="#" class="btn btn-default add2cart">添加到购物车</a>
                  </div>
                </div>
              </div>
              <!-- PRODUCT ITEM END -->
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row" style=" padding-bottom:20px;">
              <div class="col-md-12 col-sm-12">
                <ul class="pagination pull-right">
                  <li><a href="#">&laquo;</a></li>
                  <li><span>1</span></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <div class="sidebar-products clearfix">
              <h2>热销商品</h2>
              <div class="item">
                <a href="item.html"><img src="assets/temp/products/k1.jpg" alt="腊肉"></a>
                <h3><a href="item.html">腊肉的防腐能力强，能延长保存时间</a></h3>
                <div class="price">$31.00</div>
              </div>
              <div class="item">
                <a href="item.html"><img src="assets/temp/products/k2.jpg" alt="腊鱼"></a>
                <h3><a href="item.html">腊鱼是将鱼洗净腌制晒干后的称呼</a></h3>
                <div class="price">$23.00</div>
              </div>
              <div class="item">
                <a href="item.html"><img src="assets/temp/products/k3.jpg" alt="龙虾"></a>
                <h3><a href="item.html">外壳坚硬，色彩斑斓，腹部短小</a></h3>
                <div class="price">$86.00</div>
              </div>
              <div class="item">
                <a href="item.html"><img src="assets/temp/products/k4.jpg" alt="土花猪"></a>
                <h3><a href="item.html">产于湖南长沙宁乡县流沙河</a></h3>
                <div class="price">$66.00</div>
              </div>
            </div>
          </div>
          <!-- END SIDEBAR -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>


    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script type="text/javascript" src="assets/plugins/back-to-top.js"></script> 
    <script type="text/javascript" src="assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>   
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>  
    <script type="text/javascript" src="assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
    <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script type="text/javascript" src='assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script type="text/javascript" src="assets/scripts/app.js"></script>
    <script type="text/javascript">
      jQuery(document).ready(function() {
        App.init();
        App.initBxSlider(); 
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform(); 
        App.initTouchspin();
      });
    </script>

</body>
