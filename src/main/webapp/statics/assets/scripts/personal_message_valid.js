var mainApp=angular.module("mainApp",['ui.bootstrap', 'ngRoute','ngSanitize']);
mainApp.constant('pw_min',6)
mainApp.controller('PersonalMessageController',['$scope', '$http',"$timeout","pw_min", function ($scope, $http,$timeout,pw_min) {
    $scope.pw_min=pw_min;
    $scope.$watch('user.password', function (newVal, oldVal, scope) {
        if (newVal && newVal !== oldVal && newVal.length >= pw_min) {
            $scope.password=newVal;
            if (newVal.length >=pw_min && newVal.length < (pw_min+3)) {
                $scope.passwordStrength = "弱";
                $scope.cls1 = "pw_weak";
                $scope.cls2 = "pw_un_reach";
                $scope.cls3 = "pw_un_reach";
            }
            else if (newVal.length >= pw_min+3 && newVal.length < pw_min+6) {
                $scope.passwordStrength = "中";
                $scope.cls1 = "pw_mid";
                $scope.cls2 = "pw_mid";
                $scope.cls3 = "pw_un_reach";
            }
            else {
                $scope.passwordStrength = "强";
                $scope.cls1 = "pw_strong";
                $scope.cls2 = "pw_strong";
                $scope.cls3 = "pw_strong";
            }
        }
    });
    $scope.user={};
    $scope.emailUser={};//为了更新email创建的一个临时用户
    $scope.phoneUser={};//为了更新phone创建的一个临时用户
    $scope.validCodeGetted=false;
    $http.get(path+"/user/data/"+userId).success(function(data){
        $scope.user=data;
        $scope.user.validateCode="";
        $scope.user.password="";
    })
    $scope.updateUserName=function(){
        $http.post(path+"/user/update/name",$scope.user).success(function(data){
            $scope.user=data;
            $scope.modifyName=false;
        })
    }

    $scope.updateUserPassword=function(){
        $http.post(path+"/user/update/password",$scope.user).success(function(data){
            $scope.user=data;
            $scope.editPassword=false;
        })
    }
    $scope.updateUserEmail=function(){
        $http.post(path+"/user/update/email",$scope.user).success(function(data){
            $scope.user=data;
            $scope.editEmail=false;
            $scope.sending=undefined;
            $scope.sent=undefined;
            $scope.user.validateCode="";
            $scope.validCodeGetted=false;
        })
    }
    $scope.updateUserPhone=function(){
        $http.post(path+"/user/update/phone",$scope.user).success(function(data){
            $scope.user=data;
            $scope.editPhone=false;
            $scope.sending=undefined;
            $scope.sent=undefined;
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
            requestUrl=path+"/user/email/edit/validate_code?email="+$scope.user.email
        }else{
            requestUrl=path+"/user/phone/edit/validate_code?phone="+$scope.user.phone
        }
        $http({
            method:"POST",
            url:requestUrl
        }).success(function(data){
            if(type==="email"){
                $scope.sending=false;
                $scope.sent=true;
                $scope.user.validateCode="";
                $scope.validateCode=data.message;
            }
            if(type==="phone"){
                var seconds=25;
                //console.log(data.message);
                $scope.phoneValidateCode=data.message;
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
        }).error(function(data){
            $scope.sending=true;
            $scope.sent=false;

            //$scope.message="服务器的错误导致邮件发送失败";
        });
    }
}])
    .directive("ensureEmailUnique", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                //var timeout;
                scope.$watch(attrs.ngModel,function(n){
//                         console.log(scope.ngModel);
                    if(!n) return;

                    //if(timeout) $timeout.cancel(timeout);
                    //timeout=$timeout(function(){
                    //var data={}
                    //data[attrs.ngModel]=attrs.ensureEmailUnique;
                    //console.log("key:"+attrs.ngModel)
                    //console.log("value:"+attrs.ensureUnique)
                    $http({
                        method:"POST",
                        url:path+"/user/exist_email2",
                        data:scope.user
                    }).success(function(data){
                        c.$setValidity('unique',data.unique);
                    }).error(function(data){
                        c.$setValidity('unique',false);
                    });
                    //},300);

                });

            }
        }
    })
    .directive("ensureEmailValidateCode", function ($http) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                scope.$watch(attrs.ngModel,function(newVal){
                    if(!newVal) return;
                    if(scope.user.validateCode===scope.validateCode){
                        c.$setValidity('codeValid',true);
                    }else{
                        c.$setValidity('codeValid',false);
                    }
                });
            }
        }
    })
    .directive("phoneNumberValid", function () {//手机
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                scope.$watch(attrs.ngModel,function(n){
                    if(!n) return;
                    if(!/(^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$)/i.test(n))
                    {
                        c.$setValidity('validPhoneNumber',false);

                    }else{
                        c.$setValidity('validPhoneNumber',true);
                    }
                });

            }
        }
    })
    .directive("ensurePhoneUnique", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){


                var timeout;
                scope.$watch("user.phone",function(n){
                    if(!n) return;
                    if(n.length!==11) {c.$setValidity('unique',true);return;}
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        $http({
                            method:"POST",
                            url:path+"/user/exist_phone",
                            data:scope.user
                        }).success(function(data){
                            c.$setValidity('unique',data.unique);
                        }).error(function(data){
                            c.$setValidity('unique',false);
                        });
                    },300);

                });

            }
        }
    })
    .directive("ensurePhoneValidateCode", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                scope.$watch(attrs.ngModel,function(newVal){
                    if(!newVal) return;
                    if(scope.user.validateCode===scope.phoneValidateCode){
                        c.$setValidity('codeValid',true);
                    }else{
                        c.$setValidity('codeValid',false);
                    }
                });
            }
        }
    })
    .directive('pwCheck', [function () {
        return {
            require: 'ngModel',
            link: function (scope, elem, attrs, ctrl) {
                var firstPassword =attrs.pwCheck;
                elem.add($(firstPassword)).on('keyup', function () {
                    scope.$apply(function () {
                        //console.log("scope.password"+scope.password);
                        //console.log("first:"+firstPassword+"-"+$(firstPassword).val());
                        //var v = elem.val()===$(firstPassword).val();
                        //console.log("scope.rePassword:"+scope.rePassword);
                        ctrl.$setValidity('pwmatch', !scope.user.password ||!scope.user.rePassword || scope.user.rePassword&&scope.user.password===scope.user.rePassword);
                    });
                });
            }
        }
    }])