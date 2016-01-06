<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script>
    $(document).ready(function(){
        $('.form_date').datetimepicker({
            language:'zh-CN',
            format:'yyyy-mm-dd hh:mm',
            weekStart: 1,
            autoclose: 1,
            todayBtn:  1,
            startDate:new Date(),
            todayHighlight: 1,
            startView: 2,
            minView: 1
        });
    });

    mainApp.controller('ProductSeriesListController', ['$scope', '$http', function ($scope, $http) {

        <%--$http.get('${path}/product_series/data').success(function (data) {--%>
            <%--$scope.list = data;--%>
            <%--console.log(JSON.stringify(data));--%>
        <%--});--%>
    }]);

</script>