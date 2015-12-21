<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="webRoot" value="<%=request.getContextPath() %>"/><c:if test="${webRoot eq '/'}"><c:set var="webRoot" value=""/></c:if>
<html>
<head>
	<title>您访问的页面不存在</title>
    <link href="${webRoot}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${webRoot}/statics/assets/plugins/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${webRoot}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
</head>

<body class="bg-success">

<div class="container bg-warning margin-top-112">
    <div class="row">
        <div class="col-sm-11 col-lg-11"></div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-lg-6 ">
            <img class="img-responsive" src="${webRoot}/statics/error/404/12/404/yelang.gif"/>

        </div>
        <div class="col-sm-6 col-lg-6 ">
            <div class="row margin-top-112"><i class="fa fa-warning fa-3x">您访问的页面不存在</i></div>
            <div class="row margin-top-20"><a href="${webRoot}" class="fa fa-home">返回首页</a></div>
            <div class="row margin-top-20"><a href="${webRoot}"><%=request.getServerName() %></a>提醒您 - 您可能输入了错误的网址，或者该网页已删除或移动</div>
        </div>
    </div>

</div>
</body>
</html>