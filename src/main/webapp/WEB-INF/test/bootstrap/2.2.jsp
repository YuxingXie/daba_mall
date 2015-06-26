<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2.2 栅格系统</title>
    <!-- BootStrap -->
    <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
    <![endif]-->
        <script src="${path}/plugins/jquery-1.8.3.min.js"></script>
        <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
    <style>
        div{border-style: solid}
    </style>
</head>
<body>

<h3>列组合，跨设备组合定义，用不同分辨率看不变形</h3>
<div class="container">
    <div class="row">
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
        <div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">col-xx-1</div>
    </div>
    <div class="row">
        <div class="col-md-8 col-xs-8 col-sm-8 col-lg-8">col-xx-8</div>
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">col-xx-4</div>
    </div>
    <div class="row">
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">col-xx-4</div>
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">col-xx-4</div>
        <div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">col-xx-4</div>
    </div>
    <div class="row">
        <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">col-xx-6</div>
        <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">col-x-6</div>
    </div>
    <div class="row">
        <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">col-xx-3</div>
        <div class="col-md-7 col-xs-7 col-sm-7 col-lg-7">col-xx-7</div>
    </div>
</div>
<h3>列偏移</h3>
<div class="container">
    <div class="row">
        <div class="col-md-4">col-md-4</div>
        <div class="col-md-4 col-md-offset-4">col-md-4 col-md-offset-4</div>
    </div>
</div>

<h3>列嵌套</h3>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            level 1：col-md-9
            <div class="row">
                <div class="col-md-6">level 2:col-md-6</div>
                <div class="col-md-6">level 2:col-md-6</div>
            </div>
        </div>
        <div class="col-md-3"> level 1：col-md-3</div>
    </div>
</div>
<h3>列排序</h3>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-push-2">col-md-6 col-md-push-2</div>
        <div class="col-md-4 col-md-push-2">col-md-4 col-md-push-2</div>
    </div>
</div>
<h3>向大兼容:虽然只应用了sm类型的样式，但在大屏幕下依然生效</h3>
<div class="container">
    <div class="row">
        <div class="col-sm-6">col-sm-6</div>
        <div class="col-sm-4">col-sm-4</div>
        <div class="col-sm-2">col-sm-2</div>
    </div>
</div>
<h3>清除浮动</h3>
<label>未清除浮动时的效果</label>
<div class="container">
    <div class="row">
        <div class="col-sm-6">col-sm-6 多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容</div>
        <div class="col-sm-6">col-sm-6</div>
        <div class="col-sm-6">col-sm-6</div>
        <div class="col-sm-6">col-sm-6</div>
    </div>
</div>
<label>清除浮动后的效果</label>
<div class="container">
<div class="row">
    <div class="col-sm-6">col-sm-6 多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容多加点内容</div>
    <div class="col-sm-6">col-sm-6</div>
    <div class="clearfix"></div>
    <div class="col-sm-6">col-sm-6</div>
    <div class="col-sm-6">col-sm-6</div>
</div>
</div>
</body>
</html>
