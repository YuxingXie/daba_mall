<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.1 CSS布局概述</title>
    <!-- BootStrap -->
    <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${path}/plugins/jquery-1.8.3.min.js"></script>
    <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
    <script src="${path}/plugins/bootstrap-3.3.0/js/alert.js"></script>

</head>
<body>
<h3>响应式图片</h3>
<div class="container">
    <div class="row">
        <div class="col-md-5"><img class="img-responsive" src="http://ww4.sinaimg.cn/bmiddle/59179f44jw1est73pbuihj20c807caac.jpg"/> </div>
        <div class="col-md-4"><img class="img-responsive" src="http://ww4.sinaimg.cn/bmiddle/59179f44jw1est73pbuihj20c807caac.jpg"/> </div>
        <div class="col-md-3"><img class="img-responsive" src="http://ww4.sinaimg.cn/bmiddle/59179f44jw1est73pbuihj20c807caac.jpg"/> </div>
    </div>
</div>
<h3>元素在容器中居中,然而并没有实现</h3>
<div class="container bg-danger">what the fuck! the words are not in center!</div>
</body>
</html>
