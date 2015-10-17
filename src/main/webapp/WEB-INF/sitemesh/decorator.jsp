<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html>

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
    <meta property="og:image" content="-CUSTOMER VALUE-">
    <!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">
    <%--<link rel="shortcut icon" href="favicon.ico">--%>
    <%--<link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">--%>

    <!-- Global styles START -->
    <link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">

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
    <script> path="${path}";</script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
    <sitemesh:write property='head'/>
    <title>大坝生态农业</title>
    <sitemesh:write property='title'/>
</head>
<body>
<div class="topscoll">
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right" style=" float:left !important;">
                        <c:choose>
                            <c:when test="${empty sessionScope.loginUser}">
                                <li><a href="${path}/index/user/register">注册</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal">登录</a></li>
                            </c:when>
                            <c:otherwise>
                                <li>欢迎您,<a href="#">${sessionScope.loginUser.name}</a>!</li>
                                </li><li><a href="#" id="logout">退出</a></li>
                            </c:otherwise>
                        </c:choose>

                        <li><a href="checkout.html">结账</a></li>
                        <li><a href="#">我的账户</a></li>
                        <li><a href="#">我的收藏</a></li>
                    </ul>
                </div>
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline" style=" float:right !important;">
                        <li><i class="fa fa-phone"></i><span>87654321</span></li>
                        <li class="langs-block">
                            <a href="javascript:void(0);" class="current">中文 <i class="fa fa-angle-down"></i></a>
                            <div class="langs-block-others-wrapper">
                                <div class="langs-block-others">
                                    <a href="javascript:void(0);">英语</a>
                                </div>
                            </div>
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
                <a href="index.html" class="navbar-brand"><img src="${path}/statics/assets/img/logo_red.png"
                                                               alt="大坝生态农业"></a><!-- LOGO -->
            </div>
            <!-- BEGIN CART -->
            <div class="cart-block">
                <div class="cart-info">
                    <%--<a href="javascript:void(0);" class="cart-info-value">11</a>--%>
                    <div class="J-shoping J-shoping-small">
                        <div class="J-shoping-title">
                            <span class="baseBg J-shoping-num"><c:choose>
                                <c:when test="${empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">0</c:when>
                                <c:otherwise>${fn:length(sessionScope.cart.productSelectedList)}</c:otherwise>
                            </c:choose>
                            </span>
                        </div>
                    </div>
                </div>
                <a href="#"><i class="fa fa-shopping-cart"></i></a>
                <!-- BEGIN CART CONTENT -->
                <div class="cart-content-wrapper">
                    <div class="cart-content">
                        <ul class="scroller" style="height:250px;" id="cart_list">
                            <c:choose>
                                <c:when test="${empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">
                                    <li>您的购物车中还没有商品</li>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">
                                        <c:set var="totalPrice" value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                        <li data-selected-index="${selectedIndex.index}">
                                            <a href="${path}/product/${productSelected.productSeriesId}"><img src="${path}/${productSelected.productSeries.pictures[0]}" width="37" height="34"></a>
                                            <span class="cart-content-count">x ${productSelected.amount}</span>
                                            <strong>
                                                <a href="${path}/product/${productSelected.productSeriesId}"> ${productSelected.productSeries.name}</a>
                                                <c:forEach var="productPropertySelect" items="${productSelected.productPropertySelects}">
                                                ${productPropertySelect.productProperty.propertyValues[productPropertySelect.selectIndex]}
                                                </c:forEach>
                                            </strong>
                                            <em>￥${productSelected.productSeries.commonPrice}</em>
                                            <a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                        <div class="text-right">
                            <p id="total-price">总计：￥<fmt:formatNumber value="${totalPrice}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></p>
                            <a href="shopping-cart.html" class="btn btn-default">查看购物车</a>
                            <a href="${path}/cart" class="btn btn-primary">结账付款</a>
                        </div>
                    </div>
                </div>
                <!-- END CART CONTENT -->
            </div>
            <!-- END CART -->
            <!-- BEGIN NAVIGATION -->
            <div class="collapse navbar-collapse mega-menu">
                <ul class="nav navbar-nav">

                    <li><a href="${path}">官网首页</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false"
                           data-target="#" href="#">
                            我的大坝
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <!-- BEGIN DROPDOWN MENU -->
                        <ul class="dropdown-menu">
                            <li><a href="order-form.html">我的订单</a></li>
                            <li><a href="order-form.html">待处理订单</a></li>
                            <li><a href="order-form.html">我的关注</a></li>
                            <li><a href="order-form.html">退货换货</a></li>
                        </ul>
                        <!-- END DROPDOWN MENU -->
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false"
                           data-target="#" href="#">
                            手机大坝
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <!-- BEGIN DROPDOWN MENU -->
                        <ul class="dropdown-menu">
                            <li><a href="#">手机用户首次下单买100送30</a></li>
                            <li class="divider"></li>
                            <li><a href="#">android客户端下载</a></li>
                            <li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>
                            <li class="divider"></li>
                            <li><a href="#">ios客户端下载客户端</a></li>
                            <li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>
                        </ul>
                        <!-- END DROPDOWN MENU -->
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false"
                           data-target="#" href="#">
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
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false"
                           data-target="#" href="#">
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

                                </div>
                            </li>
                        </ul>
                        <!-- END DROPDOWN MENU -->
                    </li>
                    <!-- BEGIN TOP SEARCH -->
                    <li class="menu-search">
                        <span class="sep"></span>
                        <i class="fa fa-search search-btn"></i>

                        <div class="search-box">
                            <form action="${path}/index/product/search" method="post">
                                <div class="input-group">
                                    <input type="text" placeholder="查找" class="form-control" name="keyWord">
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


