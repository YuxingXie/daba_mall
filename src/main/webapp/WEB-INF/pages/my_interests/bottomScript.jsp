<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/shopping-cart-fly/jquery.fly.min.js"></script>
<script src="${path}/statics/assets/plugins/shopping-cart-fly/requestAnimationFrame.js"></script>
<script>
var shoppingCartFly=function(start,end){
    var offset = end.offset();
    start.click(function(event){
        var addcar = $(this);
        var img = addcar.parent().find('img').attr('src');
        var flyer = $('<img class="u-flyer" src="'+img+'">');
        flyer.fly({
            start: {
                left: event.pageX,
                top: event.pageY
            },
            end: {
                left: offset.left+10,
                top: offset.top+10,
                width: 0,
                height: 0
            },
            onEnd: function(){
                $("#msg").show().animate({width: '250px'}, 600).fadeOut(1800);
//                addcar.css("cursor","default").removeClass('orange').unbind('click');
                this.destory();
            }
        });
    });
}
var easyzoom=function(){
    // Instantiate EasyZoom instances

    var $easyzoom = $('.easyzoom').easyZoom();

    // Setup thumbnails example
    var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');

    $('.thumbnails').on('click', 'a', function(e) {
        var $this = $(this);

        e.preventDefault();

        // Use EasyZoom's `swap` method
        api1.swap($this.data('standard'), $this.attr('href'));
    });
    // Setup toggles example
    var api2 = $easyzoom.filter('.easyzoom--with-toggle').data('easyZoom');

    $('.toggle').on('click', function() {
        var $this = $(this);

        if ($this.data("active") === true) {
            $this.text("Switch on").data("active", false);
            api2.teardown();
        } else {
            $this.text("Switch off").data("active", true);
            api2._init();
        }
    });
}
mainApp.controller("myInterestsController",["$scope","$http",function($scope,$http){
    $http.get(path+"/personal/interests/json").then(function(interests){
        $scope.interests=interests.data;
    });

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
}])
$(document).ready(function() {
easyzoom();
shoppingCartFly($(".add2cart"),$("#cart-block"));
});
</script>
