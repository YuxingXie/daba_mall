<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='AdjustStoreController'>
    <div class="row margin-bottom-10"><h4>调整商品分类</h4></div>
    <div class="row margin-bottom-10"><b>商品名称：</b>${productSeries.name}</div>
    <div class="row margin-bottom-10"><b>所在分类：</b>${productSeries.productSubCategory.productCategory.categoryName}/${productSeries.productSubCategory.subCategoryName}</div>
    <div class="row margin-bottom-10"><h4>选择一个分类后，将该产品加入该分类</h4></div>
    <div class="row margin-bottom-10">
        <form action="${path}/admin/do/adjust_sort" method="post" class="form-without-legend" novalidate="novalidate" name="form">
            <fieldset>
                <input type="hidden" name="productSeriesId" value="${productSeries.id}" />
                <input type="hidden" name="subCategoryId" id="subCategoryId" />
                <div class="row margin-top-10">
                    <div class="col-lg-2 col-sm-2">大类：</div>
                    <div class="col-lg-10 col-sm-10">
                        <select ng-model="productCategory"
                                ng-options="productCategory.categoryName for productCategory in categories"
                                name="form-productCategory" class="form-control form-group-sm">
                            <option>--选择大类--</option>
                        </select>
                    </div>
                </div>
                <div class="row margin-top-10">
                    <div class="col-lg-2 col-sm-2">小类：</div>
                    <div class="col-lg-10 col-sm-10">
                        <select ng-model="productSeries.productSubCategory" required="true" name="form-productSubCategory"
                                class="form-control form-group-sm" ng-change="getProductSubCategory(productSeries.productSubCategory)"
                                ng-options="productSubCategory.subCategoryName for productSubCategory in productCategory.productSubCategories">
                        </select>
                    </div>
                </div>

                <div class="row margin-top-10">
                    <input type="submit" class="btn btn-primary pull-right margin-right-20" value="确定" ng-disabled="!productSeries.productSubCategory"/>
                </div>
            </fieldset>
        </form>
    </div>
</div>


