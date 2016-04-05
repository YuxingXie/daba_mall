<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">我的订单</a></li>
            <li class="active">支付通知</li>
        </ul>
            <c:choose>
                <c:when test="${message.success}">
                    <div class="row bg-success margin-bottom-20">
                        <div class="col-lg-12 has-success">
                            <h4><i class="fa fa-thumbs-up color-blue"></i>您的订单${out_trade_no}交易成功!</h4>
                            <p><i class="fa fa-info-circle"></i><a href="${path}/index">返回首页继续购物</a></p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row bg-danger margin-bottom-20">
                        <div class="col-lg-12 has-error">
                            <h4><i class="fa fa-warning color-red"></i>您的订单${out_trade_no}交易失败!</h4>
                            <p><i class="fa fa-info-circle"></i>请确认您登录是否超时，网络是否通畅</p>
                            <p><i class="fa fa-info-circle"></i><a href="${path}/custom_service">联系客服</a></p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>



</div>

