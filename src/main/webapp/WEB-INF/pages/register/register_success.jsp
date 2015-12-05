<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<body>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index/main">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">注册</li>
        </ul>
        <div class="row">
            注册成功，请勿刷新页面，点击<a href="${path}/user/login/direct/${form.id}">这里</a>直接登录!
            <p>user id:${form.id}</p>
            <p>user name:${form.name}</p>
            <p>user email:${form.email}</p>
            <p>user password:${user.password}</p>
            <p>message:${message}</p>
        </div>
    </div>
</div>
</body>

