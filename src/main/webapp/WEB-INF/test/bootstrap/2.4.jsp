<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2.4 JavaScript插件框架</title>
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
<h3>自定义插件规则</h3>
<ul>
    <li>HTML布局规则：基于元素自定义属性的布局规则，比如使用类似于data-target的自定义属性</li>
    <li>JavaScript实现步骤：所有的插件都遵循jQuery插件开发的标准步骤，所有的事件都保持了统一标准</li>
    <li>插件调用方法：所以插件的使用方式都非常类似，可以是HTML声明式，也可以是调用式(JavaScript代码)，并且支持多种回调和可选参数</li>
</ul>
<div class="alert alert-danger" >
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>警告! </strong>你输入的email无效
</div>


</body>
</html>
