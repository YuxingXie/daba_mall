<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='ProductSeriesListController'>
    <div class="row btn-group btn-group-xs">
            <a href="${path}/admin/index/index" class="btn btn-primary"><i class="fa fa-reply"></i> 返回首页</a>
            <a href="${path}/admin/product_series/create_input" class="btn btn-primary"><i class="fa fa-plus"></i> 新增商品</a>
            <a href="${path}/admin/product_series/list" class="btn btn-primary"><i class="fa fa-refresh"></i> 刷新</a>
    </div>
    <div class="row form-inline font-size-13-5">
        <div class="col-sm-9 col-lg-9" ng-if="categories.length">
            <div class="inline-block margin-top-10">
                选择分类：
                <select ng-model="productCategory" ng-change="byCategory(productCategory)"
                        ng-options="productCategory.categoryName for productCategory in categories"
                        name="form-productCategory" class="form-control input-sm">
                    <option>--选择大类--</option>
                </select>
                <select ng-model="productSeries.productSubCategory" required="true" name="form-productSubCategory"
                        class="form-control input-sm"  ng-change="bySubCategory(productSeries.productSubCategory)"
                        ng-options="productSubCategory.subCategoryName for productSubCategory in productCategory.productSubCategories">
                </select>
            </div>
            <div class="inline-block margin-top-10">
                <input type="text" placeholder="产品名" class="form-control input-sm" style="width: 200px;" ng-model="name"/>
                <button class="btn btn-primary btn-sm" data-ng-click="byName(name)" ng-disabled="!name">搜索产品</button>
            </div>
        </div>

    </div>
    <div class="row table-responsive padding-top-15">
        <table class="table table-hover">
            <tr>
                <th>产品名称</th>
                <th>产品价格</th>
                <th>产品库存</th>
                <th>分类</th>
                <th>操作</th>
            </tr>
            <tr ng-repeat="productSeries in list">
                <td class="font-size-12">{{productSeries.name}}</td>
                <td class="font-size-12">{{productSeries.currentPrice.price}}</td>
                <td class="font-size-12">{{productSeries.productStore.remain}}</td>
                <td class="font-size-12">{{productSeries.productSubCategory.productCategory.categoryName}}/{{productSeries.productSubCategory.subCategoryName}}</td>
                <td class="font-size-12 btn-group btn-group-xs">
                    <a ng-href="${path}/admin/adjust_price/{{productSeries.id}}" class="btn btn-primary"><i class="fa fa-dollar"></i> 调价</a>
                    <a ng-href="${path}/admin/adjust_store/{{productSeries.id}}" class="btn btn-primary"><i class="fa fa-cubes"></i> 调整库存</a>
                    <a ng-href="${path}/admin/adjust_sort/{{productSeries.id}}" class="btn btn-primary"><i class="fa fa-paperclip"></i> 调整分类</a>
                    <a href="javascript:void(0)" ng-click="remove(productSeries)" class="btn btn-primary"><i class="fa fa-trash"></i> 删除</a>
                </td>
            </tr>
            <tr ng-if="!list ||!list.length"><th class="text-warning font-size-13-5" colspan="5">没有找到符合的商品</th></tr>
        </table>
    </div>
</div>


