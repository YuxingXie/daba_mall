<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<body ng-app="bankApp">
<div ng-controller='bankCtrl'>
    <h3>银行管理</h3>
        <form role="form"
              <%--action="${path}/admin/bank/new" --%>
              name="bankForm" method="post">
            <fieldset>
                <div class="form-group has-feedback padding-bottom-40">
                    <div class="col-lg-2 col-sm-2 control-label text-right">银行名称</div>
                    <div class="col-lg-9 col-sm-9 has-success">
                        <input type="text" name="name" ng-model="bank.name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group has-feedback padding-bottom-40">
                    <div class="col-lg-2 col-sm-2 control-label text-right">银行代码</div>
                    <div class="col-lg-9 col-sm-9 has-success">
                        <input type="text" name="code" ng-model="bank.code"
                               class="form-control" placeholder="如:工商银行代码为icbc"/>
                    </div>
                </div>
                <div class="form-group has-feedback padding-bottom-40">
                    <div class="col-lg-2 col-sm-2 control-label text-right">银行图标</div>
                    <div class="col-lg-9 col-sm-9 has-success">
                        <input type="file" name="ico" ng-model="bank.ico"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group has-feedback padding-bottom-40">
                    <div class="col-lg-2 col-sm-2 control-label text-right">卡种类</div>
                    <div class="col-lg-8 col-sm-8 has-success table-bordered bg-light-blue">
                        <fieldset>
                            <div class="form-group padding-bottom-20">
                                <div class="col-lg-3 col-sm-3 control-label text-right">卡名称</div>
                                <div class="col-lg-8 col-sm-8 has-success">
                                    <input type="text" name="bank.cardSort[0].cardName" ng-model="bank.cardSort[0].cardName"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group padding-bottom-20">
                                <div class="col-lg-3 col-sm-3 control-label text-right">卡开始号码</div>
                                <div class="col-lg-8 col-sm-8 has-success">
                                    <input type="text" name="bank.cardSort[0].noStart" ng-model="bank.cardSort[0].noStart"
                                           class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group padding-bottom-20">
                                <div class="col-lg-3 col-sm-3 control-label text-right">何种卡</div>
                                <div class="col-lg-8 col-sm-8 has-success form-inline">
                                    <label>
                                        <input type="radio" name="bank.cardSort[0].cardSort" ng-model="bank.cardSort[0].cardSort"
                                               class="form-control radio" value="1"/>储蓄卡
                                    </label>
                                    <label>
                                        <input type="radio" name="bank.cardSort[0].cardSort" ng-model="bank.cardSort[0].cardSort"
                                               class="form-control radio" value="2"/>信用卡
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-1 col-sm-1 control-label text-right">
                        <input type="button" class="btn btn-primary btn-sm" value="再加一种卡"></div>
                </div>
            </fieldset>
            <input type="submit" value="提交" class="btn btn-primary btn-lg pull-right"/>

        </form>

</div>

