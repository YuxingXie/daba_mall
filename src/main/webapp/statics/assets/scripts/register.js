       mainApp.directive('pwCheck', [function () {
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
                            ctrl.$setValidity('pwmatch', !scope.password ||!scope.rePassword || scope.rePassword&&scope.password===scope.rePassword);
                        });
                    });
                }
            }
        }])
    .directive("ensureNameUnique", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                var timeout;
                scope.$watch(attrs.ngModel,function(n){
                    if(!n) return;
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        var data={}
                        data[attrs.ngModel]=attrs.ensureNameUnique;
                        $http({
                            method:"POST",
                            url:path+"/user/exist_name",
                            data:data
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
    .directive("ensureEmailUnique", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                var timeout;
                scope.$watch(attrs.ngModel,function(n){
//                         console.log(scope.ngModel);
                    if(!n) return;
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        var data={}
                        data[attrs.ngModel]=attrs.ensureEmailUnique;
                        //console.log("key:"+attrs.ngModel)
                        //console.log("value:"+attrs.ensureUnique)
                        $http({
                            method:"POST",
                            url:path+"/user/exist_email",
                            data:data
                        }).success(function(data){
                            console.log(JSON.stringify(data));
                            c.$setValidity('unique',data.unique);
                        }).error(function(data){
                            c.$setValidity('unique',false);
                        });
                    },300);

                });

            }
        }
    })
    .directive("ensurePhoneUnique", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                var timeout;
                scope.$watch(attrs.ngModel,function(n){
//                         console.log(scope.ngModel);
                    if(!n) return;
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        var data={}
                        data[attrs.ngModel]=attrs.ensurePhoneUnique;
                        console.log("key:"+attrs.ngModel)
                        console.log("value:"+attrs.ensurePhoneUnique)
                        $http({
                            method:"POST",
                            url:path+"/user/exist_phone",
                            data:data
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
    .directive("ensureValidateCode", function ($http,$timeout) {
        return{
            require:"ngModel",
            link:function(scope,ele,attrs,c){
                var timeout;
                scope.$watch(attrs.ngModel,function(newVal){
                    if(!newVal) return;
                    c.$setValidity('finishValid',false);
                    if(timeout) $timeout.cancel(timeout);
                    timeout=$timeout(function(){
                        var data={};
                        data["email"]=scope.email;
                        data["validateCode"]=attrs.ensureValidateCode;
//                        data["validateCode"]=scope.validateCode;
                        $http({
                            method:"POST",
                            url:path+"/user/email/validate",
                            data:data
                        }).success(function(data){
                            c.$setValidity('codeValid',data.codeValid);
                            c.$setValidity('finishValid',true);
                        }).error(function(data){
                            c.$setValidity('codeValid',false);
                            c.$setValidity('finishValid',false);
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
               var timeout;
               scope.$watch(attrs.ngModel,function(newVal){
                   if(!newVal) return;
                   c.$setValidity('finishValid',false);
                   if(timeout) $timeout.cancel(timeout);
                   timeout=$timeout(function(){
                       var data={};
                       data["phone"]=scope.phone;
                       data["validateCode"]=attrs.ensurePhoneValidateCode;
//                        data["validateCode"]=scope.validateCode;
                       $http({
                           method:"POST",
                           url:path+"/user/phone/validate",
                           data:data
                       }).success(function(data){
                           c.$setValidity('codeValid',data.codeValid);
                           c.$setValidity('finishValid',true);
                       }).error(function(data){
                           c.$setValidity('codeValid',false);
                           c.$setValidity('finishValid',false);
                       });
                   },300);

               });

           }
       }
   })
    .constant('pw_min',6)
    .controller("formController", ["$scope","$http","$timeout","pw_min","$location",function ($scope,$http,$timeout,pw_min) {
        $scope.pw_min=pw_min;
        $scope.$watch('email', function (newVal, oldVal, scope) {if(newVal !== oldVal)$scope.email=newVal})
        $scope.$watch('password', function (newVal, oldVal, scope) {
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
        $scope.getValidCode = function (type){

            $scope.sent=false;
            $scope.sending=true;
            var requestUrl;
            if(type==="email"){
                requestUrl=path+"/user/register/validate_code/email?email="+$scope.email
            }else{
                requestUrl=path+"/user/register/validate_code/phone?phone="+$scope.phone
            }
            $http({
                method:"POST",
                url:requestUrl
            }).success(function(data){

                if(type==="email"){
                    $scope.url=data.url;
                    $scope.sending=false;
                    $scope.sent=true;
                }
                if(type==="phone"){
                    var seconds=8;
                    if(data.message!=="100"){
                        $scope.sending=true;
                        $scope.sent=false;
                    }else{
                        $scope.sending=false;
                        $scope.sent=true;
                        var countDown=function(){
                            $timeout(function(){
                                seconds--;
                                $scope.seconds=seconds;
                                console.log($scope.seconds);
                                if(seconds==0) $timeout.cancel();
                                else countDown();
                            },1000);
                        };
                        countDown();
                    }

                }
                $scope.validateCode=""
            }).error(function(data){
                $scope.sending=true;
                $scope.sent=false;
                //$scope.message="服务器的错误导致邮件发送失败";
            });
        }

    }])

