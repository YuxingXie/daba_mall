<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>


  mainApp.controller('HomePageBlockInputController', ['$scope', '$http', function ($scope, $http) {
        $scope.productSeriesList = [];
        $scope.productSeriesSelectedList = [];
        $http.get('${path}/product_series/data').success(function (data) {
            $scope.productSeriesList = data;
        });
        $scope.addToList=function(checked,index,productSeries){
            if(checked)
                $scope.productSeriesSelectedList[index]=productSeries;
            else $scope.productSeriesSelectedList[index]=null;
        }
      $scope.submit=function(){
          if(!$scope.productSeriesSelectedList){
              alert("没有选择产品");
              return;
          }
          if(!$scope.productSeriesSelectedList.length){
              alert("没有选择产品");
              return;
          }
          var hasProduct=false;
          for(var i=0 ;i< $scope.productSeriesSelectedList.length;i++){
              var productSeriesSelected=$scope.productSeriesSelectedList[i];
              if(productSeriesSelected!=null) {
                  hasProduct=true;
                  break;
              }
          }
          if(!hasProduct){
              alert("没有选择产品");
              return;
          }
         var url="${path}/home_page_block/new";
         var data=$scope.homePageBlock;
          var productSeriesList=[];
          for(var i=0 ;i< $scope.productSeriesSelectedList.length;i++){
              var productSeriesSelected=$scope.productSeriesSelectedList[i];
              if(productSeriesSelected!=null) {
                  productSeriesList.push(productSeriesSelected);
              }
          }
          data.productSeriesList=productSeriesList;
          console.log(JSON.stringify(data));
         $http.post("${path}/admin/home_page_block/new",data).success(function(data){
             if(data.id) alert("添加成功!");
         });
      }
  }])
//  angular.bootstrap(document, ['productSeriesInputApp']);

</script>