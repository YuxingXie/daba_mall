<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    mainApp.controller('ReturnExchangeController', ['$scope', '$http', function ($scope, $http) {
        <%--$scope.homePageBlockList = [];--%>
        $scope.order={};
        $http.get('${path}/order/json/${id}').success(function (data) {
            $scope.order = data;
        });
        $scope.handler=function(returnExchange){
            if("${sessionScope.administrator.id}"===""){
                alert("请重新登录！");
                window.location.href="${path}/admin";
                return;
            }
            var text="";
            if(!returnExchange.handler)
                text="您确定该退换货请求已经成功处理?";
            else{
                text="是否将该请求标记为未处理?";
            }
            if(confirm(text)){
                if(!returnExchange.handler)
                    returnExchange.handler=true;
                else{
                    returnExchange.handler=!returnExchange.handler;
                }
                returnExchange.handlerDate=new Date();
                returnExchange.administrator={};
                returnExchange.administrator.id="${sessionScope.administrator.id}";

//                for(var i=0;i<$scope.order.productSelectedList.length;i++){
//                    var productSelected=$scope.order.productSelectedList[i];
//                    for(var j=0;j<productSelected.returnExchangeList.length;j++){
//                        console.log(productSelected.productSeries.name+",handler:"+productSelected.returnExchangeList[j].handler);
//                    }
//                }
//                return;
                $http.post('${path}/admin/order/return_exchange_handler',$scope.order).success(function (data) {
                    $scope.order = data;
                });
            }
        }
  }])

</script>