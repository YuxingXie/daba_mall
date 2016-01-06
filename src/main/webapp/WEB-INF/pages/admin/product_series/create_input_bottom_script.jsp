<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js"
        type="text/javascript"></script>
<script>
    $(document).ready(function () {
//        $("#test-upload").fileinput({
//            'showPreview' : false,
//            'allowedFileExtensions' : ['jpg', 'png','gif'],
//            'elErrorContainer': '#errorBlock'
//        });

//        $("#form").submit(function (){
//            alert("1");
            <%--var appElement = document.querySelector('[ng-controller=psiCtrl]');--%>
            <%--alert("2");--%>
            <%--var $scope = angular.element(appElement).scope();--%>
            <%--alert("4");--%>
            <%--$("#productSeriesId").val( $scope.productSeries.id);--%>
            <%--alert("52");--%>
            <%--$("#form").attr("action","${path}/admin/product_series/new/test2");--%>
            <%--alert($("#form").attr("action"));--%>
            <%--return true;--%>
//        });
    });
//    $(".btn-warning").on('click', function () {
//        if ($('#file-4').attr('disabled')) {
//            $('#file-4').fileinput('enable');
//        } else {
//            $('#file-4').fileinput('disable');
//        }
//    });
//    $(".btn-info").on('click', function () {
//        $('#file-4').fileinput('refresh', {previewClass: 'bg-info'});
//    });
    mainApp.controller('psiCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.categories = [];
        $scope.productSubCategories = [];
        $scope.productSeries = {};
        $scope.productSeries.productSeriesPrices=[];
        $scope.productSeries.productProperties = [];
        $scope.productSeries.productProperties[0] = {};
        $scope.productSeries.productProperties[0].propertyValues = [];
//        $scope.productSeries.productProperties[0].propertyValues[0] = {};
        $scope.productSeries.productStore = {};
        $scope.productSeries.productStore.inAndOutList = [];
//    $scope.noSortFit=false;
        $http.get('${path}/product_series/categories').success(function (data) {
            $scope.categories = data;
//            console.log(JSON.stringify(data));
        });

        $scope.addNewProperty = function () {
//            console.log($scope.productSeries.productProperties);
            $scope.productSeries.productProperties[$scope.productSeries.productProperties.length-1]={};
            $scope.productSeries.productProperties.length = $scope.productSeries.productProperties.length + 1;
//            console.log(JSON.stringify($scope.productSeries.productProperties));
        }
        $scope.newPropertyValue=function(index){
//            console.log(index)
            if(!$scope.productSeries.productProperties[index])$scope.productSeries.productProperties[index]={};
            if(!$scope.productSeries.productProperties[index].propertyValues)
                $scope.productSeries.productProperties[index].propertyValues=[];
            $scope.productSeries.productProperties[index].propertyValues.length=$scope.productSeries.productProperties[index].propertyValues.length+1;
        }
        $scope.submit=function(){
            var action = "${path}/admin/product_series/new";
            $http.post(action,$scope.productSeries).success(function(data){
                console.log(JSON.stringify(data));
                $scope.productSeries=data;
                $("#productSeriesId").val(data.id);
                <%--$("#form").attr("action","${path}/admin/product_series/new/test2");--%>
            })
        }
    }]);
</script>