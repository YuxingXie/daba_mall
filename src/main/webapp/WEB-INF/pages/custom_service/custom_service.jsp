<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="${path}/index">首页</a></li>
        <li><a href="">客户服务</a></li>
        <li class="active">在线客服</li>
    </ul>
    <div class="row bg-success margin-bottom-20">
        <div class="col-lg-12 has-success">
            <h4><i class="fa fa-phone"></i>联系电话</h4>
            <p><i class="fa fa-info-circle"></i>123456789</p>
        </div>
    </div>
    <div class="row bg-success margin-bottom-20">
        <div class="col-lg-12 has-success">
            <h4><i class=""></i>企业QQ</h4>
            <p><i class="fa fa-info-circle"></i>123456789</p>
        </div>
    </div>
</div>

