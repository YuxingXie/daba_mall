<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script> path="${path}";</script>
<script>
    containsIgnoreCases=function(full,part){
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
</script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
<html ng-app="myApp" ng-init="banks=[{'code':'ABC','name':'中国农业银行'},{'code':'ICBC','name':'中国工商银行'},{'code':'BOC','name':'交通银行'}]">
<head>
    <title></title>
</head>
<body ng-controller="myController">
  <div>
    <input type="text" placeholder="输入银行代码或名称或卡号" ng-model="codeInput"/>
    <div ng-repeat="bank in banks">
      <div ng-show="codeMatch('{{bank.code}}')">{{bank.name}}</div>
    </div>
  </div>
</body>
<script>

  angular.module("myApp",[]).controller("myController",function($scope){
    $scope.codeMatch=function(code){
      if(!$scope.codeInput){
        return true;
      }
      if(containsIgnoreCases(code,$scope.codeInput)){
        return true;
      }
      return false;
    };
  });
</script>
</html>
