<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="form" class="com.dabast.entity.Order" scope="session"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<div class="container" ng-init="matchCode=true" id="bankAppMain">
    <div ng-controller="bankController" ng-init="useAccountPay=true">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">购物车</a></li>
            <li class="active">大坝收银台</li>
        </ul>
        <%--<div class="shopping-cart-data clearfix"></div>--%>
            <%--<div></div>--%>
                <form class="form-without-legend" novalidate="novalidate" action="${path}/order/pay" id="form" autocomplete="off" modelAttribute="form">

                    <div class="row">
                        <p class="text-info col-lg-8 text-left ">订单提交成功，请您尽快付款！ 订单号：${form.id},应付金额<fmt:formatNumber value="${form.totalPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>元</p>
                        <p class="text-danger text-left col-lg-8" >公告： 请您在6小时内完成支付，否则订单会被自动取消。</p>
                    </div>
                    <div ng-show="useAccountPay">
                        <div class="form-group form-inline">
                            <span ng-show="accounts &&accounts.length">
                                <label class="control-label">银行卡</label>
                                                                <label class="control-label">
                                                                    <img class="img-ico-md" ng-src="${path}/statics/assets/plugins/bank/ico/{{useAccount.bank.ico}}" alt="{{useAccount.bank.name}}"/>
                                                                </label>

                                <select class="form-control" ng-model="useAccount"
                                        ng-options="useAccount as useAccount.bank.name+' '+useAccount.cardNo+' '+useAccount.cardSortString for useAccount in accounts">
                                </select>
                            </span>
                            <label class="control-label" ng-show="!accounts||!accounts.length">您没有在本站使用过银行卡 </label>
                            <label class="control-label"><a class="btn btn-sm btn-primary fa fa-credit-card" ng-click="useAccountPay=!useAccountPay">使用新银行卡</a></label>
                            <label class="control-label">支付<fmt:formatNumber value="${form.totalPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>元</label>
                        </div>
                        <div ng-show="accounts &&accounts.length" class="form-group form-inline">
                            <div class="center-block"><a type="button" class="fa fa-credit-card fa-lg btn btn-danger btn-lg">立即支付</a> </div>
                        </div>
                    </div>
                    <div class="row form-horizontal" ng-show="!useAccountPay">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#netBank" data-toggle="tab">网银支付</a></li>
                            <li><a href="#shortcuts" data-toggle="tab">快捷支付</a></li>
                        </ul>
                        <div class="form-inline">
                            <input type="text" class="bank-code form-control" placeholder="输入银行卡号或简码识别" ng-model="cardNoOrCode"/>
                            <a class="fa fa-history btn btn-xs btn-primary" ng-click="useAccountPay=!useAccountPay">返回我的银行卡</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="netBank">

                            </div>
                            <div class="tab-pane" id="shortcuts">
                                <div>
                                    <div ng-repeat="bank in banks">
                                            <div class="col-lg-3 col-sm-3 bank-shortcuts" style="margin-top: 5px;margin-bottom: 5px;"
                                                 data-code="{{bank.code}}"  data-bank-name="{{bank.name}}" data-ico="{{bank.ico}}" ng-if="matches(bank)">
                                                <a href="#" class="bank-ico" ng-click="shortcutsPay(bank)">
                                                    <img ng-src="${path}/statics/assets/plugins/bank/ico/{{bank.ico}}" alt="{{bank.name}}"/></a>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>


        <div class="modal fade active" id="shortcutsPayModal" tabindex="-1" role="dialog" aria-labelledby="shortcutsPayModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <h2 class="modal-title" id="shortcutsPayModalLabel">
                            快捷付款
                        </h2>
                    </div>
                    <form method="post" name="billForm" id="billForm" ng-submit="submit()"
                          <%--action="${path}/order/pay"--%>
                            >
                        <div class="modal-body table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <td width="20%" class="text-left"><i class="fa fa-bank padding-top-15">付款银行</i></td>
                                    <td class="text-left">
                                        <img src="${path}/statics/assets/plugins/bank/ico/{{bank.ico}}"/>
                                        <input type="hidden" ng-init="order.id='${form.id}'" name="orderId" ng-model="order.id"/>
                                        <%--<input type="hidden" ng-init="order.payAccount.bank.id=bank.id" name="bankId" ng-model="order.payAccount.bank.id"/>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left"><i class="fa fa-adjust padding-top-10">卡种</i></td>
                                    <td class="text-left form-inline">
                                        <label><input type="radio" card_type_valid name="cardSort" value="1" required="true" ng-model="order.payAccount.cardSort" class="radio form-control"/>信用卡</label>&nbsp;&nbsp;&nbsp;
                                        <label><input type="radio" card_type_valid name="cardSort" value="2" required="true" ng-model="order.payAccount.cardSort" class="radio form-control"/>储蓄卡</label>
                                        <label class="control-label" ng-show="billForm.cardSort.$error.validCardType">信用卡必须输入有效期和卡验证码</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left"><i class="fa fa-cc-visa padding-top-10">银行卡号</i></td>
                                    <td class="text-left">
                                        <input type="text" class="form-control" required="true" name="cardNo" ng-model="order.payAccount.cardNo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left"><i class="fa fa-user padding-top-10">姓名</i></td>
                                    <td class="text-left">
                                        <input type="text" class="form-control " ng-init="order.payAccount.cardUserName='${order.user.name}'" required="true" name="cardUserName" ng-model="order.payAccount.cardUserName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left"><i class="fa fa-credit-card padding-top-10">身份证</i> </td>
                                    <td class="text-left">
                                        <input type="text" name="cardUserIdCardNo" class="form-control" ng-init="order.payAccount.cardUserIdCardNo='${order.user.idCardNo}'" required="true"  ng-model="order.payAccount.cardUserIdCardNo"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-left"><i class="glyphicon glyphicon-phone padding-top-10">手机号</i></td>
                                    <td class="text-left">
                                        <input type="text" name="cardUserPhone" class="form-control " ng-init="order.payAccount.cardUserPhone='${order.user.phone}'" required="true" ng-model="order.payAccount.cardUserPhone"/>
                                    </td>
                                </tr>


                                <tr ng-show="account.cardSort==1" class="text-left">
                                    <td class="text-left"><i class="fa fa-clock-o">有效期</i></td>
                                    <td class="input-group date form_date text-left">
                                        <input class="form-control" style="width: 150px;" size="16" type="text" name="cardValidDate" ng-model="$parent.order.payAccount.cardValidDate"/>
                                        <span class="input-group-addon pull-left"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon pull-left"><span class="glyphicon glyphicon-calendar"></span></span>
                                    </td>
                                </tr>
                                <tr ng-show="account.cardSort==1">
                                    <td class="text-left"><i class="fa fa-reorder">卡验证码</i></td>
                                    <td class="text-left form-inline">
                                        <input type="text" style="width: 150px;" name="cardValidateCode" ng-model="$parent.order.payAccount.cardValidateCode" class="form-control bg-success" placeholder="签名栏后3位数"/>
                                        <label class="control-label"><input type="checkbox" data-ng-click="showPic()" class="form-control checkbox"/>看示例</label>
                                    </td>
                                </tr>
                                <tr ng-if="cardSort==1&&isShow">
                                    <td name="credit_card_example" class="text-left" colspan="2">
                                        <img src="${path}/statics/assets/plugins/bank/credit_card_example.jpg" class="img-responsive">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="text-left form-inline">
                                        <div class="center-block">
                                            <label class="control-label">
                                                <input type="checkbox" value="${order.user.phone}" required="true" class="checkbox form-control" ng-model="xy"/>《大坝快捷支付用户协议》
                                            </label>
                                            <a href="${path}/statics/docs/kuaijiezhifuyonghuxieyi.html" target="_blank" class="fa fa-book">阅读</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td class="form-inline">
                                        <button type="button" class="btn btn-primary modal-close  form-control pull-right margin-left-20" data-dismiss="modal" aria-hidden="true">关闭</button>
                                        <input type="submit" value="同意开通并支付" class="btn btn-primary form-control pull-right" ng-disabled="billForm.$invalid"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%--<div class="modal-footer">--%>

                        <%--</div>--%>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
