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
  <link href="${path}/statics/assets/css/admin.css" rel="stylesheet" type="text/css">

  <!--[if lt IE 9]>
  <script src="${path}/statics/assets/plugins/respond.min.js"></script>
  <![endif]-->
  <script> path="${path}";</script>
  <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.js"></script>
  <tiles:insertAttribute name="css"/>
</head>
<body>
  <div class="container">
      <div class="row" style="margin-top: 30px;margin-bottom:30px;font-size:large">
        <div class="col-lg-3 col-sm-3 btn-group btn-group-xs" ng-init="showMenu=true">
          <a class="btn btn-primary"  data-ng-click="showMenu=!showMenu" href="${path}/admin/logout">
              <i class="fa fa-user"></i>${sessionScope.administrator.name} 退出<i class="fa fa-sign-out"></i>
          </a>
          <button class="btn btn-primary"  data-ng-click="showMenu=!showMenu">
            隐藏/显示菜单<i ng-class="{'fa':true,'fa-eye':showMenu,'fa-eye-slash':!showMenu}"></i>
          </button>
        </div>
        <div class="col-lg-7 col-sm-7 text-center"><div class="center-block">大坝生态农业科技有限公司管理平台</div></div>
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3" ng-if="showMenu">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
              <li>
                <a href="${path}/admin/index/index">
                  <i class="fa fa-home"></i>
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
                  <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>&nbsp;留言及回复管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改密码</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;日志查看</a></li>
                </ul>
              </li>
              <li>
                <a href="#configSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="fa fa-cubes"></i>
                  商品管理
                  <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                </a>
                <ul id="configSetting" class="nav nav-list secondmenu collapse">
                  <li ng-class="{'active':false}"><a href="${path}/admin/product_series/list"><i class="glyphicon glyphicon-globe"></i>&nbsp;产品信息</a></li>
                  <li><a href="${path}/admin/product_category/create_input"><i class="glyphicon glyphicon-star-empty"></i>&nbsp;产品分类信息</a></li>
                  <li><a href="${path}/admin/product_series/create_input"><i class="glyphicon glyphicon-star"></i>&nbsp;产品上架</a></li>
                  <li><a href="${path}/admin/top_carousel/list"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;首页轮播图片管理</a></li>
                  <li><a href="${path}/admin/home_page_block/list"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;首页产品区块</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;产品库存管理</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;产品价格管理</a></li>
                </ul>
              </li>

              <li>
                <a href="#disSetting" class="nav-header collapsed" data-toggle="collapse">
                  <i class="fa fa-list"></i>
                  订单管理
                  <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                </a>
                <ul id="disSetting" class="nav nav-list secondmenu collapse">
                  <li><a href="${path}/admin/order/to_handler"><i class="glyphicon glyphicon-th-list"></i>未处理订单</a></li>
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

<script src="${path}/statics/assets/plugins/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.4.8/angular.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>
  var mainApp=angular.module("mainApp",[]);
</script>
<tiles:insertAttribute name="bottomScript"/>
</html>

