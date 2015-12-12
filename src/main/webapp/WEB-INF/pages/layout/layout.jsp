<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html ng-app="mainApp">
<head>
    <tiles:insertAttribute name="meta" />
    <title>大坝生态农业</title>
    <tiles:insertAttribute name="topCss"/>
    <tiles:insertAttribute name="pageTopCss"/>
    <tiles:insertAttribute name="topScript" />
    <tiles:insertAttribute name="pageTopScript" />
</head>
<body  ng-controller="mainController">
        <div class="topscoll">
            <div class="pre-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 additional-nav">
                            <ul class="list-unstyled list-inline pull-right" style=" float:left !important;">
                                <c:choose>
                                    <c:when test="${empty sessionScope.loginUser}">
                                        <li><a href="${path}/register_phone">注册</a></li>
                                        <li><a href="javascript:void(0)" data-toggle="modal" data-target="#myModal">登录</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>欢迎您,<a href="${path}/personal_message">${sessionScope.loginUser.name}</a>!</li>
                                        </li><li><a href="#" id="logout">退出</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <%--<li><a href="checkout.html">结账</a></li>--%>
                                <%--<li><a href="${path}/my_account">我的账户</a></li>--%>
                                <%--<li><a href="#">我的收藏</a></li>--%>
                            </ul>
                        </div>
                        <%--<div class="col-md-6 col-sm-6 additional-shop-info">--%>
                            <%--<ul class="list-unstyled list-inline" style=" float:right !important;">--%>
                                <%--<li><i class="fa fa-phone"></i><span>87654321</span></li>--%>
                                <%--<li class="langs-block">--%>
                                    <%--<a href="javascript:void(0);" class="current">中文 <i class="fa fa-angle-down"></i></a>--%>
                                    <%--<div class="langs-block-others-wrapper">--%>
                                        <%--<div class="langs-block-others">--%>
                                            <%--<a href="javascript:void(0);">英语</a>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    </div>
            </div>

            <!-- BEGIN HEADER -->
            <div role="navigation" class="navbar header no-margin" >
                <div>
                    <div class="navbar-header">
                        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- END RESPONSIVE MENU TOGGLER -->
                        <a href="${path}" class="navbar-brand"><img src="${path}/statics/assets/img/logo_red.png"
                                                                       alt="大坝生态农业"></a><!-- LOGO -->
                    </div>
                    <!-- BEGIN CART -->

                    <div class="cart-block" id="cart-block">
                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                        <!-- BEGIN CART CONTENT -->
                        <div class="cart-content-wrapper">
                            <div class="cart-content">
                                <ul class="scroller" style="height:250px;" id="cart_list" ng-init="totalPrice=0">
                                    <li ng-show="!cart||!cart.productSelectedList||!cart.productSelectedList.length">您的购物车中还没有商品</li>
                                    <li ng-class="{'text-left':true,'bg-success':$index%2==0}" ng-repeat="productSelected in cart.productSelectedList"   data-selected-index="{{$index}}">
                                        <img ng-src="${path}/{{productSelected.productSeries.pictures[0]}}" width="37" height="34">
                                        <i class="fa fa-times"> {{productSelected.amount}}</i>
                                        <a ng-href="${path}/product_series/{{productSelected.productSeries.id}}"> {{productSelected.productSeries.name}}</a>
                                        <i ng-repeat="productPropertyValue in productSelected.productPropertyValueList"> {{productPropertyValue.value}}</i>
                                        <i class="fa fa-rmb text-danger" ng-init="$parent.totalPrice=$parent.totalPrice+(productSelected.productSeries.commonPrice*productSelected.amount)">
                                            {{productSelected.productSeries.commonPrice*productSelected.amount|number:2}}
                                        </i>
                                        <a href="javascript:void(0);" class="del-goods" data-ng-click="deleteGoods($index)"><i class="fa fa-trash"></i></a>
                                    </li>

                                </ul>
                                <div class="text-right">
                                    总计：<i class="fa fa-rmb text-danger">{{totalPrice | number:2}}</i>
                                    <a href="${path}/cart" class="btn btn-primary fa fa-credit-card"> 结账付款</a>
                                </div>
                            </div>
                        </div>
                        <!-- END CART CONTENT -->
                    </div>
                    <!-- END CART -->
                    <!-- BEGIN NAVIGATION -->
                    <div class="collapse navbar-collapse margin-left-20">
                        <ul class="nav navbar-nav">

                            <li><a href="${path}"><i class="fa fa-home"></i>首页</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                                    我的大坝
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <!-- BEGIN DROPDOWN MENU -->
                                <ul class="dropdown-menu">
                                    <li><a data-href="${path}/user/my_orders" class="login-need" href="javascript:void(0)"><i class="fa fa-list"></i>我的订单</a></li>
                                    <%--<li><a data-href="order-form.html" class="login-need" href="javascript:void(0)">待处理订单</a></li>--%>
                                    <li><a data-href="${path}/my_interests" class="login-need" href="javascript:void(0)"><i class="fa fa-heart"></i>我的关注</a></li>
                                    <li><a data-href="${path}/user/personal_message" class="login-need" href="javascript:void(0)"><i class="fa fa-user"></i>个人信息</a></li>
                                    <li><a data-href="order-form.html" class="login-need" href="javascript:void(0)"><i class="fa fa-reply"></i>退货换货</a></li>
                                </ul>
                                <!-- END DROPDOWN MENU -->
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                                    手机大坝<i class="fa fa-angle-down"></i>
                                </a>
                                <!-- BEGIN DROPDOWN MENU -->
                                <ul class="dropdown-menu">
                                    <li><a href="#">我们的网站在移动终端</a></li>
                                    <li><a href="#">浏览器中有优异的表现</a></li>
                                    <li><a href="#">您可以直接用手机浏览</a></li>
                                    <li><a href="#">我们正在开通微信公众号</a></li>
                                    <li><a href="#">并努力开发手机应用</a></li>
                                    <li><a href="#">让您有多种方式与我们互动</a></li>
                                    <%--<li class="divider"></li>--%>
                                    <%--<li><a href="#">android客户端下载</a></li>--%>
                                    <%--<li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>--%>
                                    <%--<li class="divider"></li>--%>
                                    <%--<li><a href="#">ios客户端下载客户端</a></li>--%>
                                    <%--<li><a href="#"><img src="${path}/statics/images/tuo_ma.png" class="tuo_ma"></a></li>--%>
                                </ul>
                                <!-- END DROPDOWN MENU -->
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                                    客服服务<i class="fa fa-angle-down"></i>
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
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#" ng-mouseover="initProductMenu()">
                                    产品地图<i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu glyphicon-resize-full" aria-labelledby="mega-menu">
                                    <li>
                                        <div class="nav-content">
                                            <div class="nav-content-col" ng-repeat="productCategory in productCategories">
                                                <h3>{{productCategory.categoryName}}</h3>
                                                <ul>
                                                    <li ng-repeat="productSubCategory in productCategory.productSubCategories"><a href="${path}/product_series/sort/{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- BEGIN TOP SEARCH -->
                            <li class="menu-search dropdown">
                                <%--<span class="sep"></span>--%>
                                <i class="fa fa-search search-btn"></i>
                                <div class="search-box dropdown-menu">
                                    <form action="${path}/index/product/search" method="post">
                                        <div class="input-group">
                                            <input type="text" placeholder="查找" class="form-control" required="true" name="keyWord">
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

        <tiles:insertAttribute name="body" />
        <div class="modal fade active" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                            <input type="hidden" name="mergeCart" id="mergeCart"/>
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
                                    <li style=" border-right:0;"><a href="${path}/user/register_phone">免费注册</a></li>
                                </ul>
                            </div>
                        </div>
                    </form>

                </div>
                <!-- /.modal-content -->

            </div>
        </div>
        <div class="modal fade active" id="showProductModal" tabindex="-1" role="dialog" aria-labelledby="showProductModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <table>
                            <tr>
                                <th class="modal-title" >{{productSelected.productSeries.name}}</th>
                                <th class="center-block">
                                    <div class="center-block" star rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="true"></div>
                                </th>
                            </tr>
                        </table>

                    </div>
                    <form name="popForm" class="bg-success">
                        <div class="row">
                            <div class="easyzoom easyzoom--overlay" style="margin-left: 10px;margin-right: 1px;">
                                <a ng-href="${path}/statics/img/product/5649c4116f70e517dce0b22c.JPG">
                                    <img ng-src="${path}/{{currentImg}}"/>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-sm-3" ng-repeat="picture in productSelected.productSeries.pictures">
                                <div class="thumbnail img-ico-lg">
                                    <a href="javascript:void(0)" data-ng-click="changeImg(picture)"><img class="img-responsive" ng-src="${path}/{{picture}}"></a>
                                </div>
                            </div>
                        </div>
                        <div class="row table-responsive">
                            <table class="table table-condensed">
                                <th>价格<i class="fa fa-rmb"></i></th>
                                <td class="text-left">{{productSelected.productSeries.commonPrice}}
                                    <em ng-if="productSelected.productSeries.currentPrice &&productSelected.productSeries.currentPrice.prevPrice && productSelected.productSeries.currentPrice<productSelected.productSeries.currentPrice.prevPrice">
                                        <i class="fa fa-rmb"></i>{{productSelected.productSeries.currentPrice.prevPrice.price}}
                                    </em>
                                </td>
                                <th>库存<i class="fa fa-cubes"></i></th>
                                <td class="text-left">{{productSelected.productSeries.productStore.remain}}</td>
                                </tr>
                                <tr>
                                    <td colspan="4"><i>{{productSelected.productSeries.description}}</i></td>
                                </tr>
                                <tr>
                                    <th>选择商品<i class="fa fa-flag"></i></th>
                                    <th colspan="3">
                                        <span ng-repeat="productProperty in productSelected.productSeries.productProperties">
                                        <i class="fa fa-spin fa-sun-o"></i>{{productProperty.propertyName}}:
                                        <select  ng-model="$parent.productSelected.productPropertyValueList[$index]"
                                                 required="true"
                                                 ng-options="productPropertyValue.value for productPropertyValue in productProperty.propertyValues"></select>

                                        </span>

                                    </th>
                                </tr>
                                <tr>
                                    <th>输入数量<i class="fa fa-cube"></i></th>
                                    <td><input type="number" min="1" class="" ng-model="productSelected.amount" style="max-width: 100px;"></td>
                                    <td> <button data-toggle="tooltip" data-original-title="xxx" data-placement="left" data-trigger="click" data-selector="#cart-block"
                                                 class="btn btn-primary add2cart pull-right fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button></td>
                                    <td>

                                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer>
        <tiles:insertAttribute name="footer"/>
    </footer>
</body>
    <tiles:insertAttribute name="bottomScript" />
    <tiles:insertAttribute name="pageBottomScript" />
</html>