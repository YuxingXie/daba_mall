<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>

    mainApp.controller('productSortCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.sort={asc:false,field:'sales'}
        $scope.paginationConf ={};
        $scope.doRequest=function(sort){
            if(!sort){
                sort={};
                sort.field='sales';
                sort.asc=true;
            }
            $http.post(path+'/product_series/sort/json/${productSubCategory.id}',sort).success(function (data) {
                $scope._page = data._page;
                $scope.page = data.page;
                $scope.paginationConf = {
                    currentPage: $scope.page,
                    totalItems: $scope._page.totalElements,
                    itemsPerPage: $scope._page.size,
                    pagesLength:9,
                    perPageOptions: [10, 20, 30, 40, 50],
                    onChange: function(){
                        $http.post(path+'/product_series/sort/json/${productSubCategory.id}?page='+this.currentPage,sort).success(function (data) {

                            $scope._page = data._page;
                            $scope.page=data.page;
                        });
                    }
                };
            })
        }
        $scope.doRequest();
        $scope.toSort=function(field){
            if(!$scope.sort.field||($scope.sort.field&&$scope.sort.field!==field)){
                $scope.sort.asc=true;
            }
            $scope.sort.field=field;
            $scope.sort.asc=!$scope.sort.asc;
            $scope.doRequest($scope.sort);
        }

/*** 评星相关 begin**/
        $scope.max = 5;
        $scope.ratingVal =3;
        $scope.readonly = true;
        $scope.onHover = function(val){
            $scope.hoverVal = val;
        };
        $scope.onLeave = function(){
            $scope.hoverVal = null;
        }
        $scope.onChange = function(val){
            $scope.ratingVal = val;
        }
        /******* end ***************/
            }])
    .filter('cut', function () {
        return function (value, wordwise, max, tail) {
            if (!value) return '';

            max = parseInt(max, 10);
            if (!max) return value;
            if (value.length <= max) return value;

            value = value.substr(0, max);
            if (wordwise) {
                var lastspace = value.lastIndexOf(' ');
                if (lastspace != -1) {
                    value = value.substr(0, lastspace);
                }
            }

            return value + (tail || ' …');
        };
    });

</script>
