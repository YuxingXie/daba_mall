<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html ng-app="mainApp">
<head>
  <title>大坝生态农业科技有限公司电商网站管理平台</title>
  <link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
  <script> path="${path}";</script>
  <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.js"></script>
  <tiles:insertAttribute name="css"/>

    <style>
    html {
      -ms-text-size-adjust: 100%;
      -webkit-text-size-adjust: 100%;
    }

    body {
      font-family: 'Microsoft Yahei', '微软雅黑', '宋体', \5b8b\4f53, Tahoma, Arial, Helvetica, STHeiti;
      margin: 0;
    }

    .main-nav {
      margin-left: 1px;
    }

    .main-nav.nav-tabs.nav-stacked > li {
    }

    .main-nav.nav-tabs.nav-stacked > li > a {
      padding: 10px 8px;
      font-size: 12px;
      font-weight: 600;
      color: #4A515B;
      background: #E9E9E9;
      background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
      background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
      background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
      background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
      background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
      background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
      -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
      border: 1px solid #D5D5D5;
      border-radius: 4px;
    }

    .main-nav.nav-tabs.nav-stacked > li > a > span {
      color: #4A515B;
    }

    .main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
      color: #FFF;
      background: #3C4049;
      background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
      background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
      background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
      background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
      background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
      background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
      -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
      border-color: #2B2E33;
    }

    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
      color: #FFF;
    }

    .main-nav.nav-tabs.nav-stacked > li {
      margin-bottom: 4px;
    }

    .nav-header.collapsed > span.glyphicon-chevron-toggle:before {
      content: "\e114";
    }

    .nav-header > span.glyphicon-chevron-toggle:before {
      content: "\e113";
    }

    footer.duomi-page-footer {
      background-color: white;
    }

    footer.duomi-page-footer .beta-message {
      color: #a4a4a4;
    }

    footer.duomi-page-footer .beta-message a {
      color: #53a2e4;
    }

    footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
      color: #a4a4a4;
      padding-bottom: 30px;
    }




    footer.duomi-page-footer {
      background-color: white;
    }

    footer.duomi-page-footer .beta-message {
      color: #a4a4a4;
    }

    footer.duomi-page-footer .beta-message a {
      color: #53a2e4;
    }

    footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
      color: #a4a4a4;
      padding-bottom: 30px;
    }

    /*********************************************自定义部分*********************************************/
    .secondmenu a {
      font-size: 12px;
      color: #4A515B;
      text-align: left;
      border-radius: 4px;
      padding-left:15px ;
      margin-left: 15px;;
    }

    .secondmenu > li > a:hover {
      background-color: #6f7782;
      border-color: #428bca;
      color: #fff;
    }

    .secondmenu li.active {
      background-color: #6f7782;
      border-color: #428bca;
      border-radius: 4px;
    }

    .secondmenu li.active > a {
      color: #ffffff;
    }

    .navbar-static-top {
      background-color: #212121;
      margin-bottom: 5px;
    }

    .navbar-brand {
      background: url('http://static-res.ruyo.net/ruyo_net_w_32.png') no-repeat 10px 8px;
      display: inline-block;
      vertical-align: middle;
      padding-left: 50px;
      color: #fff;
    }

    .navbar-brand:hover {
      color: #fff;
    }


    .collapse.glyphicon-chevron-toggle, .glyphicon-chevron-toggle:before {
      content: "\e113";
    }

    .collapsed.glyphicon-chevron-toggle:before {
      content: "\e114";
    }
  </style>

</head>
<body>
  <div class="container">
      <div class="row text-center text-primary" style="margin-top: 30px;margin-bottom:30px;font-size:large">大坝生态农业科技有限公司管理平台</div>
      <div class="container-fluid">
        <div class="row" ng-init="showMenu=true">
          <button class="btn btn-primary btn-xs"  data-ng-click="showMenu=!showMenu">
            隐藏/显示菜单<i ng-class="{'fa':true,'fa-eye':showMenu,'fa-eye-slash':!showMenu}"></i></button>
        </div>
        <div class="row">
          <div class="col-md-3" ng-if="showMenu">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
              <li>
                <a href="#">
                  <i class="glyphicon glyphicon-th-large"></i>
                  首页
                </a>
              </li>
              <li>
                <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="glyphicon glyphicon-cog"></i>
                  系统管理
                  <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                </a>
                <ul id="systemSetting" class="nav nav-list secondmenu collapse" style="height: 0px;">
                  <li><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;用户管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>&nbsp;菜单管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>&nbsp;角色管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改密码</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;日志查看</a></li>
                </ul>
              </li>
              <li>
                <a href="#configSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="glyphicon glyphicon-credit-card"></i>
                  商品管理
                  <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                </a>
                <ul id="configSetting" class="nav nav-list secondmenu collapse in">
                  <li ng-class="{'active':false}"><a href="${path}/admin/product_series/list"><i class="glyphicon glyphicon-globe"></i>&nbsp;产品信息</a></li>
                  <li><a href="${path}/admin/product_category/create_input"><i class="glyphicon glyphicon-star-empty"></i>&nbsp;产品分类信息</a></li>
                  <li><a href="${path}/admin/product_series/create_input"><i class="glyphicon glyphicon-star"></i>&nbsp;产品上架</a></li>
                  <li><a href="${path}/sort/"><i class="glyphicon glyphicon-text-width"></i>&nbsp;修改产品信息</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;首页轮播图片管理</a></li>
                  <li><a  href="${path}/admin/home_page_block/list"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;首页产品区块</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;产品库存管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;产品价格管理</a></li>
                </ul>
              </li>

              <li>
                <a href="#disSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="glyphicon glyphicon-globe"></i>
                  订单管理
                  <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                </a>
                <ul id="disSetting" class="nav nav-list secondmenu collapse">
                  <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>&nbsp;分发包配置</a></li>
                </ul>
              </li>

              <li>
                <a href="#dicSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="glyphicon glyphicon-bold"></i>
                  系统配置
                  <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                </a>
                <ul id="dicSetting" class="nav nav-list secondmenu collapse">
                  <li><a href="#"><i class="glyphicon glyphicon-text-width"></i>&nbsp;银行配置</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-text-width"></i>&nbsp;官方邮箱配置</a></li>
                </ul>
              </li>
              <li>
                <a href="#">
                  <i class="glyphicon glyphicon-fire"></i>
                  关于系统
                  <span class="badge pull-right">1</span>
                </a>
              </li>

            </ul>
          </div>
          <div ng-class="{'col-md-9':showMenu,'col-md-12':!showMenu}">
            <tiles:insertAttribute name="body" />
          </div>
        </div>
    </div>
  </div>
</body>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.4.8/angular.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>
  var mainApp=angular.module("mainApp",[]);
</script>
<tiles:insertAttribute name="bottomScript"/>
</html>

