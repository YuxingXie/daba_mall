<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>--%>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script>
<!-- pop up -->
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
<!-- slider for products -->
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>
<!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->
<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"
        type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js"
        type="text/javascript"></script>

<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.modal.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.confirm.js"></script>
<script type="text/javascript">
//    angular.module("cartAdjustApp",[])
            mainApp.controller("cartAdjustController",["$scope","$http",function($scope,$http){
                $scope.getTotalAmountAndPrice=function(){
                    var totalPrice=0;
                    var totalAmount=0;
                    if($scope.cart&&$scope.cart.productSelectedList&&$scope.cart.productSelectedList.length){
                            for(var i=0;i<$scope.cart.productSelectedList.length;i++){
                                var productSelected=$scope.cart.productSelectedList[i];
                                totalAmount+=productSelected.amount;
                                totalPrice+=productSelected.productSeries.commonPrice*productSelected.amount;
                            }
                        }
                        $scope.totalAmount=totalAmount;
                        $scope.totalPrice=totalPrice;
                    }
//                $scope.getTotalAmountAndPrice();
                $scope.change=function(){
                    $scope.getTotalAmountAndPrice();
                }
                $scope.toBill=function(){
                loginCheckBeforeHandler(function(){
//                    console.log(JSON.stringify($scope.cart));return;
                    var url=$("#form").attr("action");
                    $http.post( url,$scope.cart).success(function (order) {
                        $scope.order=order;
                        $(this).scojs_confirm({
                            target:'#orderModal'
                        });
                    }).error(function(){ console.log("error！"); });
                });
                }
            }]);

    $(document).ready(function () {

    });
</script>