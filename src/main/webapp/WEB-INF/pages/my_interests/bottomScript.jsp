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
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>
<!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"
        type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<script>
//    angular.module("myInterestsApp",[])
           mainApp.controller("myInterestsController",["$scope","$http",function($scope,$http){
                $http.get(path+"/personal/interests/json").then(function(interests){
                    $scope.interests=interests.data;
                });
                $scope.fastView=function(productSeries){
                    $scope.productSeries=productSeries;
                    App.initImageZoom();
                    $('.add2cart').shoping();
                };
            }])
//    angular.bootstrap(document.getElementById("myInterestsAppMain"),["myInterestsApp"]);
    $(document).ready(function() {
        $(document).on("click","#product-pop-up .add2cart",function(){
            var form=$('[name="popForm"]');
            var amount=$("#product-quantity").val();
            var productSelected={};
            productSelected.amount=amount;
            productSelected.productSeriesId=form.find("[name='productSeriesId']").val();
            var productPropertyValueIds=[];
            form.find("select").each(function(){
                //productPropertySelect.productPropertyId=$(this).data("productPropertyId");
                var productPropertyValueId=$(this).val();
                productPropertyValueIds.push(productPropertyValueId);
            });
            productSelected.productPropertyValueIds=productPropertyValueIds;
            //console.log(JSON.stringify(productSelected));
            $.ajax({
                url: path+"/index/cart",
                contentType: "application/json",
                data: JSON.stringify(productSelected),
                method: "post"
            }).done(function (cart) {
                $.fancybox.close();
                renderCart(cart);
                console.log("success")
            }).fail(function(){ console.log("error！"); });
            return false;
        });
        $(document).on("click",".product-other-images a",function(){
            $(".product-main-image").find("img").attr("src",($(this).find("img").attr("src")));
            App.initImageZoom();
        })
        App.init();
        App.initBxSlider();
        Index.initLayerSlider();
        App.initImageZoom();
        App.initTouchspin();
    });
</script>
