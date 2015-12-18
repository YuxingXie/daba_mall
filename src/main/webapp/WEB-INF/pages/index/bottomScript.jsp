<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script>
<!-- pop up -->
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
<!-- slider for products -->
<%--<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>--%>
<!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>

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
    //  angular.module("indexApp",[])
            mainApp .controller('indexController', ['$scope', '$http', function ($scope, $http) {
                $scope.popover=function(productSeriesId){
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
                        $("#showProductModal").modal().show();
                    });
                }
                $scope.max = 5;
                $scope.ratingVal =3;
                $scope.readonly = true;
               $scope.add2cart=function(){
                    $http.post('${path}/index/cart', $scope.productSelected).success(function(data){
                        $scope.$parent.cart=data;

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
//  angular.bootstrap(document.getElementById("indexAppMain"),["indexApp"]);
  $(document).ready(function(){
//    App.init();
//    App.initBxSlider();
    Index.initLayerSlider();
//    App.initTouchspin();


  });
</script>
