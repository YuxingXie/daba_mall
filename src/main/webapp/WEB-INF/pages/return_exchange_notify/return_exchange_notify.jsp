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
        <div class="row" ng-if="message">
            <div class="center-block col-lg-8 col-sm-8 col-lg-push-2 col-sm-push-2"><b ng-class="{'text-success':message.success,'text-danger':!message.success}">{{message.message}}</b></div>
        </div>
        <div class="row">
            <form id="form" name="form" class="form-horizontal form-without-legend" role="form" method="post" ng-submit="submit()">
                <div class="modal-body">

                    <fieldset>
                        <div class="form-group has-feedback">
                            <div class="col-lg-2 text-center"><label class="control-label margin-top-10">来自订单</label></div>
                            <div class="col-lg-6">
                                <select ng-model="order" name="order" ng-options="order.id for order in orders" class="form-control padding-left-10" required="true"></select>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-lg-2 text-center"><label class="control-label">退/换数量</label></div>
                            <div class="col-lg-9">
                                <%--<div class="row padding-top-5" ng-repeat="productSelected in returnList">--%>
                                <div class="row padding-top-5" ng-repeat="productSelected in order.productSelectedList">
                                    <div class="row table-bordered">
                                        <div class="row">
                                            <div class="col-sm-2 col-lg-2 padding-top-20">
                                                <img ng-src="${path}/{{productSelected.productSeries.pictures[0].iconPicture}}" class="padding-left-10"/>
                                                {{productSelected.productSeries.name}}
                                            </div>
                                            <div class="col-sm-10 col-lg-10 text-left form-inline padding-top-6">
                                                <span ng-repeat="productPropertyValue in productSelected.productPropertyValueList">{{productPropertyValue.productProperty.propertyName}}:{{productPropertyValue.value}}</span>
                                                &times;{{productSelected.amount}}
                                                <span>退换记录：</span>
                                                <span ng-if="!productSelected.returnExchangeList||!productSelected.returnExchangeList.length">无</span>
                                                <div ng-repeat="returnExchange in productSelected.returnExchangeList">
                                                    {{returnExchange.date | date:'yyyy-MM-dd'}}
                                                    <span ng-if="returnExchange.type==='return'">退货</span>
                                                    <span ng-if="returnExchange.type==='exchange'">换货</span>
                                                    ，数量：{{returnExchange.amount}}
                                                    ，理由：
                                                    <span>{{returnExchange.reason}}</span>
                                                    <span ng-if="!returnExchange.reason">无</span>
                                                    。
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row padding-top-8 padding-bottom-10">
                                            <div class="col-sm-2 col-lg-2 text-right padding-top-6">
                                                退/换货类别:
                                            </div>
                                            <div class="col-sm-10 col-lg-10 text-left form-inline" ng-init="max=getMax(productSelected)">
                                                <label class="control-label" >
                                                    <select ng-model="productSelected.newReturnExchange.type" class="form-control" ng-disabled="max==0" ng-change="defineReturnExchange(productSelected)">
                                                        <option></option>
                                                        <option value="return">退货</option>
                                                        <option value="exchange">换货</option>
                                                    </select>
                                                </label>
                                                <input class="form-control" ng-if="productSelected.newReturnExchange" style="width: 110px;" type="number" ng-model="productSelected.newReturnExchange.amount"

                                                       max="{{max}}" min="1" required="true" placeholder="退/换数量" ng-disabled="max==0"/>
                                                <input class="form-control" ng-if="productSelected.newReturnExchange" type="text" ng-disabled="max==0"
                                                       ng-model="productSelected.newReturnExchange.reason" placeholder="理由,非必填,20字内" maxlength="20"/>
                                                <span ng-if="max==0" class="text-warning fa fa-warning">该商品已全部退/换</span>

                                            </div>
                                        </div>
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

