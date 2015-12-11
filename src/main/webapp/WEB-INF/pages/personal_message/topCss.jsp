<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/css/breadcrumb.css" rel="stylesheet" type="text/css">
<style>
    .error {
        margin: 0;
        padding: 0;
        color: #E94D1C
    }
    .info {
        margin: 0;
        padding: 0;
        color: #18e957;
        margin-left: 80px;
        margin-top: 10px;
        width: 100%;

    }
    .pw_weak{
        width: 50px;background: red;border-right: 1px #fff solid;display:inline-block;margin: 0px;
    }
    .pw_mid{
        width: 50px;background: orange;border-right: 1px #fff solid;display:inline-block;margin: 0px;
    }
    .pw_strong{
        width: 50px;background: #008000;border-right: 1px #fff solid;display:inline-block;margin: 0px;
    }
    .pw_un_reach{
        width: 50px; background: darkgray;border-right: 1px #fff solid;display:inline-block;margin: 0px;
    }
</style>
