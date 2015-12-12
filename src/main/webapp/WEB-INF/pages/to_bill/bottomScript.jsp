<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
<script src="${path}/statics/assets/plugins/cascading-select-address-master/js/selectAddress2.js" type="text/javascript"></script>
<script>
//        (function() {
//                var app;
//                app = angular.module('toBillApp', ['selectAddress']);
//                app.controller('toBillAppCtrl', function($scope) {
//                        $scope.p = '';
//                        $scope.c = '';
//                        $scope.a = '';
//                        return $scope.d = '';
//                });
//        }).call(this);
</script>