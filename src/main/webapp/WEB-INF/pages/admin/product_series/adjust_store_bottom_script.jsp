<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script>
    mainApp.controller('AdjustStoreController', ['$scope', '$http', function ($scope, $http) {

        <%--$http.get('${path}/product_series/data').success(function (data) {--%>
            <%--$scope.list = data;--%>
            <%--console.log(JSON.stringify(data));--%>
        <%--});--%>
    }]);

</script>