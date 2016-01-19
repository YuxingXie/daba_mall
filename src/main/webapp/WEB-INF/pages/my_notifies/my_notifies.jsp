<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container" ng-controller="myNotifiesController">
    <div>
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">我的大坝</a></li>
            <li class="active">我的消息</li>
        </ul>
        <div class="row">
            <b>共{{notifyPage.totalElements}}个消息，其中未读消息{{unreadNotifiesCount}}个</b>
        </div>
        <div class="table-responsive">
            <table class="table table-hover text-center">
                <tr ng-if="!notifyPage.content||notifyPage.content.length==0">
                    <td colspan="5">您暂时没有消息!<a href="${path}">返回首页继续购物</a></td>
                </tr>
                <tr ng-if="notifyPage.content&&notifyPage.content.length>0">
                    <th class="text-center">状态</th>
                    <th class="text-center">标题</th>
                    <th class="text-center">发送时间</th>
                    <th class="text-left">操作</th>
                </tr>
                <tr ng-if="notifyPage.content&&notifyPage.content.length>0" ng-repeat="notify in notifyPage.content" >
                    <td>
                        <i ng-class="{'glyphicon':true,'glyphicon-folder-open':notify.read,'glyphicon-folder-close':!notify.read}"></i>
                        <span ng-if="notify.read">已读</span>
                        <span ng-if="!notify.read">未读</span>
                    </td>
                    <td><a href="javascript:void(0)" ng-click="showNotify(notify)">{{notify.title}}</a></td>
                    <td><i class="fa fa-clock-o"></i>{{notify.date | date:'yyyy-MM-dd hh:mm'}}</td>
                    <td class="text-left">
                        <a href="javascript:void(0)" class="fa fa-eye" ng-click="markAsRead(notify)" ng-if="!notify.read">标记为已读</a>
                        <a href="javascript:void(0)" class="fa fa-trash" ng-click="removeNotify(notify)">删除</a>
                    </td>
                </tr>
                <tr><td  colspan="3"></td><td> <div class="pull-right"> <tm-pagination conf="paginationConf"></tm-pagination></div></td></tr>
            </table>

        </div>


    </div>
    <div class="modal fade active" id="notifyModal" tabindex="-1" role="dialog" aria-labelledby="notifyModal" aria-hidden="true">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close fa  fa-times-circle" data-dismiss="modal" aria-hidden="true"></button>
                        <h2 class="modal-title">{{notify.title}}</h2>
                    </div>
                    <div class="modal-body">
                        <div class="row">

                            <div class="col-lg-12">
                                <pre style="width: 100%">{{notify.content}}</pre>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <label class="col-lg-2"></label>
                            <div class="col-lg-8">
                                发送于{{notify.date | date:'yyyy-MM-dd hh:mm'}}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-sm-4 pull-right">
                                <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true">关闭</button>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
    </div>
</div>
