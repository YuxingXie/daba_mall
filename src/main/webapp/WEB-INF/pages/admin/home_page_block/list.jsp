<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="HomePageBlockListController">
    <div class="row margin-top-10 margin-bottom-20 margin-left-20"><div class="center-block font-size-17-5 text-center"><b>首页区块管理</b></div></div>
    <div class="row margin-top-10 btn-group btn-group-sm">
        <a href="${path}/admin/home_page_block/create_input" class="btn btn-primary">新增区块<i class="fa fa-plus"></i></a>
        <%--<a href="${path}/admin/home_page_block/create_input" class="btn btn-primary">编辑区块<i class="fa fa-plus"></i></a>--%>
    </div>
    <div class="table-responsive">
            <table class="table table-hover table-condensed table-bordered">
                <tr>
                    <th width="12%">标题</th>
                    <th width="25%">描述</th>
                    <th width="18%">无产品描述</th>
                    <th width="8%">产品数</th>
                    <th width="12%">状态</th>
                    <th width="25%">操作</th>
                </tr>
                <tr ng-if="!homePageBlockList||!homePageBlockList.length">
                    <td colspan="6">暂时没有首页产品区块</td>
                </tr>
                <tr ng-repeat="homePageBlock in homePageBlockList">
                    <td class="font-size-12">{{homePageBlock.title}}</td>
                    <td class="font-size-12">{{homePageBlock.description | limitTo:20}}...</td>
                    <td class="font-size-12">{{homePageBlock.descriptionWhenEmpty| limitTo:20}}...</td>
                    <td class="font-size-12">{{homePageBlock.productSeriesList.length}}</td>
                    <td class="font-size-12">
                        <span ng-if="homePageBlock.show">显示</span>
                        <span ng-if="!homePageBlock.show">不显示</span>
                    </td>
                    <td class="font-size-12 btn-group btn-group-xs">
                        <button class="btn btn-primary">详情<i class="fa fa-eye"></i></button>
                        <button class="btn btn-primary">修改<i class="fa fa-edit"></i></button>
                        <button class="btn btn-primary" data-ng-click="delete(homePageBlock)">删除<i class="fa fa-remove"></i></button>

                    </td>
                </tr>
            </table>

    </div>
</div>
