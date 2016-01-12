<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='ProductSeriesListController'>
    <div class="row padding-top-10 padding-bottom-10">
        <i class="fa fa-bookmark-o fa-lg"></i><b>消息管理</b>
    </div>
    <div class="row btn-group btn-group-xs">
            <a href="${path}/admin/index/index" class="btn btn-primary"><i class="fa fa-reply"></i> 返回首页</a>
            <a href="${path}/admin/notify/create_input" class="btn btn-primary"><i class="fa fa-send"></i> 发送消息</a>
            <a href="${path}/admin/notify/list" class="btn btn-primary"><i class="fa fa-refresh"></i> 刷新</a>
    </div>
    <div class="row form-inline font-size-13-5">
        <div class="col-sm-9 col-lg-9">
            <div class="inline-block margin-top-10">
                筛选：
                <select ng-model="fromToMe" ng-init="fromToMe='toMe'" ng-change="byFromTo()"class="form-control input-sm">
                    <option value="toMe">发送给我的</option>
                    <option value="fromMe">我发送的</option>
                </select>
                <select ng-model="$parent.read" class="form-control input-sm" ng-if="fromToMe=='toMe'"  ng-change="byRead()">
                    <option value="read">已读</option>
                    <option value="unread">未读</option>
                </select>
            </div>
        </div>

    </div>
    <div class="row table-responsive padding-top-15">
        <table class="table table-hover">
            <tr>
                <th>标题</th>
                <th>发送给</th>
                <th>内容</th>
                <th>日期</th>
                <th>操作</th>
            </tr>
            <tr ng-repeat="notify in list">
                <td class="font-size-12">{{notify.title}}</td>
                <td class="font-size-12">{{notify.toUser.name}}</td>
                <td class="font-size-12" ng-init="showContent=false" width="30%">
                    <a href="javascript:void(0)" data-ng-click="showContent=!showContent"><i ng-class="{'fa':true,'fa-angle-double-down':!showContent,'fa-angle-double-up':showContent} "></i></a>
                    <span ng-if="!showContent">{{notify.content | limitTo:20}}...</span>
                    <span ng-if="showContent">{{notify.content}}</span>
                     </td>
                <td class="font-size-12">{{notify.date | date:'yyyy-MM-dd hh:mm'}}</td>
                <td class="font-size-12 btn-group btn-group-xs">
                    <a ng-href="${path}/admin/adjust_sort/{{productSeries.id}}" ng-if="fromToMe=='toMe'&&read='unread'" class="btn btn-primary"><i class="fa fa-paperclip"></i> 标记为已读</a>
                    <a href="javascript:void(0)" ng-click="remove(notify)" ng-if="fromToMe=='fromMe'" class="btn btn-primary"><i class="fa fa-trash"></i> 删除</a>
                </td>
            </tr>
            <%--<tr ng-if="!list ||!list.length"><th class="text-warning font-size-13-5" colspan="5">没有找到消息</th></tr>--%>
        </table>
    </div>
</div>


