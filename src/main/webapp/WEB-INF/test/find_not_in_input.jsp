<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/22
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>

select names not in followings:
<form action="<%=request.getContextPath()%>/test/find_not_in.do">

    <ul>
        <c:forEach var="user" items="${users}">
            <li> ${user.name}<input type="checkbox" name="names" value="${user.name}"></li>
        </c:forEach>
    </ul>
    <input type="submit" value="submit">
</form>

<br/><a href="<%=request.getContextPath()%>/index.jsp">back to index</a>
</body>
</html>
