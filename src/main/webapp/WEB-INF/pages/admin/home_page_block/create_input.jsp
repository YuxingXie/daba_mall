<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="HomePageBlockInputController">
    <div class="margin-top-10 margin-bottom-20 margin-left-20">新增首页区块</div>

    <div class="row table-bordered">
        <form name="form" id="form"ng-submit="submit()">
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">区块标题</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" class="form-control" required="true" name="title" ng-model="homePageBlock.title"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">区块描述</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" class="form-control " required="true" name="description" ng-model="homePageBlock.description"/>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right ">无产品时描述</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="descriptionWhenEmpty" class="form-control" required="true" ng-model="homePageBlock.descriptionWhenEmpty"/>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right ">是否生效</div>
                <div class="col-lg-6 col-sm-6 form-inline">
                    <label class="control-label">
                        <input type="checkbox" name="show" class="form-control checkbox" ng-model="homePageBlock.show"/>
                    </label>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-12 col-sm-12 text-center"><h3>请选择产品</h3></div>


            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">

                <div class="col-lg-12 col-sm-12 text-center">
                    <span ng-repeat="productSeriesSelected in productSeriesSelectedList track by $index">
                        <a class=" pull-left"><img  ng-if="productSeriesSelected" ng-src="${path}/{{productSeriesSelected.pictures[0].iconPicture}}"/>{{productSeriesSelected.name}}</a>
                    </span>
                </div>

            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-12 col-sm-12 table-responsive">
                    <table class="table table-hover">
                        <tr>
                            <th>产品名称</th>
                            <th>价格</th>
                            <th>上架日期</th>
                            <th>分类</th>
                            <th>选择</th>
                        </tr>
                        <tr ng-repeat="productSeries in productSeriesList">
                            <td><img ng-src="${path}/{{productSeries.pictures[0].iconPicture}}"/>{{productSeries.name}}</td>
                            <td>{{productSeries.currentPrice.price}}</td>
                            <td>{{productSeries.shelvesDate | date:'yyyy-MM-dd hh:mm'}}</td>
                            <td>{{productSeries.productSubCategory.productCategory.categoryName}} {{productSeries.productSubCategory.subCategoryName}}</td>
                            <td ng-init="checked=false;productSeriesSelectedList[$index]=null;">
                                <input type="checkbox" ng-click="checked=!checked;addToList(checked,$index,productSeries)" ng-checked="checked"/></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-6 col-sm-6  text-right ">
                </div>
                <div class="col-lg-6 col-sm-6">
                    <input type="submit" value="提交" ng-disabled="form.$invalid" class="btn btn-primary"/>
                </div>
        </div>
        </form>

    </div>

</div>
