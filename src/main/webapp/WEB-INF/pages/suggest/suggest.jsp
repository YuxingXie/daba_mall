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
            <li class="active">我们建议</li>
        </ul>
        <div class="row bg-success margin-bottom-20">
            <div class="col-lg-12 has-success">
                <h4><i class="fa fa-question-circle"></i>系统要求</h4>
                <p><i class="fa fa-info-circle"></i>为了更好的展示效果，我们的系统框架使用大量HTML5及CSS3元素，并使用ECMAScript标准语法。由于历史原因，一些旧版本的浏览器并不支持这些特性。理论上，IE9+,FireFox4+,Chorme,Safari
                浏览器都支持这些特性，但为了更好的展示效果，我们不建议您使用任何版本IE核心浏览器，其它核心浏览器则版本越新越好。</p>
            </div>
        </div>
        <div class="row bg-success margin-bottom-20">
            <div class="col-lg-12 has-success">
                <h4><i class="fa fa-question-circle"></i>只有IE6浏览器怎么办</h4>
                <p><i class="fa fa-info-circle"></i>如果您的IE版本在9以下，可以预见大部分功能都会出现障碍。兼容低版本的浏览器是一件非常难的事情，浏览器厂商自己本身也在抛弃这些与ECMAScript标准不一致的浏览器，微软就已宣布不再对任何版本IE
                浏览器提供更新。所以我们建议您安装一个现代浏览器吧。</p>
            </div>
        </div>
    <div style="margin-top: 20px;"></div>
</div>

