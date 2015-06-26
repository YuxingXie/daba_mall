<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/22
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="p" uri="/pageTag" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title></title>
</head>
<body>

find some results: <ul>
  <c:forEach var="user" items="${page.content}">
    <li>
     ${user.name},${user.sex},
      address:
      <c:if test="${not empty user.address}">
        <c:forEach var="address" items="${user.address}" >
          ${address.country},${address.provence}
        </c:forEach>
      </c:if>
    </li>

  </c:forEach>
</ul>
<p:PageTag
        isDisplayGoToPage="true" isDisplaySelect="false"
        totalPages='${page.totalPages}'
        currentPage='${empty param.page ? 1 : param.page}'
        totalRecords='${page.totalElements}'
        ajaxUrl='${path}/test/find_page.do'
        frontPath='' displayNum='5'
        />
<a href="<%=request.getContextPath()%>/index.jsp">back to index</a>
</body>
</html>
