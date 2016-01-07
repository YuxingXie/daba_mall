<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='AdjustStoreController'>
    <div class="row margin-bottom-10"><h4>商品调价</h4></div>
    <div class="row margin-bottom-10"><b>商品名称：</b>${productSeries.name}</div>
    <div class="row margin-bottom-10"><b>库存警告数量：</b>${productSeries.productStore.warningAmount}</div>
    <div class="row margin-bottom-10"><b>库存剩余：</b>${productSeries.productStore.remain}</div>

    <%--<div class="row margin-bottom-10"><b>价格生效起始日期：</b>--%>
        <%--<fmt:formatDate value="${productSeries.currentPrice.beginDate}" type="both" dateStyle="default"/>--%>
    <%--</div>--%>
    <%--<div class="row margin-bottom-10"><b>价格生效结束日期：</b>--%>
        <%--<c:choose>--%>
            <%--<c:when test="${empty productSeries.currentPrice.endDate}">永久</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<fmt:formatDate value="${productSeries.currentPrice.endDate}" type="both" dateStyle="default"/>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
    <%--</div>--%>
    <div class="row margin-bottom-10"><h4>增加一次库存记录<span class="color-red">(改数量会累加到库存数上，而不是把该数字作为库存数)</span></h4></div>
    <div class="row margin-bottom-10">
        <form action="${path}/admin/do/adjust_store" method="post" class="form-without-legend" novalidate="novalidate" name="form">
            <fieldset>

                <div class="row form-group">
                    <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">修改库存警告数：</div>
                    <div class="col-sm-7 col-lg-7 pull-left">
                        <input type="number" name="warningAmount" class="form-control" ng-model="warningAmount"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">出入库存数<i class="fa fa-asterisk color-red"></i>：</div>
                    <div class="col-sm-7 col-lg-7 pull-left">
                        <input type="hidden" name="productSeriesId" value="${productSeries.id}" />
                        <input type="number" name="amount" class="form-control" ng-model="productStoreInAndOut.amount" required="true"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">库存类型<i class="fa fa-asterisk color-red"></i>：</div>
                    <div class="col-sm-4 col-lg-4">
                        <span class="radio inline-block">
                            <label>
                                <input type="radio" name="type" required="true" ng-model="productStoreInAndOut.type" value="in" checked/>入库
                            </label>
                        </span>
                       <span class="radio inline-block">
                            <label>
                                <input type="radio" name="type"  required="true" ng-model="productStoreInAndOut.type" value="out"/>出库
                            </label>
                       </span>
                    </div>

                </div>
                <div class="row form-group">
                    <div class="col-sm-7 col-lg-7 control-label padding-top-10 text-right"></div>
                    <div class="col-sm-4 col-lg-4 pull-left input-group">
                        <span class="input-group-btn">
                            <input type="submit"class="btn btn-primary" value="确定" ng-disabled="form.$invalid"/>
                        </span>
                    </div>

                </div>

            </fieldset>
        </form>
    </div>
</div>


