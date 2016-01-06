<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
