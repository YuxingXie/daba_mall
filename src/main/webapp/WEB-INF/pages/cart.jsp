<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<head>
    <meta charset="utf-8">
    <title>购物车</title>

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

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
          type="text/css">
    <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <%--<link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <!-- for slider-range -->
    <link href="${path}/statics/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
    <link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${path}/statics/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">购物车</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h1>全部商品<c:if
                                test="${not empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">
                            <li>您的购物车中有商品${fn:length(sessionScope.cart.productSelectedList)}</li>
                        </c:if></h1>
                    </div>

                </div>
            </div>
            <div class="row list-view-sorting clearfix">
                <div class="shopping-cart-page">
                    <div class="shopping-cart-data clearfix">
                        <div class="table-wrapper-responsive" ng-app="cartApp" ng-init="name=john">
                            <table summary="Shopping cart" data-ng-controller="CartController">
                                <tr>
                                    <th class="shopping-cart-image"></th>
                                    <th class="shopping-cart-description">商品信息</th>
                                    <th class="shopping-cart-price">商品单价</th>
                                    <th class="shopping-cart-ref-no">商品数量</th>
                                    <th class="shopping-cart-price">商品金额</th>
                                    <th class="shopping-cart-total">交易操作</th>
                                </tr>
                                <c:choose>
                                    <c:when test="${empty sessionScope.cart ||empty sessionScope.cart.productSelectedList}">
                                        <tr>
                                            <td colspan="5">您的购物车中还没有商品</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="totalPrice" value="0"/>

                                        <c:forEach var="productSelected"
                                                   items="${sessionScope.cart.productSelectedList}"
                                                   varStatus="selectedIndex">
                                            <c:set var="totalPrice"
                                                   value="${totalPrice+productSelected.amount*productSelected.productSeries.commonPrice}"/>
                                            <tr>
                                                <td class="shopping-cart-image">
                                                    <a href="${path}/product/${productSelected.productSeriesId}"><img
                                                            src="${path}/${productSelected.productSeries.pictures[0]}"></a>
                                                </td>
                                                <td class="shopping-cart-description">
                                                    <h3>${productSelected.productSeries.name}</h3>
                                                    <c:forEach var="productPropertySelect"
                                                               items="${productSelected.productPropertySelects}">
                                                        ${productPropertySelect.productProperty.propertyValues[productPropertySelect.selectIndex]}
                                                    </c:forEach>
                                                </td>
                                                <td class="shopping-cart-price">
                                                    <span>￥<fmt:formatNumber
                                                            value="${productSelected.productSeries.commonPrice}"
                                                            pattern="##.##"
                                                            minFractionDigits="2"></fmt:formatNumber></span>
                                                </td>
                                                <td class="shopping-cart-quantity">
                                                    <span style=" font-size:14px;">
                                                        <input type="number" name="amount"
                                                               ng-model="amount_${selectedIndex.index}" min="1"
                                                               ng-init="amount_${selectedIndex.index}=${productSelected.amount}"/>
                                                    </span>
                                                </td>
                                                <td class="shopping-cart-price">
                                                    <span>￥{{amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice} | number:2}}</span>
                                                </td>
                                                <td class="shopping-cart-total">
                                                    <p><a href="${path}/cart/remove/${selectedIndex.index}">删除</a></p>

                                                    <p>移到我的关注</p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="4">
                                                总计：{{<c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">amount_${selectedIndex.index}+</c:forEach>0}}件商品,共
                                                {{<c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">amount_${selectedIndex.index}*${productSelected.productSeries.commonPrice}+</c:forEach>0 | number:2}}元
                                            </td>
                                            <td><button type="submit" class="btn btn-primary col-lg-8" ng-disabled="signupForm.$invalid">去结算</button></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

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

<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script>
<!-- pop up -->
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
<!-- slider for products -->
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>
<!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"
        type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js"
        type="text/javascript"></script>

<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>
<script>
    angular.module("cartApp", []).controller("CartController", ["$scope", function ($scope) {
        $scope.totalAmount=0;
        console.log($scope.nmb);
        <c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">
            <%--$scope.totalAmount+=$scope.amount_${selectedIndex.index};--%>
            console.log($scope.amount_${selectedIndex.index});
        </c:forEach>
//        console.log($scope.totalAmount);
        <c:forEach var="productSelected" items="${sessionScope.cart.productSelectedList}" varStatus="selectedIndex">
        $scope.$watch('amount_${selectedIndex.index}', function (newVal, oldVal, scope) {
                    if (newVal !== oldVal){
                        $scope.amount_${selectedIndex.index} = newVal;
                        $scope.totalAmount=newVal;
                    }
//                    console.log("new value:"+newVal)
//                    console.log("totalAmount:"+$scope.totalAmount)

                }
        );
        </c:forEach>
    }])
</script>
</body>
