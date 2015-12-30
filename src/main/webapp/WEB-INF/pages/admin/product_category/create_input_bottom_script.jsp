<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

    mainApp.controller('productCategoryCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.list = [];
//        $scope.noSortFit=false;
        $scope.showSort=function(){
//            $scope.noSortFit=!$scope.noSortFit;
        }
        $http.get('${path}/product_series/categories').success(function (data) {
            $scope.list = data;
        });
        $scope.$watch('categoryType', function(newVal,oldVal) {
            if(newVal!==oldVal) {
                $scope.productCategory =undefined;
                <%--if(newVal==='2'){--%>
                    <%--$http.get('${path}/product_series/categories').success(function (data) {--%>
                        <%--$scope.list = data;--%>
<%--//                        $scope.$apply();--%>
                    <%--});--%>
                <%--}--%>
            }
        });
    }]);
</script>