<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

    mainApp.controller('ProductSeriesListController', ['$scope', '$http', function ($scope, $http) {
        $scope.list=[];
//    $scope.noSortFit=false;
        $http.post('${path}/admin/notifies/data',{fromToMe:'toMe'}).success(function (data) {
            $scope.list = data;
//                console.log(JSON.stringify(data));
        });
        $scope.byFromTo=function(){
            if(!$scope.fromToMe) return;
            var data={};
            if($scope.read) data.read=$scope.read;
            data.fromToMe=$scope.fromToMe;

            $http.post('${path}/admin/notifies/data',data).success(function (data) {
                $scope.list = data;
//                console.log(JSON.stringify(data));
            });
        }
        $scope.byRead=function(){
            if(!$scope.read) return;
            var data={};
            if($scope.fromToMe) data.fromToMe=$scope.fromToMe;
            data.read=$scope.read;
            $http.post('${path}/admin/notifies/data',data).success(function (data) {
                $scope.list = data;
//                console.log(JSON.stringify(data));
            });
        }

        $scope.remove=function(notify){
            if(confirm("确定删除该消息?")){
                var url="${path}/admin/notify/remove";
                $http.post(url,notify).success(function(data){
                        $scope.list = data.list;
                })
            }
        }
    }]);

</script>