<!-- END BEGIN STYLE CUSTOMIZER -->


<sitemesh:write property='body'/>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h2 class="modal-title" id="myModalLabel">
                        登录&nbsp;&nbsp;
                        <small style=" color:#187705;">支持以下登录方式登录</small>
                    </h2>
                    <br/>
                    <ul class="social-icons">
                        <li><a href="#" data-original-title="txqq" class="txqq" title="腾讯QQ"></a></li>
                        <li><a href="#" data-original-title="xlwb" class="xlwb" title="新浪微博"></a></li>
                        <li><a href="#" data-original-title="rrw" class="rrw" title="人人网"></a></li>
                        <li><a href="#" data-original-title="wx" class="wx" title="微信"></a></li>
                        <li><a href="#" data-original-title="zfb" class="zfb" title="支付宝"></a></li>
                        <li><a href="#" data-original-title="wy" class="wy" title="网易"></a></li>
                        <li><a href="#" data-original-title="txwb" class="txwb" title="腾讯微博"></a></li>
                    </ul>
                </div>
                <form id="loginForm" name="loginForm" class="form-horizontal form-without-legend" role="form">
                    <div class="modal-body">
                        <div class="row"><div class="col-lg-1"></div>
                            <div class="col-lg-10"><span id="error-msg" class="text-danger"></span></div>
                            <div class="col-lg-1"></div></div>

                        <fieldset>

                            <div class="form-group has-feedback">
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10 has-error">
                                        <input type="text" class="form-control" id="loginStr" name="loginStr" placeholder="邮箱/用户名/已验证手机"  required="true"/>
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-1"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10 has-error">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" required="true" ng-minlength="{{pw_min}}" />
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </div>
                                    <div class="col-lg-1"></div>
                                </div>
                            </div>
                        </fieldset>



                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-primary" id="login" style=" width:100%;">
                                登录
                            </button>
                            <ul class="automatically">
                                <li class="first">
                                    <input type="checkbox" value="true" class="common_chk" checked="checked"
                                           name="remember">自动登录
                                </li>
                                <li><a href="#">忘记密码</a></li>
                                <li style=" border-right:0;"><a href="#">免费注册</a></li>
                            </ul>
                        </div>
                    </div>
                </form>

            </div>
            <!-- /.modal-content -->

    </div>
    <!-- /.modal -->
    <!-- BEGIN fast view of a product -->

