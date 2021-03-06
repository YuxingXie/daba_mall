<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='AdjustPriceController'>
    <div class="row margin-bottom-10"><h4>商品调价</h4></div>
    <div class="row margin-bottom-10"><b>商品名称：</b>${productSeries.name}</div>
    <div class="row margin-bottom-10"><b>当前价格：</b>${productSeries.currentPrice.price}/${productSeries.measurementUnit}</div>
    <div class="row margin-bottom-10"><b>调价说明：</b>${productSeries.currentPrice.comment}</div>
    <div class="row margin-bottom-10"><b>定价日期：</b><fmt:formatDate value="${productSeries.currentPrice.adjustDate}" type="date" dateStyle="default"/></div>
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
    <div class="row margin-bottom-10"><h4>调整当前价格</h4></div>
    <div class="row margin-bottom-10">
        <form action="${path}/admin/do/adjust_price" method="post" class="form-without-legend" novalidate="novalidate" name="form">
            <fieldset>
                <div class="row form-group">
                    <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">调价说明：</div>
                    <div class="col-sm-7 col-lg-7 pull-left">
                        <input type="text" name="comment" class="form-control" ng-model="productSeriesPrice.comment"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">价格调为：</div>
                    <div class="col-sm-4 col-lg-4 pull-left">
                        <input type="hidden" name="productSeriesId" value="${productSeries.id}" />
                        <input type="number" name="price" class="form-control" required="true" ng-model="productSeriesPrice.price"/>
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


