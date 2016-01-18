<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
<head>
    <base href="<%=request.getContextPath() %>"/>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="pragma" content="no-cache">
    <title>大坝生态农业</title>
    <link rel="shortcut icon" type="image/x-icon" href="${path}/statics/assets/img/logo.png"  media="screen" />
</head>
<body>
<B>尊敬的大坝客户：</B>
<p>您好！</p>
<p>
为了给您提供更稳定、更快速的服务，我们将对服务器应用程序进行在线测试，测试期间您暂时无法获得我们为您提供的服务。感谢您对大坝的支持，我们期待您再次光临！
</p>
<p>长沙大坝生态农业科技有限公司</p>
<fmt:formatDate value="<%=new Date()%>" type="date" dateStyle="default"/>

</body>
</html>
