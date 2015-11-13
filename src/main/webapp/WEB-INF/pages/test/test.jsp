<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main">
    <div class="container">
        <div class="row">session：${order.id}</div>
        <div class="row">flash attribute：${order2} </div>
        <div class="row">model attribute：${order1} </div>
        <div class="row">msg：${msg} </div>
        <div class="row">param msg：${param.msg} </div>
    </div>
</div>

