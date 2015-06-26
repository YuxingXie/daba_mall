<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> 大坝生态农业</title>
    <link href="${path}/statics/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>
    <link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/statics/assets/css/style-metronic-rtl.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/statics/assets/css/style-rtl.css" rel="stylesheet" type="text/css"/>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
    <![endif]-->

    <sitemesh:write property='head'/>

</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

                <li><a href="#">欢迎您!</a></li>
                <li><a href="#">登录</a></li>
                <li><a href="#contact">我的订单</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的大坝 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">购物</li>
                        <li><a href="#">待处理订单</a></li>
                        <li><a href="#">我的关注</a></li>
                        <li><a href="#">退货换货</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">消息</li>
                        <li><a href="#">系统消息</a></li>
                        <li><a href="#">咨询回复</a></li>
                    </ul>
                </li>
                <li><a href="#">企业会员</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">手机大坝 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>手机用户首次下单买100送30</li>
                        <li class="dropdown-header">android客户端下载</li>
                        <li><a href="#"><img src="${path}/img/ewm.png"/></a></li>
                        <li class="dropdown-header">ios客户端下载</li>
                        <li><a href="#"><img src="${path}/img/ewm.png"/></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">关注我们 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">大坝微信</a></li>
                        <li><a href="#">大坝微博</a></li>
                        <li><a href="#">大坝QQ</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">客户服务<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">帮助中心</a></li>
                        <li><a href="#">售后服务</a></li>
                        <li><a href="#">在线客服</a></li>
                        <li><a href="#">意见建议</a></li>
                        <li><a href="#">客服邮箱</a></li>
                    </ul>
                </li>
            </ul>

        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<%--<sitemesh:write property='title'/><br/>--%>
<nav class="navbar navbar-default navbar-fixed-bottom">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header sr-only">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bottom_nav">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Brand</a>
    </div>
    <div class="collapse navbar-collapse" id="bottom_nav">
        <ul class="nav navbar-nav">

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-expanded="false">购物车<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">商品1</a><a href="#">商品2</a><a href="#">商品3</a><a href="#">商品4</a></li>

                </ul>
            </li>

        </ul>

    </div>
    <!-- /.navbar-collapse -->
</nav>
<!-- BEGIN STYLE CUSTOMIZER -->
<div class="color-panel bg-cart-panel">
    <div class="color-mode-icons icon-color"></div>
    <div class="color-mode-icons icon-color-close"></div>
    <div class="color-mode text-center text-info">
        <small>购物车</small>
        <div class="row">
            <div class="col-xs-2"><img src="${path}/img/ss.jpg"></div>
            <div class="col-xs-7">宁乡花猪肉1000g装 100元*5 </div>
            <div class="col-xs-3"> <a href="#">删除</a></div>
        </div>
        <div class="row">
            <div class="col-xs-2"><img src="${path}/img/ss.jpg"></div>
            <div class="col-xs-7">大鲍鱼 100元 </div>
            <div class="col-xs-3"> <a href="#">删除</a></div>
        </div>
        <div class="row">
            <div class="col-xs-2"><img src="${path}/img/ss.jpg"></div>
            <div class="col-xs-7">大鲍鱼新鲜当日打捞*5 100元 </div>
            <div class="col-xs-3"> <a href="#">删除</a></div>
        </div>
        <div class="row">
            <div class="col-xs-2"><img src="${path}/img/ss.jpg"></div>
            <div class="col-xs-7">大头鱼新鲜当日打捞*5 100元 </div>
            <div class="col-xs-3"> <a href="#">删除</a></div>
        </div>
    </div>
</div>

<!-- END BEGIN STYLE CUSTOMIZER -->
<sitemesh:write property='body'/>
<footer>
    <div class="col-xs-12"><img src="${path}/img/services_u.png" class="img-responsive"></div>
    <div class="col-xs-12"><img src="${path}/img/service_u2.png" class="img-responsive"></div>
    <div class="col-xs-12"><img src="${path}/img/bottom_page.png" class="img-responsive"></div>
</footer>
<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${path}/statics/plugins/jquery-1.11.3.min.js"></script>
<script src="${path}/statics/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
<script src="${path}/statics/plugins/bootstrap-3.3.0/js/transition.js"></script>
<script src="${path}/statics/plugins/bootstrap-3.3.0/js/tooltip.js"></script>
<script src="${path}/statics/plugins/bootstrap-3.3.0/js/popover.js"></script>
<script src="${path}/statics/plugins/bootstrap-3.3.0/js/carousel.js"></script>
<script src="${path}/statics/assets/scripts/app.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        App.init();
    });
</script>
</body>
</html>