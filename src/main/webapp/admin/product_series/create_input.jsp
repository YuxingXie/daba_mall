<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title>输入产品</title>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>

</head>
<body ng-app="app">
<div class="container table-bordered bg-success">
    <div class="text-info text-center" style="margin-top: 60px;margin-bottom: 60px;">输入产品</div>
    <div class="row table-bordered bg-success">
        <form role="form"  action="${path}/admin/product_series/new" name="productSeries" enctype="multipart/form-data" method="post">
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">产品名称</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" class="form-control" required="true" name="name"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">price</div>
                <div class="col-lg-4 col-sm-4">
                    <input type="text" class="form-control " required="true" name="price"/>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right ">description</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="description" class="form-control" required="true"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">brand</div>
                <div class="col-lg-6 col-sm-6">
                    <input type="text" name="brand" class="form-control " required="true" ng-model="brand"/>
                </div>
            </div>
            <div class="row " style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-2 col-sm-2  text-right">产品分类</div>
                <div class="col-lg-6 col-sm-6 form-inline">
                            <div ng-controller='cityCtrl'>
                                <div ng-if="list.length>0 &&!noSortFit">
                                        大类{{productCategory}}：
                                        <select ng-model="productCategory" ng-options="obj as obj.categoryName for obj in list" name="productCategory" >
                                            <option>--选择大类--</option>
                                        </select>
                                    <label ng-show="productSubCategories.length>0">
                                        小类：
                                        <select ng-model="selected2" required="true" name="productSubCategoryId">
                                            <option ng-repeat="productSubCategory in productCategory.productSubCategories" value="{{productSubCategory.id}}">{{productSubCategory.subCategoryName}}</option>
                                        </select>
                                    </label>                    <label class=" form-inline">没有找到分类？点<a href="#">这里</a>新建产品分类</label>

                                </div>
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
</body>
</html>
<script>
    var app = angular.module('app', []);
    app.controller('cityCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.list = [];
        $scope.productSubCategories=[];
        $scope.noSortFit=false;
//        $scope.showSort=function(){
//            $scope.noSortFit=!$scope.noSortFit;
//            if($scope.productSubCategories.length>0)$scope.productSubCategories=[];
//        }
        $http.get('${path}/admin/product/categories').success(function (data) {
            $scope.list = data;
        });
    }]);
    angular.bootstrap(document, ['app']);
</script>