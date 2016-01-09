<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="form" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.entity.User" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" ng-controller="ReturnExchangeNotifyController">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">用户中心</a></li>
            <li class="active">退换货</li>
        </ul>

        <div class="row">
            <form id="form" name="form" class="form-horizontal form-without-legend" role="form" method="post" ng-submit="submit()">
                <div class="modal-body">
                    <div class="row"><div class="col-lg-1"></div>
                        <div class="col-lg-10"><span id="error-msg" class="text-danger"></span></div>
                        <div class="col-lg-1"></div></div>
                    <fieldset>
                        <div class="form-group has-feedback">
                            <div class="col-lg-2"><label class="control-label pull-right margin-top-10">理由</label></div>
                            <div class="col-lg-6 has-success">
                                <c:if test="${not empty to}"><input type="hidden" name="to" value="${to}"/></c:if>
                                <input type="text" class="form-control" id="reason" name="reason" placeholder="退/换货理由，非必填"  ng-model="reason"/>
                                <%--<span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
                                <input type="hidden" name="mergeCart" id="mergeCart"/>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                        <div class="form-group has-feedback">
                            <div class="col-lg-2"><label class="control-label pull-right margin-top-10">来自订单</label></div>
                            <div ng-class="{'col-lg-6':true,'has-error':form.order.$invalid,'has-success':form.order.$valid}">
                                <select ng-model="order" name="order" ng-options="order.id for order in orders" class="form-control" required="true"></select>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                        <div class="form-group has-feedback" ng-if="order">
                            <div class="col-lg-2"><label class="control-label pull-right">退/换商品</label></div>
                            <div ng-class="{'col-lg-6':true,'has-error':form.productSelected.$invalid,'has-success':form.productSelected.$valid}">
                                <span ng-repeat="productSelected in order.productSelectedList track by $index">
                                    <div class="row padding-top-5">
                                        <label class="col-sm-10 col-lg-10 checkbox-inline">
                                            <input type="checkbox" ng-init="checked=false" name="productSelected" ng-checked="checked" ng-click="checked=!checked;addToList(checked,productSelected)"/>
                                            {{productSelected.productSeries.name}}
                                            <span ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.value}}</span>
                                            &times;{{productSelected.amount}}
                                        </label>
                                    </div>
                                </span>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                        <div class="form-group" ng-if="returnList&&returnList.length">
                            <div class="col-lg-2"><label class="control-label pull-right">退/换数量</label></div>
                            <div class="col-lg-10">
                                <div class="row padding-top-5" ng-repeat="productSelectedOfReturn in returnList">
                                    <div class="col-sm-2 col-lg-2 padding-top-8 text-right">
                                        {{productSelectedOfReturn.productSeries.name}}
                                        <span ng-repeat="productPropertyValue in productSelectedOfReturn.productPropertyValueList">{{productPropertyValue.value}}</span>
                                    </div>
                                    <div class="col-sm-2 col-lg-2">
                                        <input class="form-control" type="number" ng-model="productSelectedOfReturn.returnExchange.amount" max="{{productSelectedOfReturn.amount}}" required="true"/>
                                    </div>
                                    <div class="col-sm-6 col-lg-6">
                                        <input class="form-control" type="text" ng-model="productSelectedOfReturn.returnExchange.reason" placeholder="理由,非必填"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-8">
                        <button type="submit" class="btn btn-primary"ng-disabled="form.$invalid">提交</button>

                    </div>
                </div>
            </form>
        </div>

        <!-- END CONTENT -->

</div>

