<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='EvaluateController'>
    <div class="row btn-group btn-group-xs">
            <a href="${path}/admin/index/index" class="btn btn-primary"><i class="fa fa-reply"></i> 返回首页</a>
            <a href="${path}/admin/evaluate/list" class="btn btn-primary"><i class="fa fa-refresh"></i> 刷新</a>
    </div>

    <div class="row table-responsive padding-top-15">
        <table class="table table-hover">
            <tr>
                <th>内容</th>
                <th>图片</th>
                <th>发言人</th>
                <th>日期</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <tr ng-repeat="evaluate in list">
                <td class="font-size-12">{{evaluate.content}}</td>
                <td class="font-size-12">
                    <a ng-repeat="picture in evaluate.pictures" ng-href="${path}/{{picture}}" target="_blank"><img  ng-src="${path}/{{picture}}" class="img-responsive img-ico-sm inline-block"/></a>
                </td>
                <td class="font-size-12">{{evaluate.replyUser.name}}</td>
                <td class="font-size-12">{{evaluate.date | date:'yyyy-MM-dd'}}</td>
                <td class="font-size-12">
                    <i class="fa fa-2x fa-lock color-red"
                       ng-if="evaluate.evaluateFilterInfo.forbid==='true'||evaluate.evaluateFilterInfo.forbid==true"></i>
                    <i class="fa fa-2x fa-unlock color-green"
                       ng-if="evaluate.evaluateFilterInfo.forbid==='false'||!evaluate.evaluateFilterInfo||!evaluate.evaluateFilterInfo.forbid"></i>
                </td>
                <td class="font-size-12 btn-group btn-group-xs">
                    <button data-ng-click="openModal(evaluate)" class="btn btn-primary"><i class="fa fa-filter"></i> 过滤</button>
                </td>
            </tr>
            <tr ng-if="!list ||!list.length"><th class="text-warning font-size-13-5" colspan="5">没有找到符合的商品</th></tr>
        </table>
    </div>
    <div class="modal fade active" id="evaluateFilterModal" tabindex="-1" role="dialog" aria-labelledby="evaluateFilterModal" aria-hidden="true">
        <form name="evaluateForm" id="evaluateForm" ng-submit="doFilter()" novalidate="novalidate" method="POST" enctype="multipart/form-data">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                        <h2 class="modal-title">评论过滤</h2>
                    </div>
                    <div class="modal-body">
                        <fieldset>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-2 control-label">状态</label>
                                    <div class="col-lg-8 has-success">
                                        <select ng-model="evaluate.evaluateFilterInfo.forbid" class="form-control">
                                            <option value="true">禁止显示</option>
                                            <option value="false">显示</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label class="col-lg-2 control-label">评价内容 </label>
                                    <div class="col-lg-8 has-success">
                                        {{evaluate.content}}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="row">
                                    <label  class="col-lg-2 control-label">图片</label>
                                    <div class="col-lg-8 has-success">
                                        <a ng-repeat="picture in evaluate.pictures" ng-href="${path}/{{picture}}" target="_blank">
                                            <img  ng-src="${path}/{{picture}}" class="img-responsive img-ico-sm inline-block"/></a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                    <label  class="col-lg-2 control-label">原因</label>
                                    <div class="col-lg-10 col-sm-10">
                                        <input type="text" ng-model="evaluate.evaluateFilterInfo.reason" class="form-control"/>
                                    </div>

                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <div class="col-lg-6 col-sm-6"></div>
                        <div class="col-lg-4 col-sm-4">
                            <button type="submit" class="btn btn-primary" >提交</button>
                            <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>


