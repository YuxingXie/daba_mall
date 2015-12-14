<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<body ng-app="productCategoryApp">
<div ng-controller='productCategoryCtrl'>
    <h3>创建分类</h3>
    <div class="row table-bordered">
        <form role="form"  action="${path}/admin/product_category/new" name="productCategoryForm" method="post">
            <div class="form-group" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right"><label class="control-label margin-top-10">创建方式</label></div>
                <div class="col-lg-6 col-sm-6 form-inline">
                    <label><input type="radio" value="1" name="categoryType" ng-model="categoryType" class="form-control">创建新的大类</label>
                    <label><input type="radio" value="2" name="categoryType" ng-model="categoryType" class="form-control">使用已有大类</label>
                </div>
            </div>
            <div ng-if="categoryType==='1'">
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">创建大类</div>
                    <div class="col-lg-6 col-sm-6 form-inline">
                        <div>
                            <input class="form-control" type="text" name="categoryName" placeholder="输入大类名称" ng-model="$parent.productCategory"/>
                        </div>

                    </div>
                </div>
            </div>
            <div ng-if="categoryType==='2'">
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="list.length">
                    <%--$parent.$parent.list.length>0--%>
                    <div class="col-lg-2 col-sm-2  text-right">选择大类</div>
                    <div class="col-lg-6 col-sm-6">
                            <select class="form-control " ng-model="$parent.$parent.productCategory" name="productCategoryId" >
                                <option ng-repeat="item in list" value="{{item.id}}">{{item.categoryName}}</option>
                            </select>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="!list.length ||list.length==0">
                    <div class="col-lg-2 col-sm-2  text-right">选择大类</div>
                    <div class="col-lg-6 col-sm-6 form-inline">
                        <div>
                            没有大类数据，请创建一个新的大类：
                            <input type="text" name="categoryName" placeholder="输入大类名称" ng-model="$parent.$parent.productCategory"/>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="productCategory">
                <div class="col-lg-2 col-sm-2  text-right">为大类创建小类</div>
                <div class="col-lg-6 col-sm-6 form-inline">
                    <div>
                        <input type="text" name="subCategoryName" placeholder="输入小类名称" class="form-control"/>
                    </div>

                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right "></div>
                <div class="col-lg-6 col-sm-6">
                    <input type="submit" value="提交" class="btn btn-primary" />
                </div>
            </div>

        </form>

    </div>
</div>

