<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script> path="${path}";</script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.4.8/angular.js"></script>