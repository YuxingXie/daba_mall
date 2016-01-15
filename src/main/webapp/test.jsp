<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html >
<head>
</head>
<body>
<B>尊敬的转运四方客户：</B>
<p>您好！</p>
<p>
为了给您提供更稳定、更快速的服务，我们将对服务器进行优化维护，预计时间为3小时，给您带来不便敬请见谅！
</p>
<p>长沙大坝生态农业科技有限公司</p>
<fmt:formatDate value="<%=new Date()%>" type="date" dateStyle="default"/>

</body>
</html>
