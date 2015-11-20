<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title>创建分类</title>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>

</head>
<body ng-app="app">
    <div class="container table-bordered bg-success"  ng-controller='cityCtrl'>
        <div class="text-info text-center" style="margin-top: 60px;margin-bottom: 60px;">创建分类</div>
        <div class="row table-bordered bg-success">
            <form role="form"  action="${path}/admin/product_category/new" name="productCategoryForm" method="post">
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-2 col-sm-2  text-right">创建方式</div>
                    <div class="col-lg-6 col-sm-6 form-inline">

                        <input type="radio" value="1" data-ng-click="" name="categoryType" ng-model="categoryType">创建新的大类
                        <input type="radio" value="2" data-ng-click="" name="categoryType" ng-model="categoryType">使用已有大类

                    </div>
                </div>
                <div ng-if="categoryType==='1'">
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                        <div class="col-lg-2 col-sm-2  text-right">创建大类</div>
                        <div class="col-lg-6 col-sm-6 form-inline">
                            <div>
                                <input type="text" name="categoryName" placeholder="输入大类名称" ng-model="$parent.productCategory"/>
                            </div>

                        </div>
                    </div>
                </div>
                <div ng-if="categoryType==='2'">
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="list.length>0">
                        <div class="col-lg-2 col-sm-2  text-right">选择大类</div>
                        <div class="col-lg-6 col-sm-6 form-inline">
                            <div>
                                <select ng-model="$parent.$parent.productCategory" ng-options="obj as obj.categoryName for obj in list" name="productCategory" >
                                    <option>--选择大类--</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="!list.length ||list.length==0">
                        <div class="col-lg-2 col-sm-2  text-right">选择大类</div>
                        <div class="col-lg-6 col-sm-6 form-inline">
                            <div>
                                没有已有的大类数据，请创建一个新的大类：
                                <input type="text" name="categoryName" placeholder="输入大类名称" ng-model="$parent.$parent.productCategory"/>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-if="productCategory">
                    <div class="col-lg-2 col-sm-2  text-right">为大类创建小类</div>
                    <div class="col-lg-6 col-sm-6 form-inline">
                        <div>
                            <input type="text" name="subCategoryName" placeholder="输入小类名称"/>
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
        $scope.noSortFit=false;
        $scope.showSort=function(){
            $scope.noSortFit=!$scope.noSortFit;
        }
        $http.get('${path}/admin/product/categories').success(function (data) {
            $scope.list = data;
//            $scope.list = [];
        });
        $scope.$watch('categoryType', function(newVal,oldVal,scope) {
            if(newVal!==oldVal) {
                $scope.productCategory =undefined;
            }
        });
    }]);
    angular.bootstrap(document, ['app']);
</script>