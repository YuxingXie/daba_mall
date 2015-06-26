<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
  <%--<meta charset="utf-8">--%>
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>大坝生态农业</title>
  <!-- BootStrap -->
  <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>
  <link href="${path}/plugins/bootstrap-3.3.0/less/modals.less" rel="stylesheet" media="screen"/>

  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="${path}/plugins/jquery-1.11.3.min.js"></script>
  <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
  <script src="${path}/plugins/bootstrap-3.3.0/js/transition.js"></script>
  <script src="${path}/plugins/bootstrap-3.3.0/js/tooltip.js"></script>
  <script src="${path}/plugins/bootstrap-3.3.0/js/popover.js"></script>
  <script src="${path}/plugins/bootstrap-3.3.0/js/carousel.js"></script>
  <script>
    $(function () {
      $('.js-popover').popover({html: true, trigger: "hover,click"})
    })
  </script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <nav class="navbar navbar-default navbar-right">
        <div class="navbar-header sr-only">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                  data-target="#top_nav">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Brand</a>
        </div>
        <div class="collapse navbar-collapse" id="top_nav">
          <ul class="nav navbar-nav">
            <li><a>欢迎您!</a></li>
            <li><a href="#">登录</a></li>
            <li><a href="#">我的订单</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-expanded="false">我的大坝 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">待处理订单</a></li>
                <li><a href="#">我的关注</a></li>
                <li><a href="#">咨询回复</a></li>
                <li class="divider"></li>
                <li><a href="#">降价通知</a></li>
                <li><a href="#">换货退货</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-expanded="false">大坝批发<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">申请成为批发商</a></li>
                <li><a href="#">我的价格</a></li>
                <li><a href="#">活动通知</a></li>
                <li><a href="#">订单统计</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-expanded="false">手机大坝 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><strong>大坝客户端，首次下单满100送20</strong></li>
                <li>
                  <small>android客户端下载:</small>
                </li>
                <li><a href="#"><img src="${path}/img/ewm.png"></a></li>
                <li>
                  <small>ios客户端下载:</small>
                </li>
                <li><a href="#"><img src="${path}/img/ewm.png"></a></li>

              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-expanded="false">关注大坝<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">大坝微博</a></li>
                <li><a href="#">大坝微信</a></li>
                <li><a href="#">大坝QQ</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                 aria-expanded="false">网站导航<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="divider"></li>
                <li>
                  <a href="#">xxxxx</a><a href="#">xxxxx</a><a href="#">xxxxx</a><a href="#">xxxxx</a>
                </li>
              </ul>
            </li>
          </ul>

        </div>
        <!-- /.navbar-collapse -->
      </nav>

    </div>
  </div>
</div>
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


</div>

<div class="container ">
  <div class="col-md-4 btn-group-vertical">
    <button type="button" class="btn btn-lg btn-danger">
      所有产品分类
    </button>
    <button type="button" class="btn btn-default js-popover btn-danger" data-container="body" data-toggle="popover"
            data-placement="right"
            data-content="<a href='#'>Vivamus</a> sagittis lacus vel augue laoreet rutrum faucibus."
            data-original-title=" 熏腊类" title="">
      熏腊类
    </button>
    <button type="button" class="btn btn-default js-popover btn-danger" data-container="body" data-toggle="popover"
            data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
            data-original-title="鲜活类" title="">
      鲜活类
    </button>
    <button type="button" class="btn btn-default js-popover btn-danger" data-container="body" data-toggle="popover"
            data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
            data-original-title="山珍类" title="">
      山珍
    </button>
    <button type="button" class="btn btn-default js-popover btn-danger" data-container="body" data-toggle="popover"
            data-placement="right" data-content="<div width='100%'><a href='#'>干木耳</a></div>"
            data-original-title="干货类" title="">
      干货类
    </button>
  </div>
  <div class="col-md-8 img-responsive">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <a href="#"><img alt="First slide" src="${path}/img/zhonghuaxun.jpg"></a>
          <div class="carousel-caption"><h3>中华鲟</h3></div>
          <p class="text-center text-danger">名贵的中华鲟再也不用花高价了</p>
        </div>
        <div class="item">
          <a href="#"><img alt="Second slide" src="${path}/img/dabaxiaohaoqiaozuiganyu.jpg"></a>
        </div>
        <div class="item">
          <a href="#"><img alt="Third slide" src="${path}/img/tuhuazhularoushicai.jpg"></a>
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
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
    <div class="col-xs-3 "><img class="img-responsive img-rounded" src="${path}/img/dabaxiaohaoqiaozuiganyu.jpg"></div>
    <div class="col-xs-3 "><img class="img-responsive img-rounded" src="${path}/img/zhonghuaxun.jpg"></div>

  </div>
</div>
</div>
<div class="col-xs-12"><img src="${path}/img/services_u.png" class="img-responsive"></div>
<div class="col-xs-12"><img src="${path}/img/service_u2.png" class="img-responsive"></div>
<div class="col-xs-12"><img src="${path}/img/bottom_page.png" class="img-responsive"></div>
</body>
</html>
