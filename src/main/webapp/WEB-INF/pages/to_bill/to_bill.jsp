<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="form" class="com.dabast.entity.Order" scope="session"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="container" ng-init="matchCode=true" id="bankAppMain">
    <div ng-controller="bankController">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">购物车</a></li>
            <li class="active">大坝收银台</li>
        </ul>
        <div class="shopping-cart-data clearfix">
            <div>
                <form class="form-without-legend" novalidate="novalidate" action="${path}/order/pay" id="form" autocomplete="off" modelAttribute="form">

                    <div class="row">
                        <p class="bg-info col-lg-8 text-left ">订单提交成功，请您尽快付款！ 订单号：${form.id},应付金额<fmt:formatNumber value="${form.totalPrice}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>元</p>
                        <p class="bg-danger text-left col-lg-8" >公告： 请您在6小时内完成支付，否则订单会被自动取消。</p>
                    </div>
                    <div class="row"><br/><br/></div>
                    <div class="row">


                        <ul class="nav nav-tabs">
                            <li class="active" ><a href="#netBank" data-toggle="tab">网银支付</a></li>
                            <li><a href="#shortcuts" data-toggle="tab">快捷支付</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="col-lg-12 col-sm-12 tab-pane fade in active" id="netBank">
                                <div class="form-inline col-lg-12 col-sm-12">
                                    <input type="text" class="bank-code form-control" placeholder="输入银行卡号或简码识别" ng-model="cardNoOrCode"/>
                                    <input type="button" class="btn btn-primary" value="确定"/>
                                </div>
                                <div >
                                    <div ng-repeat="bank in banks">
                                        <div class="col-lg-3 col-sm-3" style="margin-top: 5px;margin-bottom: 5px;">
                                            <a href="#" class="bank-ico" data-code="{{bank.code}}" data-bank-name="{{bank.name}}">
                                            <img src="${path}/statics/assets/plugins/bank/ico/{{bank.ico}}" alt="{{bank.name}}"/></a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-sm-12 tab-pane" id="shortcuts">
                                <div class="form-inline col-lg-12 col-sm-12">
                                    <input type="text" class="bank-code form-control" placeholder="输入银行卡号或简码识别" ng-model="cardNoOrCode"/>
                                </div>
                                <div>
                                    <div ng-repeat="bank in banks">
                                            <div class="col-lg-3 col-sm-3 bank-shortcuts" style="margin-top: 5px;margin-bottom: 5px;"
                                                 data-code="{{bank.code}}"  data-bank-name="{{bank.name}}" data-ico="{{bank.ico}}" ng-if="matches(bank)">
                                                <a href="#" class="bank-ico" data-code="{{bank.code}}"  data-bank-name="{{bank.name}}" data-ico="{{bank.ico}}">
                                                    <img src="${path}/statics/assets/plugins/bank/ico/{{bank.ico}}" alt="{{bank.name}}"/></a>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal fade active" id="shortcutsPayModal" tabindex="-1" role="dialog" aria-labelledby="shortcutsPayModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <h2 class="modal-title" id="shortcutsPayModalLabel">
                            快捷付款
                        </h2>
                    </div>
                    <form method="post" name="billForm" action="${path}/order/pay">
                        <input type="hidden" value="${order.id}" name="orderId"/>
                        <div class="modal-body table-bordered">
                            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small"><i class="fa fa-bank"></i>付款银行</div>
                                <div class="col-lg-6 col-sm-6" name="bankName"></div>

                            </div>
                            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small bg-success"><i class="fa fa-cc-visa"></i>卡种</div>
                                <div class="col-lg-6 col-sm-6 form-inline bg-success">
                                    <a href="javascript:void(0)"><label><input type="radio" name="cardSort" value="1" required="true" ng-model="cardSort" class="form-control form-control-inline"/>信用卡</label></a>
                                    <a href="javascript:void(0)"><label><input type="radio" name="cardSort" value="2" checked  required="true" ng-model="cardSort" class="form-control form-control-inline"/>储蓄卡</label></a>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small"><i class="fa fa-credit-card"></i>银行卡号</div>
                                <div class="col-lg-6 col-sm-6">
                                    <input type="text" class="form-control" required="true" name="cardNo"/>
                                </div>
                            </div>
                            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small bg-success"><i class="fa fa-user fa-fw"></i>姓名</div>
                                <div class="col-lg-4 col-sm-4 bg-success">
                                    <input type="text" class="form-control " value="${order.user.name}" required="true" name="cardUserName"/>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small">身份证</div>
                                <div class="col-lg-6 col-sm-6">
                                    <input type="text" name="cardUserIdCardNo" class="form-control" value="${order.user.idCardNo}" required="true"/>
                                </div>
                            </div>
                            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small bg-success"><i class="fa fa-mobile fa-fw"></i>手机号</div>
                                <div class="col-lg-6 col-sm-6 bg-success">
                                    <input type="text" name="cardUserPhone" class="form-control " value="${order.user.phone}" required="true"/>
                                </div>
                            </div>

                            <div class="row" ng-if="cardSort==1&&isShow">
                                <div class="col-lg-8 col-sm-8" name="credit_card_example"><img src="${path}/statics/assets/plugins/bank/credit_card_example.jpg"></div>
                            </div>
                            <div class="form-group row" ng-show="cardSort==1">
                                <div class="col-lg-2 col-sm-2 text small"><i class="fa fa-clock-o"></i>有效期</div>
                                <div class="input-group date form_date col-lg-6 col-sm-6" >
                                    <input class="form-control" size="16" type="text" name="cardValidDate" required="true"/>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                            </div>
                            <div class="row " style="margin-bottom: 15px;margin-top: 15px;" ng-if="cardSort==1">
                                <div class="col-lg-2 col-sm-2 text small bg-success"><i class="fa fa-reorder"></i>卡验证码</div>
                                <div class="col-lg-6 col-sm-6 bg-success">
                                    <input type="text" name="cardValidateCode" class="form-control bg-success" required="true" placeholder="签名栏后3位数"/>

                                </div>
                                <div class="col-lg-2 col-sm-2 checkbox-inline">
                                    <label>
                                        <input type="checkbox" data-ng-click="showPic()"/>看示例
                                    </label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                                <div class="col-lg-2 col-sm-2 text small"></div>
                                <div class="col-lg-6 col-sm-6">
                                    <input type="checkbox" value="${order.user.phone}" required="true"/><a href="${path}/statics/docs/kuaijiezhifuyonghuxieyi.html" target="_blank">《大坝快捷支付用户协议》</a>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer row">
                            <div class="col-lg-2 col-sm-2"></div>
                            <div class="col-lg-4 col-sm-4">
                                <input type="submit" value="同意开通并支付" class="btn btn-primary" ng-disabled="billForm.$invalid"/>
                            </div>
                            <div class="col-lg-2 col-sm-2">
                                <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;">关闭</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
