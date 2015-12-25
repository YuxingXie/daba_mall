mainApp.directive('add2cartPopover',['$http', function($http){
    return {
        restrict: 'EA',
        templateUrl:path+'statics/assets/scripts/add2cart/template.html',
        replace: true,
        scope: {
            productSelected: '='
        },
        link: function(scope, element, attrs){
            scope.add2cart=function(){
                $http.post('${path}/cart/add', $scope.productSelected).success(function(data){

                    $scope.$parent.cart=data;
                    $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
                }).error(function(data) {
                    alert("对不起，服务器出现了点异常!");
                });
                $("#showProductModal").modal('hide');

            }
            scope.add2cart=function(){
                $http.post('${path}/cart/add', $scope.productSelected).success(function(data){
                    $scope.$parent.cart=data;
                    $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
                }).error(function(data) {
                    alert("对不起，服务器出现了点异常!");
                });
                $("#showProductModal").modal('hide');

            }

        }
    };
}]);