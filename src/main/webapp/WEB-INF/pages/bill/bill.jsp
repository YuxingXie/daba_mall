<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>

<div class="main" ng-app="bank" ng-init="matchCode=true">
    <div class="container" ng-controller="bankController">
        <ul class="breadcrumb">
            <%--<li><a href="${path}">首页</a></li>--%>
            <%--<li><a href="">购物车</a></li>--%>
            <%--<li class="active">填写订单</li>--%>
            <li>大坝收银台</li>
        </ul>
        <div class="shopping-cart-data clearfix">
            <div>
                <form class="form-without-legend" novalidate="novalidate" action="${path}/index/order/submit" id="form" autocomplete="off">
                    <div class="row">
                        <p class="bg-info col-lg-8 text-left ">订单提交成功，请您尽快付款！ 订单号：${order.id},应付金额${order.totalPrice}元</p>
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
                                    <input type="button" class="btn btn-primary" value="确定"/>
                                </div>
                                <div>
                                    <div ng-repeat="bank in banks">
                                            <div class="col-lg-3 col-sm-3 bank-shortcuts" style="margin-top: 5px;margin-bottom: 5px;" ng-if="matchCode"
                                                 data-code="{{bank.code}}"  data-bank-name="{{bank.name}}" data-ico="{{bank.ico}}">
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
        <div class="modal fade" id="shortcutsPayModal" tabindex="-1" role="dialog" aria-labelledby="shortcutsPayModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                        <h2 class="modal-title" id="shortcutsPayModalLabel">
                            快捷付款
                        </h2>
                    </div>
                    <div class="modal-body table-bordered">
                        <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small">付款银行</div>
                            <div class="col-lg-6 col-sm-6" name="bankName"></div>
                        </div>
                        <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small bg-success">卡种</div>
                            <div class="col-lg-6 col-sm-6 form-inline">
                                <div class="radio ">
                                    <label><input type="radio" name="cardSort" value="1"/>信用卡</label>
                                </div>
                                <div class="radio">
                                    <label><input type="radio" name="cardSort" value="2" checked/>储蓄卡</label>
                                </div>

                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small">银行卡号</div>
                            <div class="col-lg-6 col-sm-6">
                                <input type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small bg-success">姓名</div>
                            <div class="col-lg-4 col-sm-4">
                                <input type="text" class="form-control " value="${order.user.name}"/>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small">身份证</div>
                            <div class="col-lg-6 col-sm-6">
                                <input type="text" name="idCardNo" class="form-control" value="${order.user.idCardNo}"/>
                            </div>
                        </div>
                        <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small bg-success">手机号</div>
                            <div class="col-lg-6 col-sm-6">
                                <input type="text" name="phone" class="form-control " value="${order.user.phone}"/>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                            <div class="col-lg-2 col-sm-2 text small"></div>
                            <div class="col-lg-6 col-sm-6">
                                <input type="checkbox" value="${order.user.phone}"/><a href="${path}/statics/docs/kuaijiezhifuyonghuxieyi.html" target="_blank">《大坝快捷支付用户协议》</a>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer row">
                        <div class="col-lg-2 col-sm-2"></div>
                        <div class="col-lg-4 col-sm-4"><input type="button" value="同意开通并支付" class="btn btn-primary"/></div>
                        <div class="col-lg-2 col-sm-2">
                            <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true" style=" width:100%;">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
