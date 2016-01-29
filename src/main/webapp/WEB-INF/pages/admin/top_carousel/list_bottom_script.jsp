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
        $scope.preview=function(topCarousel){
            var action="${path}/admin/top3/preview";
            $("#form").attr("action",action);
            $("#data").val(JSON.stringify(topCarousel.adContent));
            $("#form").submit();
        }
        $scope.remove=function(topCarousel){
            if(confirm("确定删除?")){
                var action="${path}/admin/topCarousel/remove/"+topCarousel.id;
                $http.get(action).success(function (data) {
                    if(data.message){
                        $scope.topCarousels = data.topCarousels;
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
                }).error(function(){alert("服务器异常")});
            }
        }
        <%--$scope.delete=function(homePageBlock){--%>
            <%--if(confirm("确定删除?")){--%>
                <%--$http.get('${path}/admin/home_page_block/remove/'+homePageBlock.id).success(function (data) {--%>
                    <%--$scope.homePageBlockList = data;--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>

  }])

</script>