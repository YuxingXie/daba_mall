<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
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
                        $http.get(path+"/statics/assets/plugins/bank/bankInfo.json")
                        .then(function(response){
                                $scope.banks=response.data;
                        });
                        $scope.isShow=false;
                        $http.get(path+"/user/accounts")
                        .success(function(data){
                                $scope.accounts=data;
                                $scope.account=$scope.accounts[0];
                        }).error(function(data){
//                                $("#error-area").text("对不起，服务器出了点错");
//                                $("#showErrorModal").modal().show();
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
        }]);
//        angular.bootstrap(document.getElementById("bankAppMain"),["bankApp"]);

        $(document).ready(function(){
                $(document).on("click","#shortcuts .bank-ico",function () {
                        var $shortcutsPayModal=$("#shortcutsPayModal");
                        var $img=$('<img src="'+path+'/statics/assets/plugins/bank/ico/'+$(this).data("ico")+'"/>');
                        var $bankName=$shortcutsPayModal.find('[name="bankName"]');
                        $bankName.empty();
                        $bankName.append($img);
                        $bankName=$shortcutsPayModal.modal().show();
                });
        });
</script>