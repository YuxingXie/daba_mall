<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    var easyzoom=function(){
        // Instantiate EasyZoom instances

        var $easyzoom = $('.easyzoom').easyZoom();

        // Setup thumbnails example
        var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

        $('.thumbnails').on('click', 'a', function(e) {
            var $this = $(this);

            e.preventDefault();

            // Use EasyZoom's `swap` method
            api1.swap($this.data('standard'), $this.attr('href'));
        });
        // Setup toggles example
        var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

        $('.toggle').on('click', function() {
            var $this = $(this);

            if ($this.data("active") === true) {
                $this.text("Switch on").data("active", false);
                api2.teardown();
            } else {
                $this.text("Switch off").data("active", true);
                api2._init();
            }
        });
    }
    mainApp.controller('productSortCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.sort={asc:true}
        $scope.paginationConf ={};
        $scope.doRequest=function(sort){
            if(!sort){
                sort={};
                sort.field='default';
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
            $scope.sort.field=field;
            $scope.sort.asc=!$scope.sort.asc;
            $scope.doRequest($scope.sort);
        }
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
//            var shoppingCartFly=function(start,end){
//                var offset = end.offset();
//                $(document).on("click",$element,function(event){
////                    var addcar = $(this);
//                    var flyer = $('<img class="u-flyer" src="'+$scope.productSelected.productSeries.pictures[0].picture+'">');
//                    flyer.fly({
//                        start: {
//                            left: event.pageX,
//                            top: event.pageY
//                        },
//                        end: {
//                            left: offset.left+10,
//                            top: offset.top+10,
//                            width: 0,
//                            height: 0
//                        },
//                        onEnd: function(){
//                            $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
//                            this.destory();
//                        }
//                    });
//                });
//            }
//            shoppingCartFly($(".add2cart"),$("#cart-block"));
                $("#showProductModal").modal().show();
            });
        }
        $scope.add2cart=function(){
            $http.post('${path}/cart/add', $scope.productSelected).success(function(data){

                $scope.$parent.cart=data;
                $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
            }).error(function(data) {
                alert("对不起，服务器出现了点异常!");
            });
            $("#showProductModal").modal('hide');

        }
            }]).filter('cut', function () {
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
    $(document).ready(function(){


    });
</script>
