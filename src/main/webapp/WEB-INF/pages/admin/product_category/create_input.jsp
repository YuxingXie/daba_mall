<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div ng-controller='ProductCategoryCtrl'>
    <h3>创建分类</h3>
    <div class="row table-bordered">
        <form role="form"  action="${path}/admin/product_category/new" name="productCategoryForm" method="post">
            <div class="row margin-top-10">
                <div class="col-lg-2 col-sm-2  text-right">
                    <label class="control-label">创建方式</label>
                </div>
                <div class="col-lg-6 col-sm-6 form-inline">
                    <label><input type="radio" value="1" name="categoryType" ng-model="categoryType">创建新的大类</label>
                    <label><input type="radio" value="2" name="categoryType" ng-model="categoryType" >使用已有大类</label>
                </div>
            </div>
            <div class="row margin-top-10" ng-if="categoryType==='1'">
                <div class="col-lg-3 col-sm-3 text-right padding-top-8">
                    创建大类
                </div>
                <div class="col-lg-7 col-sm-7 ">
                    <input class="form-control" type="text" name="categoryName" placeholder="输入大类名称" ng-model="$parent.productCategory"/>
                </div>
            </div>
            <div class="row margin-top-10" ng-if="categoryType==='2'&&list.length">
                    <div class="col-lg-3 col-sm-3 text-right padding-top-8">
                        选择大类
                    </div>
                <div class="col-lg-7 col-sm-7">
                        <select class="form-control " ng-model="$parent.productCategory" name="productCategoryId" >
                            <option ng-repeat="item in list" value="{{item.id}}">{{item.categoryName}}</option>
                        </select>
                </div>
            </div>
            <div class="row margin-top-10" ng-if="categoryType==='2'&&(!list.length ||list.length==0)">
                        <div class="col-lg-3 col-sm-3 text-right padding-top-8">没有大类数据，请创建：</div>
                        <div class="col-lg-7 col-sm-7">
                            <input type="text" name="categoryName" class="form-control" placeholder="输入大类名称" ng-model="$parent.productCategory"/>
                        </div>
            </div>

            <div class="row margin-top-10" ng-if="productCategory">
                <div class="col-lg-3 col-sm-3 text-right padding-top-8">为大类创建小类</div>
                <div class="col-lg-7 col-sm-7">
                    <input type="text" name="subCategoryName" placeholder="输入小类名称" class="form-control" ng-model="$parent.subCategoryName"/>
                </div>
            </div>
            <div class="row margin-top-10">
                <div class="col-lg-3 col-sm-3 text-right padding-top-8"></div>
                <div class="col-lg-7 col-sm-7">
                    <input type="submit" value="提交" class="btn btn-primary pull-right" ng-disabled="!subCategoryName"/>
                </div>
            </div>

        </form>

    </div>
</div>

