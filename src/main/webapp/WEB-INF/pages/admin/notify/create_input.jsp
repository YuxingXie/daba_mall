<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div ng-controller='psiCtrl'>
    <a href="${path}/admin/product_series/list" class="btn btn-primary"><i class="fa fa-reply"></i> 返回商品列表</a>
        <div class="row table-bordered">
            <form role="form" name="productSeriesForm" id="form" method="post" enctype="multipart/form-data" action="${path}/admin/product_series/update_img">
                <div class="row" ng-if="!productSeries.id" >
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">产品名称</div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="text" class="form-control" ng-required="true" name="name" ng-model="productSeries.name"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">价格</div>
                        <div class="col-lg-4 col-sm-4">
                            <input type="text" class="form-control " required="true" name="price" ng-model="productSeries.productSeriesPrices[0].price"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">计量单位</div>
                        <div class="col-lg-4 col-sm-4">
                            <input type="text" class="form-control " required="true" name="measurementUnit" ng-model="productSeries.measurementUnit"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">宣传册</div>
                        <div class="col-lg-2 col-sm-2 form-inline">
                            <label>图片<input type="radio" class="radio form-control" required="true" name="productBrochuresType" ng-model="productSeries.productBrochures.type" value="img"/></label>
                            <label>网页<input type="radio" class="radio form-control" required="true" name="productBrochuresType" ng-model="productSeries.productBrochures.type" value="page"/></label>
                        </div>
                        <div class="col-lg-6 col-sm-6">url:<input type="text" class="form-control" ng-model="productSeries.productBrochures.url"/></div>
                    </div>
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right ">产品描述</div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="text" name="form-description" class="form-control" required="true" ng-model="productSeries.description"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">品牌</div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="text" name="form-brand" class="form-control " required="true" ng-model="productSeries.brand"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">库存数量</div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="number" name="form-storeAmount" class="form-control " required="true" ng-model="productSeries.productStore.inAndOutList[0].amount"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">库存警告数量</div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="number" name="form-warningAmount" class="form-control " required="true" ng-model="productSeries.productStore.warningAmount"/>
                        </div>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">产品分类</div>
                        <div class="col-lg-6 col-sm-6 form-inline">
                            <div ng-if="categories.length">
                                大类：
                                <select ng-model="productCategory" ng-options="productCategory.categoryName for productCategory in categories" name="form-productCategory" class="form-control">
                                    <option>--选择大类--</option>
                                </select>
                                <label ng-show="productCategory.productSubCategories.length>0">
                                    小类：
                                    <select ng-model="productSeries.productSubCategory" required="true" name="form-productSubCategory" class="form-control"
                                            ng-options="productSubCategory.subCategoryName for productSubCategory in productCategory.productSubCategories">
                                        <%--<option ng-repeat="productSubCategory in productCategory.productSubCategories" value="{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</option>--%>
                                    </select>
                                </label>
                                <label class=" form-inline">没有找到分类？点<a href="${path}/admin/product_category/create_input" target="_blank">这里</a>新建产品分类</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2 text-right">
                            <a class="btn btn-primary btn-xs fa fa-plus-circle" data-ng-click="addNewProperty()">添加属性</a></div>
                        <div class="col-lg-10 col-sm-10">
                            <div class="row" data-property-index="0" ng-repeat="productProperty in productSeries.productProperties track by $index">
                                <div class="row">
                                    <div class="col-lg-5 col-sm-5">
                                        <input type="text" class="form-control propertyName margin-bottom-10" placeholder="属性名，如:包装"  ng-model="productSeries.productProperties[$index].propertyName"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div ng-class="{'col-lg-2 col-sm-2':true}" ng-repeat="productPropertyValue in productProperty.propertyValues track by $index">
                                        <input type="text" class="form-control" placeholder="属性值" ng-model="productSeries.productProperties[$parent.$index].propertyValues[$index].value"/>
                                    </div>
                                </div>
                                <div class="row margin-bottom-15">
                                    <a class="fa fa-plus-circle" href="javascript:void(0)" data-ng-click="newPropertyValue($index)">增加一个属性值</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right ">
                            <input type="hidden" name="productSeries" id="productSeries"/>
                        </div>
                        <div class="col-lg-6 col-sm-6">
                            <input type="button" value="提交" class="btn btn-primary" data-ng-click="submit()" />

                        </div>
                    </div>
                </div>

                <div class="row"  style="margin-bottom: 15px;margin-top: 15px;" ng-show="productSeries.id" >
                    <div class="row">
                        <h4 class="text-center">为产品添加图片</h4>
                    </div>
                    <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">产品图片</div>
                        <div class="col-lg-6 col-sm-6 ">
                            <div class="form-group">
                                <input name="files" id="files" class="file" type="file" multiple data-preview-file-type="any" data-show-upload="false"
                                       data-preview-file-icon="" data-preview-class="bg-info clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-sm-8"><input type="hidden" name="productSeriesId" id="productSeriesId"/></div>
                        <div class="col-lg-4 col-sm-4"><input type="submit" value="上传" class="btn btn-primary"/></div>
                    </div>
                </div>

            </form>

        </div>

</div>
