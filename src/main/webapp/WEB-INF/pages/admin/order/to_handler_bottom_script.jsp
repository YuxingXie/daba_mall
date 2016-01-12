<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>


    mainApp.controller('HandlerOrderController', ['$scope', '$http', function ($scope, $http) {
        <%--$scope.homePageBlockList = [];--%>
        $scope.orders=[];
        $http.get('${path}/admin/order/to_handler/data').success(function (data) {
            $scope.orders = data;
        });
        $scope.toHandler=function(order){

            $scope.order=order;
            $("#orderDetail").modal().show();
        }
        $scope.handler=function(){
            if(confirm("确定处理?")){
                $("#orderDetail").modal("hide");
                console.log(JSON.stringify($scope.order));
                $http.post('${path}/admin/order/handler',$scope.order).success(function (data) {
                    $scope.orders = data;
                });
            }
        }

  }])

</script>