<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script>
        $('.form_date').datetimepicker({
                language:'zh-CN',
                format:'mm/yy',
                weekStart: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 3,
                minView: 3
        });
        var containsIgnoreCases=function(full,part){
                if(!full) return false;
                if(full==="") return false;
                if(!part) return true;
                if(part==="") return true;
                var fullStr=full.toString();
                var partStr=part.toString();
                if(fullStr.length<partStr.length) return false;
                for(var i=0;i<partStr.length;i++){//abc
                        var partStrChar=partStr.substring(0,i+1);
                        if(fullStr.indexOf(partStrChar)<0 &&fullStr.indexOf(partStrChar.toLowerCase())<0&&fullStr.indexOf(partStrChar.toUpperCase())<0){
                                return false;
                        }
                }
                return true;
        }
        var matchCode=function(code,input){
                return containsIgnoreCases(code,input);
        }
        var matchNo=function(cardSorts,input){
                if(!input) return true;
                if(input==="") return true;
                if(!cardSorts) return false;
                if(cardSorts==="") return false;
                if(cardSorts==="[]") return false;
                if(!Array.isArray(cardSorts)) return false;
                for(var i=0;i<cardSorts.length;i++){
                        var cardSort=cardSorts[i];
                        var noStart=cardSort.noStart;
                        if(!noStart) continue;
                        if(noStart==="")continue;
                        if(noStart.indexOf(input)>=0){
                                return true;
                        }
                        continue;
                }
                return false;
        }
        mainApp.controller("bankController",["$scope","$http",function($scope,$http){
                $scope.isShow=false;
                $scope.order={};
                $scope.order.payWay='2'
                $scope.order.payAccount={};
                $scope.order.payAccount.bank={};
                $scope.bank={};
                $scope.getBanks=function(){
                        if($scope.banks) return;
                        $http.get(path+"/bank/json")
                        .success(function(response){
                                $scope.banks=response;
                        });
                }

                $scope.isShow=false;
                $http.get(path+"/user/accs")
                .success(function(data){
                        $scope.accounts=data;
                        $scope.useAccount=$scope.accounts[0];
                });
                $scope.matches=function(bank){
                        var code=bank.code;
                        var cardSorts=bank.cardSorts;
                        if(!$scope.cardNoOrCode){
                                return true;
                        }
                        if(matchCode(code,$scope.cardNoOrCode)||matchNo(cardSorts,$scope.cardNoOrCode)){
                                return true;
                        }
                        return false;
                };
                $scope.showPic=function(){
                        $scope.isShow=! $scope.isShow;
                }
                $scope.submit=function(){
                        var url="${path}/order/pay";
//                        console.log(JSON.stringify($scope.bank));
                        $scope.order.payAccount.bank.id=$scope.bank.id;
//                        console.log(JSON.stringify($scope.order));
                        $http.post( url,$scope.order).success(function (charge) {
                                console.log(JSON.stringify(charge));
//                                console.log(JSON.stringify(pingppPc))
//                                window.pingppPc.payment(charge, function(result, err){
//                                // 处理错误信息
//                                alert(err);
//                                });
                                var $shortcutsPayModal=$("#shortcutsPayModal");
                                $shortcutsPayModal.modal("hide");
                                $("#pay-msg").show().animate({width: '250px'}, 200).fadeOut(2500);

                        }).error(function(){ console.log("error！"); });
                        return false;
                }
                $scope.shortcutsPay=function(bank){
                        $scope.bank=bank;
                        var $shortcutsPayModal=$("#shortcutsPayModal");
                        $shortcutsPayModal.modal().show();
                }
        }])
        .directive("cardValidDateValid", function () {//
                return{
                        require:"ngModel",
                        link:function(scope,ele,attrs,c){
                                scope.$watch(attrs.ngModel,function(n){
                                        if(!n) return;
                                        if(scope.order.payAccount.cardSort==='2')
                                        {
                                                c.$setValidity('validCardValidDate',true);
                                        }else{
                                                c.$setValidity('validCardValidDate',true);
                                        }
                                });

                        }
                }
        })

        $(document).ready(function(){});
</script>