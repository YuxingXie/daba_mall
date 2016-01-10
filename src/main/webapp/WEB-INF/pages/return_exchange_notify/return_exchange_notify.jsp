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
                            <div class="col-lg-2"><label class="control-label pull-right margin-top-10">来自订单</label></div>
                            <div ng-class="{'col-lg-6':true,'has-error':form.order.$invalid,'has-success':form.order.$valid}">
                                <select ng-model="order" name="order" ng-options="order.id for order in orders" class="form-control" required="true"></select>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-2"><label class="control-label pull-right">退/换数量</label></div>
                            <div class="col-lg-9">
                                <%--<div class="row padding-top-5" ng-repeat="productSelected in returnList">--%>
                                <div class="row padding-top-5" ng-repeat="productSelected in order.productSelectedList">

                                    <div class="col-sm-2 col-lg-2">
                                        {{productSelected.productSeries.name}}
                                        <span class="padding-top-6" ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.value}}</span>
                                        &times;{{productSelected.amount}}
                                    </div>
                                    <div class="col-sm-10 col-lg-10 text-left form-inline">
                                            <span ng-repeat="returnExchange in productSelected.returnExchangeList">
                                                {{returnExchange.date | date:'yyyy-MM-dd'}}
                                                <span ng-if="returnExchange.type==='return'">退货</span>
                                                <span ng-if="returnExchange.type==='exchange'">换货</span>
                                                数量：{{returnExchange.amount}}。
                                            </span>
                                    </div>
                                    <div class="col-sm-2 col-lg-2">

                                    </div>
                                    <div class="col-sm-10 col-lg-10 text-left form-inline">
                                        <label class="control-label">
                                            <select ng-model="productSelected.returnExchange.type" required="true" class="form-control">
                                                <option></option>
                                                <option value="return">退货</option>
                                                <option value="exchange">换货</option>
                                            </select>
                                        </label>
                                        <input class="form-control" ng-if="productSelected.returnExchange.type" style="width: 110px;" type="number" ng-model="productSelected.returnExchange.amount" max="{{productSelected.amount}}" min="1" required="true" placeholder="退/换数量"/>
                                        <input class="form-control" ng-if="productSelected.returnExchange.type" type="text" ng-model="productSelected.returnExchange.reason" placeholder="理由,非必填,20字内" maxlength="20"/>
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

