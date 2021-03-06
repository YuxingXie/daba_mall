<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
mainApp.controller('AdminIndexController', ['$scope', '$http', function ($scope, $http) {
    $scope.data = {};
    $http.get('${path}/admin/index/json').success(function (data) {
        $scope.data = data;
    })
}]);
</script>