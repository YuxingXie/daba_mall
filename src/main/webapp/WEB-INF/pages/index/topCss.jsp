<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%--<link href="${path}/statics/assets/css/home-page.css" rel="stylesheet" type="text/css">--%>
<link href="${path}/statics/assets/plugins/EasyZoom-master/css/easyzoom.css" rel="stylesheet" type="text/css">
<style>
    .rating {
        color: #a9a9a9;
        margin: 0;
        padding: 0;
    }
    ul.rating {
        display: inline-block;
    }
    .rating li {
        list-style-type: none;
        display: inline-block;
        padding: 1px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
    }
    .rating .filled {
        color: #ffee33;
    }
</style>