</div>
<footer>

    <!-- BEGIN STEPS -->
    <div class="steps3 steps3red">
        <div class="container">
            <div class="row">
                <div class="col-md-4 steps3-col">
                    <i class="fa fa-truck"></i>

                    <div>
                        <h2>品质保证</h2>
                        <em>我们只生产生态绿色食品</em>
                    </div>
                    <span>&nbsp;</span>
                </div>
                <div class="col-md-4 steps3-col">
                    <i class="fa fa-gift"></i>

                    <div>
                        <h2>商务合作</h2>
                        <em>我们的强大需要您的加入</em>
                    </div>
                    <span>&nbsp;</span>
                </div>
                <div class="col-md-4 steps3-col">
                    <i class="fa fa-phone"></i>

                    <div>
                        <h2>87654321</h2>
                        <em>24小时竭诚为您服务热线</em>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END STEPS -->

    <!-- BEGIN PRE-FOOTER -->
    <div class="pre-footer">
        <div class="container">
            <hr>
            <div class="row">
                <!-- BEGIN BOTTOM ABOUT BLOCK -->
                <div class="col-md-3 col-sm-6 pre-footer-col">
                    <h2>关于我们</h2>

                    <p>
                        长沙大坝生态农业科技有限公司组建于2013年，注册资本1000万元，现有固定员工180人。公司致力于现代生态高效农业产业化集群开发，着力打造全民创业、万众创新的平台，着力解决千家万户的"菜篮子"、"米袋子"、"果盘子"所需。</p>

                    <p>
                        公司拥有"一中心，二平台，三基地"。即特色农产品展示中心；特色农产品研发孵化平台，特色农产品信息交流平台；长沙大坝生态金棋现代农业示范基地，长沙大坝生态黄材水库有机野生鱼类养殖基地，长沙大坝生态干鱼加工基地。</p>
                </div>
                <!-- END BOTTOM ABOUT BLOCK -->
                <!-- BEGIN BOTTOM INFO BLOCK -->
                <div class="col-md-3 col-sm-6 pre-footer-col">
                    <h2>企业动态</h2>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-angle-right"></i> <a href="#">公司崇尚的文化</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">大坝精神</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">我们有一支优秀的团队</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">企业历史</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">打造特色农产品信息交流平台</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">人民出版社出版大坝书籍</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">中央电视访谈大坝团队成功经历</a></li>
                    </ul>
                </div>
                <!-- END INFO BLOCK -->
                <!-- BEGIN TWITTER BLOCK -->
                <div class="col-md-3 col-sm-6 pre-footer-col">
                    <h2>媒体报道</h2>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-angle-right"></i> <a href="#">大坝生态农业在美国上市</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">挺近世界500强的艰辛历程</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">成为国内首支团队完整的电商企业</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">荣获优秀企业称号</a></li>
                        <li><i class="fa fa-angle-right"></i> <a href="#">公司年营业额占据福布斯榜首</a></li>
                    </ul>
                </div>
                <!-- END TWITTER BLOCK -->
                <!-- BEGIN BOTTOM CONTACTS -->
                <div class="col-md-3 col-sm-6 pre-footer-col">
                    <h2>联系我们</h2>
                    <address class="margin-bottom-40">
                        联系电话：0731-87654321<br>
                        企业QQ：88888888<br>
                        公司微信：weixin_daba<br>
                        电子邮件: <a href="mailto:info@metronic.com">info@metronic.com</a><br>
                    </address>
                </div>
                <!-- END BOTTOM CONTACTS -->
            </div>
            <hr>


        </div>
    </div>


    <!-- END PRE-FOOTER -->

    <!-- BEGIN FOOTER -->
    <div class="footer padding-top-15">
        <div class="container">
            <div class="row">
                <!-- BEGIN COPYRIGHT -->
                <div class="col-md-6 col-sm-6 padding-top-10">
                    www.daba.com2015&copy; 湘ICP备88888888号-8
                </div>
                <!-- END COPYRIGHT -->
                <!-- BEGIN PAYMENTS -->
                <div class="col-md-6 col-sm-6">
                    <ul class="list-unstyled list-inline pull-right margin-bottom-15">
                        <li><img src="${path}/statics/assets/img/payments/american-express.jpg"
                                 alt="We accept American Express" title="We accept American Express"></li>
                        <li><img src="${path}/statics/assets/img/payments/MasterCard.jpg" alt="We accept MasterCard"
                                 title="We accept MasterCard"></li>
                        <li><img src="${path}/statics/assets/img/payments/PayPal.jpg" alt="We accept PayPal"
                                 title="We accept PayPal"></li>
                        <li><img src="${path}/statics/assets/img/payments/visa.jpg" alt="We accept Visa"
                                 title="We accept Visa"></li>
                    </ul>
                </div>
                <!-- END PAYMENTS -->
            </div>
        </div>
    </div>
    <!-- END FOOTER -->

</footer>

</body>

<script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>

<script type="text/javascript" src="${path}/statics/assets/scripts/top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>
</html>