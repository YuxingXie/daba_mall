<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>
<div class="container"  id="myInterestsAppMain">
    <div ng-controller="myInterestsController">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">我的关注</li>
        </ul>
        <%--<div id="msg">已成功加入购物车！</div>--%>
        <div class="table-responsive">
            <table class="table table-striped table-hover text-center" summary="Shopping cart">
                <tr>
                    <th class="text-center">商品信息</th>
                    <th class="text-center">单价</th>
                    <th class="text-center">库存信息</th>
                    <th class="text-center">操作</th>
                </tr>
                <tr ng-if="!interests||interests.length==0">
                    <td colspan="5">您没有关注任何商品!返回<a href="${path}/index" class="fa fa-home">首页</a>继续购物</td>
                </tr>
                <tr name="interest" ng-if="interests&&interests.length>0" ng-repeat="interest in interests" >
                    <td>
                        <img class="img-responsive text-right inline-block" ng-src="${path}/{{interest.productSeries.pictures[0].iconPicture}}">
                        <a class="inline-block" ng-href="${path}/product_series/{{interest.productSeries.id}}">{{interest.productSeries.name}}</a>
                    </td>

                    <td>
                    <span class="fa fa-rmb">{{interest.productSeries.commonPrice | number:2}}/{{interest.productSeries.measurementUnit}}</span>
                    </td>
                    <td>
                        <span ng-if="!interest.productSeries.productStore">无库存信息</span>
                        <span ng-if="interest.productSeries.productStore&&interest.productSeries.productStore.remain">
                        剩余{{interest.productSeries.productStore.remain}}件
                        </span>
                        <span ng-if="interest.productSeries.productStore&&!interest.productSeries.productStore.remain">无法获取</span>
                    </td>
                    <td class="btn-group btn-group-xs">
                        <a ng-href="${path}/personal/interests/remove/{{interest.id}}" class="btn btn-primary"><i class=" fa fa-trash"></i>删除</a>
                        <a href="javascript:void(0)" class="btn btn-primary" data-ng-click="popover(interest.productSeries.id)"><i class="fa fa-shopping-cart"></i>添加到购物车</a>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</div>
