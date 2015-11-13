<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
</head>
<body>
<h2>DBRef test!</h2>

<h3><a href="${path}/api/dbref/retrieve">展示一个dbref查询</a></h3>

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
<h3>表单输入一个作者(TestAuthors)和一个帖子(TestPosts)，并用DBRef的方式把帖子作者保存为为输入的作者</h3>
    <form action="${path}/api/dbref/create" method="post">
        <div>作者姓名<input type="text" name="name"/></div>
        <div>作者email<input type="text" name="email"/></div>
        <div>帖子标题<input type="text" name="title"/></div>
        <div><input type="submit" value="提交"/></div>
    </form>
</body>
</html>