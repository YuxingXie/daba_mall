<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/top.js"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>--%>
<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>--%>
<%--弹出二级菜单相关--%>
<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/tooltip.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/popover.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.2.19/angular-route.min.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.2.19/ui-bootstrap-tpls.min.js"></script>
<script src="${path}/statics/assets/plugins/angularJs-pagination/src/pagination/tm.pagination.js"></script>
<script src="${path}/statics/assets/plugins/EasyZoom-master/dist/easyzoom.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script>
    var mainApp=angular.module("mainApp",['ui.bootstrap', 'ngRoute','tm.pagination']);
    mainApp .controller('mainController', ['$scope', '$http', function ($scope, $http) {

        $scope.popover=function(productSeriesId){
            $scope.productSelected={};
            $scope.productSelected.productPropertyValueList=[];
            $http.get(path+'/product_series/popover/'+productSeriesId).success(function (data) {
                $scope.productSelected.productSeries = data;
                $scope.productSelected.amount = 1;
                $scope.currentImg=$scope.productSelected.productSeries.pictures[0];
                $scope.ratingVal = $scope.productSelected.productSeries.productSeriesEvaluateGrade?$scope.productSelected.productSeries.productSeriesEvaluateGrade:0;
//                ng-init="$parent.productSelected.productPropertyValueList[0]=productProperty.propertyValues[0]"
                var productProperties= $scope.productSelected.productSeries.productProperties;
                if(productProperties&&productProperties.length){
                    for(var i=0;i<productProperties.length;i++){
                        var productProperty=productProperties[i];
                        var propertyValues=productProperty.propertyValues;
                        if(propertyValues&&propertyValues.length){
                            $scope.productSelected.productPropertyValueList.push(propertyValues[0]);
                        }
                    }
                }

                // Instantiate EasyZoom plugin
                var $easyzoom = $('.easyzoom').easyZoom();
                // Get the instance API
                var api = $easyzoom.data('easyZoom');
                $("#showProductModal").modal().show();
            });
        }
        $scope.max = 5;
        $scope.ratingVal =3;
        $scope.readonly = true;
        $scope.changeImg=function(currentImg){
            $scope.currentImg=currentImg;
        }
        $scope.add2cart=function(){
            $http.post('${path}/index/cart', $scope.productSelected).success(function(data){
                $scope.cart=data;

            }).error(function(data) {
                alert("对不起，服务器出现了点异常!");
            });
            $("#showProductModal").modal('hide');

        }

        $scope.onHover = function(val){
            $scope.hoverVal = val;
        };
        $scope.onLeave = function(){
            $scope.hoverVal = null;
        }
        $scope.onChange = function(val){
            $scope.ratingVal = val;
        }
        $http.get('${path}/user/cart').success(function (data) {
            $scope.cart = data;
        });
        $scope.deleteGoods=function(index){
//            alert(JSON.stringify(index));
            if($scope.cart.productSelectedList&&$scope.cart.productSelectedList.length){
                $scope.cart.productSelectedList.splice(index,1);
                $http({
                    method:"POST",
                    url:path+"/cart/update",
                    data:$scope.cart
                }).success(function(cart){
                    $scope.cart=cart;
                }).error(function(){

                });
            }
        }
        $scope.initProductMenu= function () {
            if(!$scope.productCategories){
                $http.get('${path}/product_series/categories').success(function (data) {
                    $scope.productCategories = data;
//                    console.log(JSON.stringify(data));
                });
            }

        }
    }])
            .directive('star', function () {
                return {
                    template: '<ul class="rating" ng-mouseleave="leave()">' +
                    '<li ng-repeat="star in stars" ng-class="star" ng-click="click($index + 1)" ng-mouseover="over($index + 1)">' +
                    '\u2605' +
                    '</li>' +
                    '</ul>',
                    scope: {
                        ratingValue: '=',
                        max: '=',
                        readonly: '@',
                        onHover: '=',
                        onLeave: '='
                    },
                    controller: function($scope){
                        $scope.ratingValue = $scope.ratingValue || 0;
                        $scope.max = $scope.max || 5;
                        $scope.click = function(val){
                            if ($scope.readonly && $scope.readonly === 'true') {
                                return;
                            }
                            $scope.ratingValue = val;
                        };
                        $scope.over = function(val){
                            $scope.onHover(val);
                        };
                        $scope.leave = function(){
                            $scope.onLeave();
                        }
                    },
                    link: function (scope, elem, attrs) {
                        elem.css("text-align", "center");
                        var updateStars = function () {
                            scope.stars = [];
                            for (var i = 0; i < scope.max; i++) {
                                scope.stars.push({
                                    filled: i < scope.ratingValue
                                });
                            }
                        };
                        updateStars();

                        scope.$watch('ratingValue', function (oldVal, newVal) {
                            if (newVal) {
                                updateStars();
                            }
                        });
                        scope.$watch('max', function (oldVal, newVal) {
                            if (newVal) {
                                updateStars();
                            }
                        });
                    }
                };
            });;

</script>
<script src="${path}/statics/assets/scripts/form-validate.js"></script>