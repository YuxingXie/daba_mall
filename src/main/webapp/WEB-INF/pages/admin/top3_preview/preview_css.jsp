<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
<link href="${path}/statics/assets/css/layer-slider.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/layerslider/css/layerslider.css" rel="stylesheet" type="text/css">