<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="TopCarouselListController">
    <div class="row margin-top-10 margin-bottom-20 margin-left-20"><div class="center-block font-size-17-5 text-center"><b>首页顶部轮播管理</b></div></div>
    <div class="row margin-top-10 btn-group btn-group-sm">
        <a href="${path}/admin/top3" class="btn btn-primary">新增轮播方案<i class="fa fa-plus"></i></a>
        <%--<a href="${path}/admin/home_page_block/create_input" class="btn btn-primary">编辑区块<i class="fa fa-plus"></i></a>--%>
    </div>
    <div class="table-responsive">
            <table class="table table-hover table-condensed table-bordered">
                <tr>
                    <th>方案名称</th>
                    <th>优先级</th>
                    <th>操作</th>
                </tr>
                <tr ng-if="!topCarousels||!topCarousels.length">
                    <td colspan="6">暂时没有方案</td>
                </tr>
                <tr ng-repeat="topCarousel in topCarousels">
                    <td>{{topCarousel.name}}</td>
                    <td>{{topCarousel.priority}}</td>
                    <td class="btn-group btn-group-xs">
                        <button class="btn btn-primary">预览<i class="fa fa-eye"></i></button>
                        <button class="btn btn-primary">修改<i class="fa fa-edit"></i></button>
                        <button class="btn btn-primary" >删除<i class="fa fa-remove"></i></button>
                    </td>
                </tr>
            </table>
    </div>
</div>
