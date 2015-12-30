<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
  $(document).ready(function() {
//        $("#test-upload").fileinput({
//            'showPreview' : false,
//            'allowedFileExtensions' : ['jpg', 'png','gif'],
//            'elErrorContainer': '#errorBlock'
//        });
//        /*
//         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
//         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
//         });
//         */

    $(document).on("click",".addNewProperty",function(){
      var $pp=$(this).parent().parent();
      var index=$pp.data("propertyIndex");
      index++;
      var $new=$pp.clone();
      var $propertyName= $new.find("input.propertyName");
      var $propertyValue= $new.find("input.propertyValue");
      $propertyName.val(null);
      $propertyValue.val(null);
//            $propertyName.attr("name","propertyName"+index);
//            $propertyValue.attr("name","propertyValue"+index);
      $new.data("propertyIndex",index);
      $propertyName.data("propertyIndex",index);
      $propertyValue.data("propertyIndex",index);
      $pp.find(".addNewProperty").remove();
      $pp.after($new);
    });
    $("#form").submit(function(){
      var $productProperties=$("#productPropertiesJson");
//            var productProperties=$productProperties.val();
      var productPropertiesJSON=[];
      var jsonExample=[{propertyName:"a",propertyValues:[{value:"aa"},{value:"aa"}]}];
      $("#form").find("input.propertyName").each(function(){
        var productProperty={};
        productProperty.propertyName=$(this).val();

        var index=$(this).data("propertyIndex");
        var propertyValues=[];
        $("#form").find("input.propertyValue").each(function () {
          if($(this).data("propertyIndex")===index){
              var valuesString=$(this).val();
              if(valuesString!==""){
                  if(valuesString.indexOf(",")<0){
                      var propertyValue={};
                      propertyValue.value=valuesString;
                      propertyValues.push(propertyValue);
                  }else{
                      var values=valuesString.split(",");
                      for(var i=0;i<values.length;i++){
                          var propertyValue={};
                          var value=values[i];
                          propertyValue.value=value;
                          propertyValues.push(propertyValue);
                      }
                  }
              }
          }
        });
        productProperty.propertyValues=propertyValues;
        productPropertiesJSON.push(productProperty);
      });
      console.log(JSON.stringify(productPropertiesJSON));
      $productProperties.val(JSON.stringify(productPropertiesJSON));
//            return false;
    });
  });
  $(".btn-warning").on('click', function() {
    if ($('#file-4').attr('disabled')) {
      $('#file-4').fileinput('enable');
    } else {
      $('#file-4').fileinput('disable');
    }
  });
  $(".btn-info").on('click', function() {
    $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
  });
  mainApp.controller('psiCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.list = [];
    $scope.productSubCategories=[];
//    $scope.noSortFit=false;
    $http.get('${path}/product_series/categories').success(function (data) {
      $scope.list = data;
      console.log(data);
    });
  }]);
//  angular.bootstrap(document, ['productSeriesInputApp']);

</script>