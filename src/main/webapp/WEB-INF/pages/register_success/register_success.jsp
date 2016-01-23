<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">用户</a></li>
            <li class="active">注册</li>
        </ul>
        <div class="row bg-success" style="margin-bottom: 20px;">
            <div class="col-lg-12 has-success">
                <h3><i class="fa fa-info-circle"></i>恭喜您注册成为大坝用户，您可以使用注册用户的功能了。您也可以继续<a href="${path}/user/personal_message" target="_blank"> 完善个人资料</a>。</h3>
            </div>
        </div>



    <div style="margin-top: 20px;"></div>
</div>

