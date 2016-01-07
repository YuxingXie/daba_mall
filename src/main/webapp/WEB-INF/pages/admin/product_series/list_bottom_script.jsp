<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

    mainApp.controller('ProductSeriesListController', ['$scope', '$http', function ($scope, $http) {
        $scope.categories = [];
        $scope.list=[];
        $scope.productSubCategories = [];
//    $scope.noSortFit=false;
        $http.get('${path}/product_series/categories').success(function (data) {
            $scope.categories = data;
//            console.log(JSON.stringify(data));
        });
        $http.get('${path}/product_series/data').success(function (data) {
            $scope.list = data;
//            console.log(JSON.stringify(data));
        });
        $scope.byCategory=function(category){
            if(!category) return;
            $http.post('${path}/product_series/data/by_category',category).success(function (data) {
                $scope.list = data;
//                console.log(JSON.stringify(data));
            });
        }
        $scope.bySubCategory=function(subCategory){
            if(!subCategory) return;
            $http.post('${path}/product_series/data/by_sub_category',subCategory).success(function (data) {
                $scope.list = data;
//                console.log(JSON.stringify(data));
            });
        }
        $scope.byName=function(name){
            if(!name) return;
            $http.post('${path}/product_series/data/by_name',name).success(function (data) {
                $scope.list = data;
//                console.log(JSON.stringify(data));
            });
        }
        $scope.remove=function(productSeries){
            if(confirm("删除该商品将会删除该产品相关的评论、促销活动、首页显示。用户购物车和关注列表中如果存在此商品，会发送通知给用户。\n\n确定删除该商品?")){
                var url="${path}/admin/product_series/remove";
                $http.post(url,productSeries).success(function(data){
                    alert(data.message.message);
                    if(data.message.success){
                        $scope.list = data.list;
                    }
                })
            }
        }
    }]);

</script>