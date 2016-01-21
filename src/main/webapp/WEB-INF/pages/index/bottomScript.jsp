<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
%>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>

<script>
//    mainApp.config(function($httpProvider){//使用CORS跨域访问
//        $httpProvider.defaults.useXDomain=true;
//        delete $httpProvider.defaults.headers.common['X-Requested-With'];
//    });
    var callback=function(data){
        console.log("i am callback function");
        console.log(JSON.stringify(data));
    }
    mainApp .controller('indexController', ['$scope', '$http','$element', function ($scope, $http,$element) {

/*** 评星相关 begin**/
    $scope.max = 5;
    $scope.ratingVal =3;
    $scope.readonly = true;
    $scope.onHover = function(val){
        $scope.hoverVal = val;
    };
    $scope.onLeave = function(){
        $scope.hoverVal = null;
    }
    $scope.onChange = function(val){
        $scope.ratingVal = val;
    }
/******* end ***************/

    <%--var rd=encodeURIComponent("http://www.dabast.com/");--%>
    <%--console.log(rd);//http%3A%2F%2Fwww.dabast.com%2F--%>
    <%--$http.jsonp("https://graph.qq.com/oauth2.0/token?callback=JSON_CALLBACK&grant_type=authorization_code&client_id=101288574&client_secret=a35705ea862db09ae13407ecb76c7bd3&code=${param.code}&redirect_uri="+rd).success(function(data){--%>
        <%--console.log("call callback function");--%>
<%--//        $scope.rett=data;--%>
    <%--});--%>
}])

  $(document).ready(function(){
    Index.initLayerSlider();
  });
</script>
