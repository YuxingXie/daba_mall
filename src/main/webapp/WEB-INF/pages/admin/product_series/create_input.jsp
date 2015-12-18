<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-app="productSeriesInputApp">
    <div class="table-bordered">
        <div class="row table-bordered">
            <form role="form"  action="${path}/admin/product_series/new" name="productSeries" id="form" enctype="multipart/form-data" method="post">
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">产品名称</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="text" class="form-control" required="true" name="name" ng-model="name"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">价格</div>
                    <div class="col-lg-4 col-sm-4">
                        <input type="text" class="form-control " required="true" name="price" ng-model="price"/>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right ">产品描述</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="text" name="description" class="form-control" required="true" model="description"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">品牌</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="text" name="brand" class="form-control " required="true" ng-model="brand"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">库存数量</div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="number" name="storeAmount" class="form-control " required="true" ng-model="storeAmount"/>
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">库存警告数量</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="number" name="warningAmount" class="form-control " required="true" ng-model="warningAmount"/>
                </div>
            </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">产品分类</div>
                    <div class="col-lg-6 col-sm-6 form-inline">
                        <div ng-controller='psiCtrl'>
                            <div ng-if="list.length">
                                大类：
                                <select ng-model="productCategory" ng-options="obj as obj.categoryName for obj in list" name="productCategory" class="form-control">
                                    <option>--选择大类--</option>
                                </select>
                                <label ng-show="productCategory.productSubCategories.length>0">
                                    小类：
                                    <select ng-model="productSubCategoryId" required="true" name="productSubCategoryId" class="form-control">
                                        <option ng-repeat="productSubCategory in productCategory.productSubCategories" value="{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</option>
                                    </select>
                                </label>
                                <label class=" form-inline">没有找到分类？点<a href="${path}/admin/product_category/create_input.jsp">这里</a>新建产品分类</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">产品图片</div>
                    <div class="col-lg-6 col-sm-6 ">
                            重要提示：假设有一个原图xxx.jpg,那么它的大图命名为xxx.zoom.jpg,小图命名为xxx.ico.jpg,则程序可以自动识别这些图的用途。其它格式的图片同理。
                    </div>
                </div>
                <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right"></div>
                    <div class="col-lg-6 col-sm-6 form-group">
                        <div class="form-group">
                            <input name="files" id="file-5" class="file" type="file" multiple data-preview-file-type="any"
                                   data-show-upload="false" data-preview-file-icon="" data-preview-class="bg-info clearfix">
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">property</div>
                    <div class="col-lg-10 col-sm-10">
                        <div class="row" data-property-index="0">
                            <div class="col-lg-2 col-sm-2">
                                <input type="text" class="form-control propertyName" placeholder="属性名，如:包装" data-property-index="0"/>
                            </div>
                            <div class="col-lg-5 col-sm-5">
                                <input type="text" class="form-control propertyValue" placeholder="属性值，如：散装,袋装，多个属性用英文逗号隔开" data-property-index="0"/>
                            </div>
                            <div class="col-lg-3 col-sm-3">
                                <a class="btn btn-primary addNewProperty">再增加一个属性</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right ">
                        <input type="hidden" name="productPropertiesJson" id="productPropertiesJson" value="[]"/>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <input type="submit" value="提交" class="btn btn-primary" />
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>
