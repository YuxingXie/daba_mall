<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
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

<script src="${path}/statics/assets/plugins/angular-1.2.19/ui-bootstrap-tpls.min.js"></script>
<script src="${path}/statics/assets/plugins/angularJs-pagination/src/pagination/tm.pagination.js"></script>
<%--<script src="${path}/statics/assets/plugins/EasyZoom-master/dist/easyzoom.js" type="text/javascript"></script>--%>
<script src="${path}/statics/assets/plugins/EasyZoom-master/dist/easyzoom.test.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>

<script>
    var mainApp=angular.module("mainApp",['ui.bootstrap', 'ngRoute','tm.pagination']);
    mainApp .controller('mainController', ['$scope', '$http', function ($scope, $http) {

        $scope.initProductMenu= function () {
            if(!$scope.productCategories){
                $http.get('${path}/product_series/categories').success(function (data) {
                    $scope.productCategories = data;
//                    console.log(JSON.stringify(data));
                });
            }

        }
        $scope.getTotalAmountAndPrice=function(){
            var totalPrice= 0,totalAmount=0;
            if($scope.cart&&$scope.cart.productSelectedList&&$scope.cart.productSelectedList.length){

                for(var i=0;i<$scope.cart.productSelectedList.length;i++){
                    var productSelected=$scope.cart.productSelectedList[i];
                    totalPrice+=productSelected.productSeries.commonPrice*productSelected.amount;
                    totalAmount+=productSelected.amount;
                }
            }
            $scope.totalPrice=totalPrice;
            $scope.totalAmount=totalAmount;
        }

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
                    $scope.getTotalAmountAndPrice();
                }).error(function(){

                });
            }
        }
        $http.get('${path}/user/cart').success(function (data) {
            $scope.cart = data;
            $scope.getTotalAmountAndPrice();
        });
        $http.get('${path}/user/unread_notifies_count').success(function (data) {
            $scope.unreadNotifiesCount = data;
        });
        $scope.popover=function(productSeriesId){
            $scope.lowPrice=function(){
                if(!$scope.productSelected.productSeries.currentPrice) return false;
                if(!$scope.productSelected.productSeries.currentPrice.price) return false;
                if(!$scope.productSelected.productSeries.currentPrice.prevPrice) return false;
                if(!$scope.productSelected.productSeries.currentPrice.prevPrice.price) return false;
                return  $scope.productSelected.productSeries.currentPrice.price<$scope.productSelected.productSeries.currentPrice.prevPrice.price;

            }
            $scope.productSelected={};
            $scope.productSelected.productPropertyValueList=[];
            $http.get(path+'/product_series/popover/'+productSeriesId).success(function (data) {
                $scope.productSelected.productSeries = data;
                $scope.productSelected.amount = 1;
            if(!$scope.productSelected.productSeries.pictures){
                $scope.productSelected.productSeries.pictures=[];
                var picture={};
                picture.picture= "statics/img/img_not_found.jpg";
                picture.bigPicture= "statics/img/img_not_found.jpg";
                picture.iconPicture= "statics/img/img_not_found.jpg";
                $scope.productSelected.productSeries.pictures.push(picture);
            }
                $scope.currentPicture=$scope.productSelected.productSeries.pictures[0];
                $scope.ratingVal = $scope.productSelected.productSeries.productSeriesEvaluateGrade?$scope.productSelected.productSeries.productSeriesEvaluateGrade:0;
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
                easyzoom();
                $("#showProductModal").modal().show();
            });
        }
        $scope.add2cart=function(){
            $http.post('${path}/cart/add', $scope.productSelected).success(function(data){

                $scope.cart=data;
                $scope.getTotalAmountAndPrice();
                $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
            }).error(function(data) {
                alert("对不起，服务器出现了点异常!");
            });
            $("#showProductModal").modal('hide');

        }
        $scope.toggleInterest=function(productSeriesId){
            var url="${path}/product_series/toggle_interest";
//        url+="?productSeriesId="+$scope.productSeries.id;
            if(!productSeriesId) return;
            if(!productSeriesId==="") return;
            url+="?productSeriesId="+productSeriesId;
            $http.get(url).success(function (data) {
                $scope.interestInfo = data;
            });
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
            })


</script>
<script src="${path}/statics/assets/scripts/form-validate.js"></script>