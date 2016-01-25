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
    <base href="<%=request.getContextPath() %>"/>
    <tiles:insertAttribute name="meta" />
    <title>大坝生态农业(测试)</title>
    <tiles:insertAttribute name="topCss"/>
    <tiles:insertAttribute name="pageTopCss"/>
    <script>uri='${uri}'</script>
    <tiles:insertAttribute name="topScript" />
    <tiles:insertAttribute name="pageTopScript" />

</head>
<body  ng-controller="mainController">
        <div class="topscoll" >
            <div class="pre-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 additional-nav">

                            <ul class="list-unstyled list-inline pull-right" style=" float:left !important;" id="commonLogin" >
                                <c:choose>
                                    <c:when test="${empty sessionScope.loginUser}">
                                        <li><a href="${path}/user/register_phone" target="_blank">注册</a></li>
                                        <li><a data-href="${uri}" href="javascript:void(0)" id="toLogin">登录</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>欢迎您,<a href="${path}/user/personal_message" target="_blank">${sessionScope.loginUser.name}</a>!</li>
                                        <li><a href="#" id="logout">退出</a></li>
                                    </c:otherwise>
                                </c:choose>




                            </ul>
                            <%--<ul class="list-unstyled list-inline pull-right" style=" float:left !important;" id="thirdPartLogin">--%>
                                <%--<li>其它账号登录</li>--%>
                                <%--<li><span id="qqLoginBtn"></span></li>--%>
                            <%--</ul>--%>
                            <ul class="list-unstyled list-inline pull-right" style=" float:left !important;" >
                                <li class="fa fa-warning color-red">这是一个测试版本，所有数据将在正式上线后清除。</li>
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
                        <a href="${path}" class="navbar-brand">
                            <img src="${path}/statics/assets/img/logo_red.png" alt="大坝生态农业">
                        </a>
                    </div>
                    <!-- BEGIN CART -->

                    <div class="cart-block" id="cart-block">
                        <a href="#"><i class="fa fa-shopping-cart"></i></a>
                        <!-- BEGIN CART CONTENT -->
                        <div class="cart-content-wrapper">
                            <div class="cart-content">
                                <ul class="scroller" style="height:250px;" id="cart_list">
                                    <li ng-if="!cart||!cart.productSelectedList||!cart.productSelectedList.length">您的购物车中还没有商品</li>
                                    <li ng-class="{'text-left':true,'bg-success':$index%2==0}" ng-repeat="productSelected in cart.productSelectedList"   data-selected-index="{{$index}}">
                                        <img ng-if="productSelected.productSeries.pictures" ng-src="${path}/{{productSelected.productSeries.pictures[0].picture}}" width="37" height="34">
                                        <img ng-if="!productSelected.productSeries.pictures" ng-src="${path}/statics/img/img_not_found.jpg" width="37" height="34">
                                        <a ng-href="${path}/product_series/{{productSelected.productSeries.id}}"> {{productSelected.productSeries.name}}</a>
                                        <i class="fa fa-times"> {{productSelected.amount}}</i>
                                        <i ng-repeat="productPropertyValue in productSelected.productPropertyValueList"> {{productPropertyValue.value}}</i>
                                        <i class="fa fa-rmb text-danger">
                                            {{productSelected.productSeries.commonPrice*productSelected.amount|number:2}}
                                        </i>
                                        <a href="javascript:void(0);" class="del-goods" data-ng-click="deleteGoods($index)"><i class="fa fa-trash"></i></a>
                                    </li>

                                </ul>
                                <div class="text-right">
                                    总计：<i class="fa fa-rmb text-danger">{{totalPrice | number:2}}</i>
                                    <a data-href="${path}/cart" class="btn btn-primary fa fa-credit-card login-need"> 结账付款</a>
                                </div>
                            </div>
                            <div id="msg" style="display:none;margin-right: 35px;">已成功加入购物车！</div>
                        </div>
                        <!-- END CART CONTENT -->
                    </div>

                    <!-- END CART -->
                    <!-- BEGIN NAVIGATION -->
                    <div class="collapse navbar-collapse margin-left-20">
                        <ul class="nav navbar-nav">

                            <li><a href="${path}/index"><i class="fa fa-home"></i>首页</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                                    我的大坝
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <!-- BEGIN DROPDOWN MENU -->
                                <ul class="dropdown-menu">
                                    <li><a data-href="${path}/order/my_orders" class="login-need" href="javascript:void(0)"><i class="fa fa-list"></i>我的订单</a></li>
                                    <%--<li><a data-href="order-form.html" class="login-need" href="javascript:void(0)">待处理订单</a></li>--%>
                                    <li><a data-href="${path}/my_interests" class="login-need" href="javascript:void(0)"><i class="fa fa-heart"></i>我的关注</a></li>
                                    <li><a data-href="${path}/my_notifies" class="login-need" href="javascript:void(0)"><i class="fa fa-envelope"></i>我的消息</a></li>
                                    <c:if test="${not empty sessionScope.loginUser}">
                                        <li><a href="${path}/user/personal_message" target="_blank"><i class="fa fa-user"></i>个人信息</a></li>
                                    </c:if>
                                    <li><a data-href="${path}/return_exchange_notify" class="login-need" href="javascript:void(0)"><i class="fa fa-reply"></i>退货换货</a></li>
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
                                    <li><a href="${path}/download_cer">下载根证书</a></li>
                                    <li><a href="${path}/suggest">使用建议</a></li>
                                </ul>
                                <!-- END DROPDOWN MENU -->
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#" ng-mouseover="initProductMenu()">
                                    产品地图<i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="mega-menu">
                                    <li>
                                        <div class="nav-content">
                                            <div class="nav-content-col" ng-if="productCategories&&productCategories.length>0" ng-repeat="productCategory in productCategories">
                                                <h3>{{productCategory.categoryName}}</h3>
                                                <ul>
                                                    <li ng-repeat="productSubCategory in productCategory.productSubCategories"><a href="${path}/product_series/sort/{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</a></li>
                                                </ul>
                                            </div>
                                            <div class="nav-content-col" ng-if="!productCategories||!productCategories.length">
                                                <h3>还没有产品上架</h3>
                                                <ul>
                                                    <li></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- BEGIN TOP SEARCH -->
                            <li class="dropdown">
                                <%--<span class="sep"></span>--%>

                                    <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="#" href="#">
                                        <i class="fa fa-search search-btn"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <form action="${path}/index/product/search" method="post">
                                                <div class="input-group">
                                                    <input type="text" placeholder="找产品" class="form-control" required="true" name="keyWord">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-primary" type="submit">查找</button>
                                                    </span>
                                                </div>
                                            </form>
                                        </li>
                                    </ul>
                            </li>
                            <li ng-if="unreadNotifiesCount &&unreadNotifiesCount>0"><a href="${path}/my_notifies"><small style="color: red;font-size: 13px;" class="fa fa-envelope-o">({{unreadNotifiesCount}})</small></a></li>
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

        <div class="modal fade active" id="showProductModal" tabindex="-1" role="dialog" aria-labelledby="showProductModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                            <div class="row">
                                <div class="modal-title col-sm-3 col-lg-3" ><h3>{{productSelected.productSeries.name}}</h3></div>
                                <div class="center-block col-sm-5 col-lg-5">
                                    <h3><div class="center-block" star rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="true"></div></h3>
                                </div>
                            </div>


                    </div>
                    <form name="popForm" class="bg-success">
                        <div class="row padding-top-10">
                            <div class="col-lg-2 col-sm-2"></div>
                            <div class="col-lg-8 col-sm-8">
                                <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                                    <a ng-href="${path}/{{productSelected.productSeries.pictures[0].bigPicture}}">
                                        <img ng-src="${path}/{{productSelected.productSeries.pictures[0].picture}}" alt="" width="320" height="180"/>
                                    </a>
                                </div>
                                <ul class="thumbnails easyzoom-thumbnails">
                                    <li ng-repeat="picture in productSelected.productSeries.pictures">
                                        <a ng-href="${path}/{{picture.bigPicture}}" data-standard="${path}/{{picture.picture}}">
                                            <img ng-src="${path}/{{picture.picture}}" alt="" class="img-ico-md" />
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                                <div class="row">
                                    <div class="col-lg-3 col-sm-3">
                                        <h4> <i class="fa fa-rmb"></i>{{productSelected.productSeries.commonPrice}}
                                        <em ng-if="productSelected.productSeries.currentPrice &&productSelected.productSeries.currentPrice.prevPrice &&lowPrice()">
                                            <del><i class="fa fa-rmb"></i>{{productSelected.productSeries.currentPrice.prevPrice.price}}</del>
                                        </em>
                                            /{{productSelected.productSeries.measurementUnit}}
                                        </h4>
                                    </div>
                                <div class="col-lg-3 col-sm-3"><h4>库存<i class="fa fa-cubes"></i>{{productSelected.productSeries.productStore.remain}}</h4></div>
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12"><i>{{productSelected.productSeries.description}}</i></div>
                                </div>
                                <div class="row padding-top-10" ng-if="productSelected.productSeries.productProperties&&productSelected.productSeries.productProperties.length>0">
                                    <div class="col-lg-2 col-sm-2"><h5>选择商品</h5></div>
                                    <div class="col-lg-3 col-sm-3 input-group" ng-repeat="productProperty in productSelected.productSeries.productProperties">
                                        <span class="input-group-btn"><button class="btn btn-primary disabled">{{productProperty.propertyName}}</button></span>
                                        <select ng-model="$parent.productSelected.productPropertyValueList[$index]"
                                             required="true" class="form-control"
                                             ng-options="productPropertyValue.value for productPropertyValue in productProperty.propertyValues">
                                        </select>
                                    </div>
                                </div>
                                <div class="row padding-top-10">
                                    <div class="col-lg-2 col-sm-2"><h5>输入数量</h5></div>
                                    <div class="col-lg-4 col-sm-4">
                                        <input type="number" min="1" class="form-control" ng-model="productSelected.amount"/></div>
                                    </div>
                                </div>
                                <div class="row padding-bottom-20">
                                    <div class="col-lg-2 col-sm-2 col-lg-push-8 col-sm-push-8">
                                        <button class="btn btn-primary add2cart pull-right fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button>
                                    </div>
                                    <div class="col-lg-1 col-sm-1 col-lg-push-8 col-sm-push-8">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                                    </div>
                                </div>


                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade active" id="showErrorModal" tabindex="-1" role="dialog" aria-labelledby="showErrorModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <div class="modal-title" >抱歉，我们出了点错</div>
                    </div>
                    <div id="error-area"></div>
                </div>
            </div>
        </div>
        <div class="modal fade active" id="qqLoginModal" tabindex="-1" role="dialog" aria-labelledby="qqLoginModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <div class="row">
                            <div class="modal-title col-sm-8 col-lg-8" ><h3>欢迎使用QQ登录</h3></div>
                        </div>
                    </div>
                    <form name="qqForm" class="bg-success">
                        <div class="row padding-top-10">
                            <div class="col-lg-2 col-sm-2">
                                <label class="control-label margin-top-10"> QQ账号</label>
                            </div>
                            <div class="col-lg-8 col-sm-8">
                                <input type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="row padding-top-10">
                            <div class="col-lg-2 col-sm-2">

                            </div>
                            <div class="col-lg-8 col-sm-8">

                            </div>
                        </div>
                        <div class="row padding-bottom-20">
                            <div class="col-lg-2 col-sm-2 col-lg-push-8 col-sm-push-8">
                                <button class="btn btn-primary add2cart pull-right fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button>
                            </div>
                            <div class="col-lg-1 col-sm-1 col-lg-push-8 col-sm-push-8">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                            </div>
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