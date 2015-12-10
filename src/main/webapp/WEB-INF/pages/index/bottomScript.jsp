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
<script src="${path}/statics/assets/plugins/EasyZoom-master/dist/easyzoom.js" type="text/javascript"></script>
<script>
//  angular.module("indexApp",[])
            mainApp .controller('indexController', ['$scope', '$http', function ($scope, $http) {
            $scope.popover=function(productSeriesId){
                $scope.productSelected={};
                $scope.productSelected.productPropertyValueList=[];
                $http.get(path+'/product_series/popover/'+productSeriesId).success(function (data) {
                $scope.productSelected.productSeries = data;
                $scope.productSelected.amount = 1;
                $scope.currentImg=$scope.productSelected.productSeries.pictures[0];
                // Instantiate EasyZoom plugin
                var $easyzoom = $('.easyzoom').easyZoom();
                // Get the instance API
                var api = $easyzoom.data('easyZoom');
                  $("#showProductModal").modal().show();
              });
            }
            $scope.changeImg=function(currentImg){
//              console.log(currentImg);
              $scope.currentImg=currentImg;
            }
            $scope.add2cart=function(){
//                console.log(JSON.stringify($scope.productSelected));
                $http.post('${path}/index/cart', $scope.productSelected).success(function(data){
//                    renderCart(data);
                    $scope.$parent.cart=data;
//                    $scope.$emit('summon');
//                    $scope.$on('executeSummon', function() {
//                        $scope.cart=data;
//                    });

                }).error(function(data) {
                    alert("对不起，服务器出现了点异常!");
                });
                $("#showProductModal").modal('hide');

            }

          }]);
//  angular.bootstrap(document.getElementById("indexAppMain"),["indexApp"]);
  $(document).ready(function(){
    App.init();
    App.initBxSlider();
    Index.initLayerSlider();
    App.initTouchspin();
      $('[data-toggle=tooltip]').tooltip();

  });
</script>
