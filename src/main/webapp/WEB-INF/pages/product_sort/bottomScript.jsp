<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    mainApp.controller('productSortCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.sortDefault={field:"default",asc:"n"}
        $scope.sortPrice={field:"price",asc:"n"}
        $scope.sortSales={field:"sales",asc:"n"}
        $scope.sortEvaluate={field:"evaluate",asc:"n"}
        $scope.paginationConf ={currentPage: 1, pagesLength: 9,perPageOptions: [10, 20, 30, 40, 50]};
        $scope.doRequest=function(sort){
            if(!sort){
                sort={};
                sort.field='default';
                sort.asc=true;
            }
            $http.post(path+'/product_series/sort/json/${productSubCategory.id}',sort).success(function (data) {
                $scope._page = data._page;
                $scope.page = data.page;
                $scope.paginationConf = {
                    currentPage: $scope.page,
                    totalItems: $scope._page.totalElements,
                    itemsPerPage: $scope._page.size,
                    pagesLength:9,
                    perPageOptions: [10, 20, 30, 40, 50],
                    onChange: function(){
                        $http.post(path+'/product_series/sort/json/${productSubCategory.id}?page='+this.currentPage,sort).success(function (data) {
                            $scope._page = data._page;
                            $scope.page=data.page;
                        });
                    }
                };
            })
        }
        $scope.doRequest();
        $scope.toSort=function(sort){
            if(sort.asc==='n') sort.asc=true;
            console.log(JSON.stringify(sort))
            $scope.doRequest(sort);
            sort.asc=!sort.asc;
        }
            }]).filter('cut', function () {
                return function (value, wordwise, max, tail) {
                    if (!value) return '';

                    max = parseInt(max, 10);
                    if (!max) return value;
                    if (value.length <= max) return value;

                    value = value.substr(0, max);
                    if (wordwise) {
                        var lastspace = value.lastIndexOf(' ');
                        if (lastspace != -1) {
                            value = value.substr(0, lastspace);
                        }
                    }

                    return value + (tail || ' …');
                };
            });
    $(document).ready(function(){


    });
</script>
<%--<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>--%>
<!-- END PAGE LEVEL JAVASCRIPTS -->