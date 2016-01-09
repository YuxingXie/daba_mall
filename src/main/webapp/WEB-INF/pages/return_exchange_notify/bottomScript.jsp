<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    var selectedEquals=function(selectedFirst,selectedSecond){
        var equals=true;
        for(var key in selectedFirst){
            if(key==="amount") continue;
//            if(!selectedSecond[key]){equals=false;}
            if(selectedSecond[key]!==selectedFirst[key]) {
                equals=false;
                break;
            }
        }
        return equals;
    }
    function clone(obj){
        function Clone(){}
        Clone.prototype = obj;
        var o = new Clone();
        for(var a in o){
            if(typeof o[a] == "object") {
                o[a] = clone(o[a]);
            }
        }
        return o;
    }
    mainApp.controller("ReturnExchangeNotifyController",["$scope","$http",function($scope,$http){
        $scope.orders=[];
        $scope.returnList=[];
        $scope.returnNumber=[];
        $http.get("${path}/order/my_paid_orders/json").success(function(data){
            $scope.orders=data;
            <%--alert("${path}/order/my_paid_orders/json");--%>
        });
        $scope.addToList=function(checked,selected){
            if(checked){
                $scope.returnList.push(selected);
            }
            else{
                for(var i=0;i< $scope.returnList.length;i++){
                    var productSelected=$scope.returnList[i];
                    if(selectedEquals(productSelected,selected)){
                        $scope.returnList.splice(i,1);
                        $scope.returnNumber.splice(i,1);
                        break;
                    }
                }

            }

        }
        $scope.submit=function(){
            alert(JSON.stringify($scope.order));
            alert(JSON.stringify($scope.returnList));
            alert(JSON.stringify($scope.returnNumber));

        }
    }])
</script>