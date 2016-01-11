<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script>


    mainApp.controller('ReturnExchangeController', ['$scope', '$http','$compile', function ($scope, $http,$compile) {
        <%--$scope.homePageBlockList = [];--%>
        $scope.orders=[];
        $http.get('${path}/admin/order/to_return_exchange/data').success(function (data) {
            $scope.orders = data;
        });
        $scope.handler=function(order){
            if(confirm("确定处理?")){
                $http.post('${path}/admin/order/handler',order).success(function (data) {
                    $scope.orders = data;
                });
            }
        }
        $http.get('${path}/order/all/json').success(function (ret) {
            $scope.data = ret;
            console.log(JSON.stringify(ret));
        });
        $scope.findOrder=function(){
            $http.get('${path}/order/json/'+$scope.orderId).success(function (data) {
                $scope.orders[0] = data;
            });
        }
        $scope.myOption = {
            options: {
                html: true,
                minLength: 1,
                onlySelectValid: true,
                outHeight: 50,
                source: function (request, response) {

//                    var data = [
//                        "Asp",
//                        "BASIC",
//                        "C",
//                        "C++",
//                        "Clojure",
//                        "COBOL",
//                        "ColdFusion",
//                        "Erlang",
//                        "Fortran",
//                        "Groovy",
//                        "Haskell",
//                        "Java",
//                        "JavaScript",
//                        "Lisp",
//                        "Perl",
//                        "PHP",
//                        "Python",
//                        "Ruby",
//                        "Scala",
//                        "Scheme"
//                    ];
                    var data=$scope.data;
                    data = $scope.myOption.methods.filter(data, request.term);

                    if (!data.length) {
                        data.push({
                            label: '没有找到订单号......',
                            value: null
                        });
                    }
                    // add "Add Language" button to autocomplete menu bottom
//                    data.push({
//                        label: $compile('<a class="ui-menu-add" ng-click="add()">Add Language</a>')($scope),
//                        value: null
//                    });
                    response(data);
                }
            },
            events: {
                change: function (event, ui) {
//                    console.log('change', event, ui);
                },
                select: function (event, ui) {
//                    console.log('select', event, ui);
                }
            }
        };
        $scope.changeClass = function (options) {
            var widget = options.methods.widget();
            // remove default class, use bootstrap style
            widget.removeClass('ui-menu ui-corner-all ui-widget-content').addClass('dropdown-menu');
        };
  }])
    $(document).ready(function(){
        $("#tags").autocomplete({
//            source: ['a','aa','aaa']
        });
    })
</script>