
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>2.2 栅格系统</title>
  <!-- BootStrap -->
  <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css"/>
  <%--<script src="${path}/plugins/jquery-1.8.3.min.js"></script>--%>
  <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>

</body>
</html>
