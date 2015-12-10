<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
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
                $http.get(path+"/personal/cart/text").then(function(cart){
                    $scope.cart=cart.data;
                    $scope.getTotalAmountAndPrice();
                });
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
                $scope.change=function(){
                    $scope.getTotalAmountAndPrice();
                }
                $scope.toBill=function(){
                loginCheckBeforeHandler(function(){
                    var url=$("#form").attr("action");
                    $.ajax({
                        url: url,
                        contentType: "application/json",
                        data: JSON.stringify($scope.cart),
                        method: "post"
                    }).done(function (order) {
                        $(".text-order-id").text(order.id);
                        $(".text-total-amount").text(order.totalAmount);
                        $(".text-total-price").text(order.totalPrice);
                        $(this).scojs_confirm({
                            target:'#orderModal'
                        });
                    }).fail(function(){ console.log("error！"); });
                });
                }
            }]);
//    angular.bootstrap(document.getElementById("cartAdjustAppMain"),["cartAdjustApp"]);

//    var nonHtml5Post =function(){
//        return function(){
//
//            var cart={};
//            var productSelectedList=[];
//            $('[name="productSelected"]').each(function(){
//                var productSelected={};
//                var productSeries={};
//                var productSeriesId= $(this).data("productSeriesId");
//                productSelected.productSeriesId=productSeriesId;
//                productSelected.amount=$(this).find("[name='amount']").val();
//                var commonPrice=$(this).data("commonPrice");
//                var pictures0=$(this).find("[name='pictures0']").data("pictures0");
//                var pictures=[pictures0];
//                var name=$(this).data("productSeriesName");
//                productSeries.pictures=pictures;
//                productSeries.id=productSeriesId;
//                productSeries.commonPrice=commonPrice;
//                productSeries.name=name;
//                productSelected.productSeries=productSeries;
//                var productPropertyValueList=[];
//                var $productPropertyValue=$(this).find('[name="productPropertyValue"]');
//                $productPropertyValue.each(function(){
//                    var productPropertyValue={};
//                    productPropertyValue.id=$(this).data("productPropertyValueId");
//                    productPropertyValue.value=$(this).data("productPropertyValueValue");
//                    productPropertyValue.productPropertyId==$(this).data("productPropertyValueProductPropertyId");;
//                    productPropertyValueList.push(productPropertyValue);
//                });
//                if($productPropertyValue &&$productPropertyValue.length>0){
//                    productSelected.productPropertyValueList=productPropertyValueList;
//                }
//                productSelectedList.push(productSelected);
//            });
//            cart.productSelectedList=productSelectedList;
//            var url=$("#form").attr("action");
//
//
//            $.ajax({
//                url: url,
//                contentType: "application/json",
//                data: JSON.stringify(cart),
//                method: "post"
//            }).done(function (order) {
//                $(".text-order-id").text(order.id);
//                $(".text-total-amount").text(order.totalAmount);
//                $(".text-total-price").text(order.totalPrice);
////                $("#ensure-to-bill").attr("href",path+"/cart/to_bill");
//                $(this).scojs_confirm({
//                    target:'#orderModal'
//                });
////                window.location.href=path+"/cart/to_bill";
//            }).fail(function(){ console.log("error！"); });
//        }
//    }
    $(document).ready(function () {
//        $("#toBill").click(function () {
//            var supportHtml5=false;
//            if (window.applicationCache) {
//                supportHtml5=true;
//            } else {
//                supportHtml5=false;
//            }
//            loginCheckBeforeHandler(new nonHtml5Post());
//
//        });
    });
</script>