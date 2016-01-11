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
        $scope.orderReturnExchange=function(productSelected){
//            for(var i=0;i<order.productSelectedList.length;i++){
//                var productSelected=order.productSelectedList[i];
                if(!productSelected.returnExchangeList||!productSelected.returnExchangeList.length){
                    productSelected.returnExchangeList=[];

                }else{
                    productSelected.returnExchangeList[productSelected.returnExchangeList.length]={};
                }
//            }

        }
        $scope.defineReturnExchange=function(productSelected){
            if(productSelected.newReturnExchange.type==="") productSelected.newReturnExchange=null;
        }
        $scope.getMax=function(productSelected){
            if(!productSelected.returnExchangeList) return productSelected.amount;
            if(!productSelected.returnExchangeList.length) return productSelected.amount;
            var max=productSelected.amount;
            for(var i=0;i<productSelected.returnExchangeList.length;i++){
                var returnExchange=productSelected.returnExchangeList[i];
                if(returnExchange.amount)
                    max-=returnExchange.amount;
            }
            return max;
        }


        $scope.submit=function(){
            if(!$scope.order) return;
            var atLeastOne=false;
            for(var i=0;i<$scope.order.productSelectedList.length;i++){
                var productSelected=$scope.order.productSelectedList[i];
                if(productSelected.newReturnExchange&&productSelected.newReturnExchange!=null){
                    atLeastOne=true;
                }
            }
            console.log("atLeastOne:"+atLeastOne);
            if(!atLeastOne){
                $scope.message={};
                $scope.message.message="请选择至少一件退/换商品";
                $scope.message.success=false;
                return;
            }
            $http.post("${path}/order/return_exchange/submit", $scope.order).success(function(data){
                $scope.message=data.message;
                $scope.orders=data.orders;
            });
        }
    }])
</script>