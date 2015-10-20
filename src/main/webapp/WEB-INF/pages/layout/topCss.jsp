<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
<link href="${path}/statics/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
<link href="${path}/statics/assets/plugins/layerslider/css/layerslider.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/custom.css" rel="stylesheet" type="text/css">
