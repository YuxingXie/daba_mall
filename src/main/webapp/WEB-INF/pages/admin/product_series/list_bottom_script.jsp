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
            console.log(JSON.stringify(data));
        });
        $http.get('${path}/product_series/data').success(function (data) {
            $scope.list = data;
            console.log(JSON.stringify(data));
        });
    }]);

</script>