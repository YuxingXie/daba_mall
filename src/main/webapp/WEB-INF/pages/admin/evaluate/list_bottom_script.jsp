<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

    mainApp.controller('EvaluateController', ['$scope', '$http', function ($scope, $http) {

        $scope.list=[];

        $http.get('${path}/product_series/evaluates/data').success(function (data) {
            $scope.list = data;
        });
        $scope.openModal=function(evaluate){
            $scope.evaluate=evaluate;
            $("#evaluateFilterModal").modal().show();
        }
        $scope.doFilter=function(){
            if(confirm("确定?")){
                var url="${path}/admin/evaluate/update";
//                console.log(JSON.stringify($scope.evaluate))
                $http.post(url,$scope.evaluate).success(function(data){
                        $scope.evaluate = data;
                    $("#evaluateFilterModal").modal("hide");
                })
            }
        }
    }]);

</script>