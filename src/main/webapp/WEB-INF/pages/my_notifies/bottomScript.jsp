<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

mainApp.controller("myNotifiesController",["$scope","$http",function($scope,$http){
    $scope.notify={};
    $scope.paginationConf = {};
    $http.get("${path}/user/notifies").success(function(data){
        $scope.notifyPage=data.notifyPage;
        $scope.page=data.page;
        $scope.paginationConf = {
            currentPage: $scope.page,
            totalItems: $scope.notifyPage.totalElements,
            itemsPerPage: $scope.notifyPage.size,
            pagesLength:9,
            numberOfPages:$scope.notifyPage.totalPages,
            perPageOptions: [10, 20, 30, 40, 50],
            onChange: function(){
                $http.get(path+'/user/notifies?page='+this.currentPage).success(function (data) {
                    $scope.notifyPage = data.notifyPage;
                    $scope.page=data.page;
                });
            }
        };
    });
    $scope.showNotify=function(notify){
        $scope.notify=notify;
        if(!$scope.notify.read){
            $scope.notify.read=true;
            $http.post("${path}/user/notify/read?page="+$scope.page,$scope.notify).success(function(data){
                $scope.notifyPage=data.notifyPage;
                $scope.page=data.page;
                $scope.$parent.unreadNotifiesCount=data.unreadNotifiesCount;
            });
        }
        $("#notifyModal").modal().show();
    }
    $scope.markAsRead=function(notify){
        notify.read=true;
        $http.post("${path}/user/notify/read?page="+$scope.page,notify).success(function(data){
            $scope.notifyPage=data.notifyPage;
            $scope.page=data.page;
        }).error(function(data){
            console.log(JSON.stringify(data));
        });
    }
    $scope.removeNotify=function(notify){
        $http.post("${path}/user/notify/remove?page="+$scope.page,notify).success(function(data){
            $scope.notifyPage=data.notifyPage;
            $scope.page=data.page;
        }).error(function(data){
        });
    }

}])

</script>
