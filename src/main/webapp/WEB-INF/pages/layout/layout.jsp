<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html data-description="from decorator">
<head data-description="from decorator">
    <tiles:insertAttribute name="meta" />
    <title></title>
    <tiles:insertAttribute name="topCss"/>
    <tiles:insertAttribute name="pageTopCss"/>
    <tiles:insertAttribute name="topScript" />
    <tiles:insertAttribute name="pageTopScript" />
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
                                                <c:forEach var="productPropertyValue" items="${productSelected.productPropertyValueList}">
                                                ${productPropertyValue.value}
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
<tiles:insertAttribute name="body" />
<footer>
    <tiles:insertAttribute name="footer"/>
</footer>
</body>
    <tiles:insertAttribute name="bottomScript" />
    <tiles:insertAttribute name="pageBottomScript" />
</html>