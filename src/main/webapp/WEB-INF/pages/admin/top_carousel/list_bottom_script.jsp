<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>


    mainApp.controller('TopCarouselListController', ['$scope', '$http', function ($scope, $http) {
        <%--$scope.homePageBlockList = [];--%>

        $http.get('${path}/admin/topCarousel/list/json').success(function (data) {
            $scope.topCarousels = data;
        });
        <%--$scope.delete=function(homePageBlock){--%>
            <%--if(confirm("确定删除?")){--%>
                <%--$http.get('${path}/admin/home_page_block/remove/'+homePageBlock.id).success(function (data) {--%>
                    <%--$scope.homePageBlockList = data;--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>

  }])
//  angular.bootstrap(document, ['productSeriesInputApp']);

</script>