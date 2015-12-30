<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%--<link rel="stylesheet" type="text/css" href="${path}/statics/assets/plugins/multi-file-upload/css/default.css">--%>
<%--<link href="${path}/statics/assets/plugins/multi-file-upload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />--%>
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.js"></script>