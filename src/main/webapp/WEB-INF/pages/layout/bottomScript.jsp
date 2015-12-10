<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<%--弹出二级菜单相关--%>
<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/tooltip.js"></script>
<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/js/popover.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.2.19/angular-route.min.js"></script>
<script src="${path}/statics/assets/plugins/angular-1.2.19/ui-bootstrap-tpls.min.js"></script>
<script src="${path}/statics/assets/plugins/angularJs-pagination/src/pagination/tm.pagination.js"></script>
<%--<script src="${path}/statics/assets/plugins/cascading-select-address-master/js/selectAddress2.js" type="text/javascript"></script>--%>
<script>
    var mainApp=angular.module("mainApp",['ui.bootstrap', 'ngRoute','tm.pagination']);
    mainApp .controller('mainController', ['$scope', '$http', function ($scope, $http) {

        $http.get('${path}/user/cart').success(function (data) {
            $scope.cart = data;
        });
        $scope.deleteGoods=function(productSelected){
            console.log(JSON.stringify(productSelected));
        }
        $scope.initProductMenu= function () {
            if(!$scope.productCategories){
                $http.get('${path}/product_series/categories').success(function (data) {
                    $scope.productCategories = data;
//                    console.log(JSON.stringify(data));
                });
            }

        }
    }]);

</script>