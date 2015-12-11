<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%--<script src="${path}/statics/assets/plugins/angular-1.2.19/angular-route.min.js"></script>--%>
<script src="${path}/statics/assets/scripts/register.js"></script>
