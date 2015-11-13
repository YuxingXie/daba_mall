<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html >
<head>
</head>
<body>
<h2>Hello Mongo!</h2>
<h3>DBRef test!</h3>
<a href="${path}/api/dbref/example">展示一个dbref查询</a>
<div>
    <c:forEach var="testPosts" items="${testPostsList}">
        <p>id:${testPosts.id}</p>
        <p>title:${testPosts.title}</p>
        <p>authors:</p>
        <c:forEach var="author" items="${testPosts.authors}">
            <p>id:${author.id} ,name:${author.name} ,email:${author.email}</p>
        </c:forEach>

    </c:forEach>
</div>
</body>
</html>