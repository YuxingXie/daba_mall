<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">


<%--<link rel="shortcut icon" href="favicon.ico">--%>
<%--<link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">--%>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"><!-- for slider-range -->

