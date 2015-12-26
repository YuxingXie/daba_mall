<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>

<script>
mainApp .controller('indexController', ['$scope', '$http','$element', function ($scope, $http,$element) {
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
            $("#showProductModal").modal().show();
        });
    }


   $scope.add2cart=function(){
        $http.post('${path}/cart/add', $scope.productSelected).success(function(data){

            $scope.$parent.cart=data;
            $scope.getTotalAmountAndPrice();
            $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
        }).error(function(data) {
            alert("对不起，服务器出现了点异常!");
        });
        $("#showProductModal").modal('hide');

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

  $(document).ready(function(){
    Index.initLayerSlider();
  });
</script>
