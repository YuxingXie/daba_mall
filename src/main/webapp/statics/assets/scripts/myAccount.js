'use strict';
var app=angular.module('myAccountApp',['ui.bootstrap', 'ngRoute']);
//          app.controller("myAccountAppController",["$http",function($http){}]);
app.config(['$routeProvider', '$locationProvider', '$sceProvider', function ($routeProvider, $locationProvider, $sceProvider) {
    $routeProvider
        .when('/', {controller: 'DemoCtrl'})
        .when('/abc', {controller: 'DemoCtrl'})
        .when('/123', {controller: 'DemoCtrl'})
        .otherwise({redirectTo: '/'});
    $locationProvider.html5Mode(true);
}]);

app.controller('myAccountAppController', function ($scope, $location) {
    $scope.isActive = function (route) {
        if ($location.path().indexOf('/dropdown') == 0) {
            return  route === '/dropdown';
        }
        return route === $location.path();
    }
});

app.controller('DemoCtrl', function () {
    // nothing
});
angular.bootstrap(document.getElementById("myAccountAppMain"),"myAccountApp");