<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/cascading-select-address-master/js/selectAddress2.js" type="text/javascript"></script>
<script>
    mainApp.controller("ToBillController",["$scope","$http",function($scope,$http){
        $scope.disabled=false;
        $scope.submit=function(){
            $scope.disabled=true;
            $("#form").submit();
        }
    }]);
</script>