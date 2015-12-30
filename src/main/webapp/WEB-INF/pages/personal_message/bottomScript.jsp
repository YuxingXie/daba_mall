<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    mainApp.controller('PersonalMessageController',['$scope', '$http',"$timeout", function ($scope, $http,$timeout) {
        $scope.user={};
        $scope.emailUser={};//为了更新email创建的一个临时用户
        $scope.phoneUser={};//为了更新phone创建的一个临时用户
        $scope.validCodeGetted=false;
        $http.get("${path}/user/${sessionScope.loginUser.id}").success(function(data){
            $scope.user=data;
            $scope.user.validateCode="";
        })
        $scope.updateUserName=function(){
            $http.post("${path}/user/update/name",$scope.user).success(function(data){
                $scope.user=data;
                $scope.modifyName=false;
            })
        }
        $scope.updateUserEmail=function(){
            var pairUsers={};
            pairUsers.firstUser=$scope.user;
            pairUsers.secondUser=$scope.emailUser;
            $http.post("${path}/user/update/email",pairUsers).success(function(data){
                $scope.user=data;
                $scope.editEmail=false;
                $scope.sending=undefined;
                $scope.sent=undefined;
                $scope.emailUser={};
                $scope.user.validateCode="";
                $scope.validCodeGetted=false;
            })
        }

        $scope.toggleModifyName=function(){
            $scope.modifyName=!$scope.modifyName;
        }
        $scope.getValidCode = function (type){
            $scope.sent=false;
            $scope.sending=true;
            $scope.validCodeGetted=true;
            var requestUrl;
            if(type==="email"){
                requestUrl=path+"/user/validate_code/email?email="+$scope.user.email
            }else{
                requestUrl=path+"/user/validate_code/phone?phone="+$scope.user.phone
            }
            $http({
                method:"POST",
                url:requestUrl
            }).success(function(data){
                if(type==="email"){
                    $scope.sending=false;
                    $scope.sent=true;
                    $scope.user.validateCode="";
                    $scope.emailUser=data;
                }
                if(type==="phone"){
                    var seconds=25;
                    var test=true;
                    console.log(data.message);
                    $scope.phoneUser=data;
                    if(data.message!=="100"&&!test){
                        $scope.sending=true;
                        $scope.sent=false;
                    }else{
                        $scope.sending=false;
                        $scope.sent=true;
                        var countDown=function(){
                            $timeout(function(){
                                seconds--;
                                $scope.seconds=seconds;
                                if(seconds==0) $timeout.cancel();
                                else countDown();
                            },1000);
                        };
                        countDown();
                    }
                }
//                $scope.validateCode=""

            }).error(function(data){
                $scope.sending=true;
                $scope.sent=false;

                //$scope.message="服务器的错误导致邮件发送失败";
            });
        }
    }])
</script>
