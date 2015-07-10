var myApp = angular.module('registerApp', [])
        .directive('pwCheck', [function () {
            return {
                require: 'ngModel',
                link: function (scope, elem, attrs, ctrl) {
                    var firstPassword =attrs.pwCheck;
                    elem.add(firstPassword).on('keyup', function () {
                        scope.$apply(function () {
                            var v = elem.val()===$(firstPassword).val();
                            ctrl.$setValidity('pwmatch', v);
                        });
                    });
                }
            }
        }])
        .directive("ensureUnique", function ($http,$timeout) {
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
                            data[attrs.ngModel]=attrs.ensureUnique;
                            console.log("key:"+attrs.ngModel)
                            console.log("value:"+attrs.ensureUnique)
                            $http({
                                method:"POST",
                                url:"exist",
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
//            scope:{
//                ngModel:"=",
//                email:'@'
//            },
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
        .constant('pw_min',6)
        .controller("formController", ["$scope","$http","pw_min",function ($scope,$http,pw_min) {
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
            $scope.getValidCode = function (){
                $scope.mailSent=false;
                $scope.mailSending=true;
                $http({
                    method:"POST",
                    url:path+"/user/register/validate_code/email?email="+$scope.email
                }).success(function(data){
                    $scope.mailSending=false;
                    $scope.mailSent=true;
                    $scope.url=data.url;
                }).error(function(data){
                    $scope.mailSending=true;
                    $scope.mailSent=false;
                });
            }
            $scope.signupForm=function(){
                console.log($scope.signupForm.password);
                console.log($scope.signupForm.rePassword);
                alert("i will do");
            }
        }])
