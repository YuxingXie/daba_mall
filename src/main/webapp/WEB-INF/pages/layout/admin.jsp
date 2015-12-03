<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
  <title>输入产品</title>
  <link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
  <script> path="${path}";</script>
  <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.js"></script>
  <tiles:insertAttribute name="css"/>
</head>
<body>
<div class="main">
  <div class="container">
    <div class="row text-center text-primary" style="margin-top: 30px;margin-bottom:30px;font-size:large">大坝生态农业科技有限公司管理平台</div>
    <div class="row">
      <ul class="list-inline">
        <li><a href="${path}">首页</a></li>
        <li><a href="">商店</a></li>
        <li>物品详情</li>
      </ul>
    </div>
    <div class="row">
      <div class="sidebar col-md-3 col-sm-5 bg-primary" style="margin-top: 15px;">
        <ul class="list-group margin-bottom-25 sidebar-menu">


            <li class="list-group-item clearfix dropdown"><a href="javascript:void(0);" class="collapsed">
              <i class="fa fa-angle-right"></i> 商品管理<i class="fa fa-angle-down"></i>
            </a>
              <ul class="dropdown-menu" style="display:block;">
                <li class="list-group-item dropdown clearfix">
                  <a href="${path}/admin/product_series/list"><i class="fa fa-circle"></i>产品信息</a>
                </li>
                <li class="list-group-item dropdown clearfix">
                  <a href="${path}/admin/product_category/create_input"><i class="fa fa-circle"></i>产品分类信息</a>
                </li>
                  <li class="list-group-item dropdown clearfix">
                    <a href="${path}/admin/product_series/create_input"><i class="fa fa-circle"></i>产品上架</a>
                  </li>
                <li class="list-group-item dropdown clearfix">
                  <a href="${path}/sort/" target="main-content"><i class="fa fa-circle"></i>修改产品信息</a>
                </li>
                <li class="list-group-item dropdown clearfix">
                  <a href="${path}/sort/" target="main-content"><i class="fa fa-circle"></i>首页轮播图片管理</a>
                </li>
                <li class="list-group-item dropdown clearfix">
                  <a href="${path}/sort/" target="main-content"><i class="fa fa-circle"></i>产品库存管理</a>
                </li>
              </ul>
            </li>
          <li class="list-group-item clearfix dropdown"><a href="javascript:void(0);" class="collapsed">
            <i class="fa fa-angle-right"></i> 订单管理<i class="fa fa-angle-down"></i>
          </a>
            <ul class="dropdown-menu" style="display:block;">
              <li class="list-group-item dropdown clearfix active">
                <a href="${path}/admin/product_series/list"><i class="fa fa-circle"></i>产品信息</a>
              </li>
              <li class="list-group-item dropdown clearfix">
                <a href="${path}/admin/product_series/create_input"><i class="fa fa-circle"></i>产品上架</a>
              </li>
              <li class="list-group-item dropdown clearfix">
                <a href="${path}/sort/" target="main-content"><i class="fa fa-circle"></i>修改产品信息</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="col-md-9 col-sm-7">
        <tiles:insertAttribute name="body" />
      </div>
    </div>
    </div>

  </div>
</div>
</body>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>
<tiles:insertAttribute name="bottomScript"/>
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
<%--<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>--%>
</html>

