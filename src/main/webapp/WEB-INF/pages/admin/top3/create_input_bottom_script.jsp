<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<script src="${path}/statics/assets/scripts/index.js" type="text/javascript"></script>

<script>
  mainApp.controller('HomePageTopController', ['$scope', '$http', function ($scope, $http) {
        $scope.productSeriesList = [];
        $scope.productSeriesSelectedList = [];
        $scope.top3 = [];

        $http.get('${path}/product_series/data').success(function (data) {
            $scope.productSeriesList = data;
        });
      <c:choose>
      <c:when test="${empty id}">
      $http.get('${path}/product_series/top3/data').success(function (data) {
          $scope.top3 = data;
      });
      </c:when>
      <c:otherwise>
      $http.get('${path}/product_series/topCarousel/data/${id}').success(function (data) {
          $scope.top3 = data;
      });
      </c:otherwise>
      </c:choose>


      $scope.addToList=function(checked,index,productSeries){
          if(checked)
              $scope.productSeriesSelectedList.push(productSeries);
          else{
              for(var i=0;i< $scope.productSeriesSelectedList.length;i++){
                  var productSeriesSelected=$scope.productSeriesSelectedList[i];
                  if(productSeriesSelected.id===productSeries.id){
                      $scope.productSeriesSelectedList.splice(i,1);
                      break;
                  }
              }

          }
          for(i=0;i<$scope.productSeriesSelectedList.length;i++){
              if(i>2) break;
              $scope.top3[i][0]=$scope.productSeriesSelectedList[i].id;
          }
      }
      $scope.preview=function(){
          console.log(JSON.stringify($scope.top3));
          var action="${path}/admin/top3/preview";
          $("#form").attr("action",action);
          $("#data").val(JSON.stringify($scope.top3));
          $("#form").submit();
      }
      $scope.save=function(){
          var topCarousel={};
          topCarousel.adContent=$scope.top3;
          topCarousel.priority=$scope.priority;
          topCarousel.name=$scope.topCarouselName;
          <c:if test="${not empty id}">
          topCarousel.id='${id}';
          </c:if>
          var action="${path}/admin/topCarousel/new";
          console.log(JSON.stringify(topCarousel))
          $http.post(action,topCarousel).success(function(data){
              alert(data.message);
              if(data.success){
                  window.location.href="${path}/admin/top_carousel/list"
              }
          }).error(function(){
              alert("保存时出错，请联系技术人员!");
          });
      }
      $scope.getTopCarousels=function(){
          $http.get('${path}/admin/topCarousel/list/json').success(function (data) {
              $scope.topCarousels = data;
          });
      }
  }])
  $(document).ready(function(){
      Index.initLayerSlider();
  });
</script>