<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    mainApp.controller("ReturnExchangeNotifyController",["$scope","$http",function($scope,$http){
        $scope.orders=[];
        $http.get("${path}/order/my_paid_orders/json").success(function(data){
            $scope.orders=data;
        });
        $scope.submit=function(){
            if(!$scope.order) return;
            $scope.order.returnExchangeList=$scope.returnList;
            $http.post("${path}/order/return_exchange/submit", $scope.order).success(function(data){
                $scope.message=data;
            });
        }
    }])
</script>