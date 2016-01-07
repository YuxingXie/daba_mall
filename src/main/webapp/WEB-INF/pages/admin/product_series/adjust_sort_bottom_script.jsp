<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script>
    mainApp.controller('AdjustStoreController', ['$scope', '$http', function ($scope, $http) {
        $scope.categories = [];
        $http.get('${path}/product_series/categories').success(function (data) {
            $scope.categories = data;
        });
        $scope.getProductSubCategory=function(productSubCategory){
            if(!productSubCategory) return;
            $("#subCategoryId").val(productSubCategory.id);
        }
    }]);

</script>