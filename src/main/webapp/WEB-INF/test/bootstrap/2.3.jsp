<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2.3 CSS组件的设计思想</title>
    <!-- BootStrap -->
    <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${path}/plugins/jquery-1.8.3.min.js"></script>
    <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>

</head>
<body>
<h3>CSS组件的8中基本类型</h3>
<ul>
    <li>基础样式，例如：btn,alert</li>
    <li>颜色样式，例如：btn-info,alert-success</li>
    <li>尺寸样式，例如：btn-ns,btn-sm,btn-lg</li>
    <li>状态样式，例如：active,disabled</li>
    <li>特殊元素样式，例如：dropdown-menu>li>a:hover</li>
    <li>并列元素样式，例如：btn-group.btn+.btn</li>
    <li>嵌套子元素样式，例如：btn-group.btn-group</li>
    <li>动画样式，例如：progress.active</li>
</ul>
<span class="btn btn-xs btn-primary" value="btn">btn</span>

<div class="alert alert-danger">
    <p>警告：这是第一个警告</p>

    <p>警告：这是第二个警告</p>
</div>
<div>tab导航：
    <ul class="nav nav-tabs">
        <li class="active"><a href="#">1</a></li>
        <li class="disabled"><a href="#">2</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">drop down<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">menu lv2</a></li>
            </ul>
        </li>
        <li><a href="#">4</a></li>
    </ul>
</div>
<div class="progress progress-striped active">
    <div class="progress-bar" style="width:50%">
        <%--<span class="sr-only">50% Completed</span>--%>
        <span >50% Completed</span>
<!--sr-only样式似乎不能显示什么，因为这个样式宽度只有1px-->
    </div>
</div>
</body>
</html>
