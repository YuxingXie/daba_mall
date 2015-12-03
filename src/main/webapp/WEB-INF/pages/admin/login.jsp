<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title>管理员登录</title>
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <script> path="${path}";</script>
</head>
<body>
<div class="container">
    <div class="panel-body">
        <form >
            <fieldset>
                <div class="row form-group" style="margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2 text-right">姓名</div>
                    <div class="col-lg-3 col-sm-3" ><input type="text" placeholder="姓名" class="form-control"/></div>
                </div>
                <div class="row form-group" style="margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2 text-right">密码</div>
                    <div class="col-lg-3 col-sm-3" ><input type="password" placeholder="密码" class="form-control"/></div>
                </div>
                <div class="row" style="margin-top: 15px;">
                    <div class="col-lg-5 col-sm-5" ><input type="button" value="登陆" class="btn btn-primary pull-right"/></div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
</body>

