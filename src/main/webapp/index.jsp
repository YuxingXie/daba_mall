<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <link rel="stylesheet" href="${path}/statics/assets/css/main-menu.css">
</head>
<body>
<div id="carousel-example-generic" class="carousel slide col-xs-12" data-ride="carousel" data-interval="2000">
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <a href="#"><img alt="First slide" src="${path}/img/zhonghuaxun.jpg" width="300px"></a>

            <div class="carousel-caption"><h3>中华鲟</h3></div>
            <p class="text-center text-danger">名贵的中华鲟再也不用花高价了</p>
        </div>
        <div class="item">
            <a href="#"><img alt="Second slide" src="${path}/img/dabaxiaohaoqiaozuiganyu.jpg" width="300px"></a>
        </div>
        <div class="item">
            <a href="#"><img alt="Third slide" src="${path}/img/tuhuazhularoushicai.jpg" width="300px"></a>
        </div>
    </div>
    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-4"><img width="70%" class="img-responsive" src="${path}/img/dabast1.jpg"></div>
        <div class="col-xs-8">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="干鱼">
                </div>
                <button type="submit" class="btn btn-default btn-primary">搜索</button>
            </form>
        </div>
    </div>
    <div class="row">

    </div>
</div>

<div class="container">
    <div id="wrapper">
        <div class="km-box text-center">
            <div class="header">
                <h3>所有商品分类</h3>
            </div>
            <div class="inner">
                <ul id="sidebar">
                    <li class="active">
                        <span>熏腊制品</span>
                        <ul>
                            <li data-deeplink="overview" class="active">腊鱼</li>
                            <li data-deeplink="features">腊肉</li>
                            <li data-deeplink="third-party">咸鱼</li>
                        </ul>
                    </li>
                    <li>
                        <span>鲜活水产</span>
                        <ul>
                            <li data-deeplink="slider-resources">水鱼</li>
                            <li data-deeplink="slider-element">虾蟹</li>
                            <li data-deeplink="slider-initializing">鲜肉</li>
                        </ul>
                    </li>

                </ul>

                <div id="content">
                    <section class="active">
                        <article class="active"><a href="#"> 腊鱼</a></article>
                        <article>腊肉</article>
                        <article>咸鱼</article>
                    </section>
                    <section>
                        <article>1</article>
                        <article>2</article>
                        <article>3</article>
                    </section>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-xs-12 bg-info">为您推荐</div>
    </div>
    <div class="row">
        <div class="col-xs-3 text-center text-danger">
            <a href="#" class="text-danger"><img class="img-responsive img-rounded" src="${path}/img/zhonghuaxun.jpg">中华鲟新鲜制作袋装</a>

            <div><strong><cite>$100</cite></strong></div>
        </div>
        <div class="col-xs-3 "><img class="img-responsive img-rounded" src="${path}/img/tuhuazhularoushicai.jpg"></div>
        <div class="col-xs-3 "><img class="img-responsive img-rounded" src="${path}/img/dabaxiaohaoqiaozuiganyu.jpg">
        </div>
        <div class="col-xs-3 "><img class="img-responsive img-rounded" src="${path}/img/zhonghuaxun.jpg"></div>

    </div>
</div>
<script src="${path}/statics/plugins/jquery-main-menu.js"></script>
<script src="${path}/statics/assets/scripts/main-menu.js"></script>
<script src="${path}/statics/assets/scripts/shCore.js" type="text/javascript"></script>
</body>
</html>
