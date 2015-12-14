<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.modal.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.confirm.js"></script>
<script type="text/javascript">
//    angular.module("myOrdersApp",[])
            mainApp.controller('myOrdersController', ['$scope', '$http', function ($scope, $http) {
                $scope.order={};
                $scope.orderDetail= function (orderId) {
                    $http.get("${path}/order/json/"+orderId).success(function (data) {
                        $scope.order = data;
                        $("#orderDetail").modal("show");
                    });
                }

                $scope.deleteOrder= function (orderId) {
                    $("#orderDetail").modal("hide");
                    $(this).scojs_confirm({
                        target:'#confirmDeleteOrderModal'
                    });
                    $(document).on("click","#ensure-delete",toUrl("${path}/order/delete/"+orderId));
                    <%--$http.get("${path}/order/delete/"+orderId).success(function (data) {--%>
                        <%--$scope.order = data;--%>
                        <%--$("#orderDetail").modal("show");--%>
                    <%--});--%>
                }
            }]);
//    angular.bootstrap(document.getElementById("myOrdersAppMain"), ['myOrdersApp']);
    $(document).ready(function () {
        $("#toBill").click(function () {
            $.ajax({
                url: path + "/index/login_user"

            }).done(function (data) {
                if (!data.id) {
                    console.log("user not log in");
                    $("#myModal").modal().show();
                    return false;
                }else{
                    nonHtml5Post();
                    return false;
                }
            }).fail(function(){
                console.log("error ");
                return false;
            });

        });
        $(".del-order").click(function(){
            var action=$(this).data("href");
            $("#ensure-delete").attr("href",action);
            $(this).scojs_confirm({
                target:'#confirmDeleteOrderModal'
            });
        });
    });

</script>