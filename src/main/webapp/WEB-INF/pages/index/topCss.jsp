<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%--<link href="${path}/statics/assets/css/home-page.css" rel="stylesheet" type="text/css">--%>
<link href="${path}/statics/assets/plugins/EasyZoom-master/css/easyzoom.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/rating.css" rel="stylesheet" type="text/css">
