<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%--<link rel="shortcut icon" type="image/x-icon" href="${path}/statics/assets/img/logo.png"  media="screen" />--%>
<link rel="shortcut icon" href="${path}/statics/assets/img/favicon.ico"/>
<link rel="bookmark" href="${path}/statics/assets/img/favicon.ico"/>
<link href="${path}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<%--<link href="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">--%>


<%--style-metronic.css，style-responsive.css和顶部弹出的二级菜单有关--%>
<link href="${path}/statics/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">

<link href="${path}/statics/assets/css/cart.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/header.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/footer.css" rel="stylesheet" type="text/css">

<link href="${path}/statics/assets/css/top.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/social-icons.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/color-bg-color.css" rel="stylesheet" type="text/css">
<%--uniform.default.css似乎与菜单弹出有关--%>
<link href="${path}/statics/assets/css/uniform.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/EasyZoom-master/css/easyzoom.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/rating.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/breadcrumb.css" media="all" rel="stylesheet" type="text/css" />