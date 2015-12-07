<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" ng-app="myAccountApp" id="myAccountAppMain">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">用户中心</a></li>
            <li class="active">我的账号</li>
        </ul>

        <div class="row" data-ng-controller="myAccountAppController">
            <nav class="navbar navbar-default" role="navigation">

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ng-class="{active:isActive('${path}/personal_message')}"><a href="${path}/personal_message"></a></li>
                        <li ng-class="{active:isActive('/123')}"><a href="/123">123</a></li>
                        <li ng-class="{active:isActive('/dropdown')}" class="dropdown">
                            <a href="/dropdown" class="dropdown-toggle fa fa-user" data-toggle="dropdown">个人信息 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/dropdown/label1">label1</a></li>
                                <li><a href="/dropdown/label2">label2</a></li>
                                <li><a href="/dropdown/label3">label3</a></li>
                                <li class="divider"></li>
                                <li><a href="/dropdown/label4">label4</a></li>
                                <li class="divider"></li>
                                <li><a href="/dropdown/label5">label5</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- END CONTENT -->

</div>
<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--$("[name='signupForm']").submit(function() {--%>
            <%--alert($(this).serialize());--%>
            <%--return false;--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>

</body>
