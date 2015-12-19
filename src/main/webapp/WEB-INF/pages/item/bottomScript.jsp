<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap-star-rating-master/js/star-rating.min.js" type="text/javascript"></script>

<script src="${path}/statics/assets/plugins/bootstrap-tour-0.10.2/js/bootstrap-tour.js"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
<%--<script src="${path}/statics/assets/plugins/bootstrap-paginator-master/build/bootstrap-paginator.min.js"></script>--%>
<script src="${path}/statics/assets/plugins/shopping-cart-fly/jquery.fly.min.js"></script>
<script src="${path}/statics/assets/plugins/shopping-cart-fly/requestAnimationFrame.js"></script>


<script type="text/javascript">
//    angular.module("productSeriesApp",[])
    mainApp.controller('productSeriesCtrl', ['$scope', '$http', function ($scope, $http) {
        $scope.productSelected={};
        $scope.productSelected.productPropertyValueList=[];
        $scope.productSelected.amount = 1;
        $scope.interested=false;

        $scope.paginationConf = {
//            currentPage: 1,
//            totalItems: 20,
//            itemsPerPage: 6,
//            pagesLength:9,
//            perPageOptions: [10, 20, 30, 40, 50]
        }
        var url="${path}/product_series/data/${id}";
        <c:if test="${not empty orderId}">url+="?orderId=${orderId}";</c:if>
        $http.get(url).success(function(data){
            $scope.productSeries=data.productSeries;
            $scope.productSelected.productSeries= $scope.productSeries;
            $scope._page=data._page;
            $scope.page=data.page;
            $scope.interested=data.interested;
            $scope.order=data.order;
            if($scope.order){
                var $tour_step1=$(".tour-step1");
                var tour = new Tour({
                    storage:false,
                    debug:false,
                    backdrop:true,
                    template: "<div class='popover'><div class='arrow'></div>" +
                    "<h3 class='popover-title'></h3>" +
                    "<div class='popover-content'></div>" +
                    "<div class='popover-navigation'>" +
                    " <button class='btn btn-default' data-role='prev'>« 前一步</button>" +
                    " <span data-role='separator'>|</span> " +
                    "<button class='btn btn-default' data-role='next'>下一步 »</button> " +
                    "</div><a class='btn btn-primary pull-right' data-role='end'>我知道了!</a></nav></div>",
                    steps: [
                        {
                            element: ".tour-step1",
                            title: "提示",
                            content: "点击这个按钮可以发表评论"
                        },{
                            element: ".tour-step2",
                            title: "提示",
                            content: "在这里可以查看你发表的评论"
                        }
                    ]
                });
                tour.init();
                tour.start();
            }
            $scope.ratingVal = $scope.productSeries.productSeriesEvaluateGrade?$scope.productSeries.productSeriesEvaluateGrade:0;

            if($scope.productSeries && $scope.productSeries.productProperties &&$scope.productSeries.productProperties.length){
                for(var i=0;i<$scope.productSeries.productProperties.length;i++){
                    var productProperty=$scope.productSeries.productProperties[i];
                    var propertyValues=productProperty.propertyValues;
                    if(propertyValues&&propertyValues.length){
                        $scope.productSelected.productPropertyValueList[i]=propertyValues[0];//默认选中第一个属性值
                    }
                }
            }
            $scope.paginationConf = {
                currentPage: $scope.page,
                totalItems: $scope._page.totalElements,
                itemsPerPage: $scope._page.size,
                pagesLength:9,
                perPageOptions: [10, 20, 30, 40, 50],
                onChange: function(){
                    $http.get(path+'/product_series/data/${id}?page='+this.currentPage).success(function (data) {
                        $scope._page = data._page;
                        $scope.page=data.page;
                    });
                }
            };
        });
        $scope.max = 5;
        $scope.ratingVal =3;
        $scope.readonly = true;
        $scope.changeImg=function(currentImg){
            $scope.currentImg=currentImg;
        }
        $scope.add2cart=function(){
            $http.post('${path}/index/cart', $scope.productSelected).success(function(data){
                $scope.$parent.cart=data;
            }).error(function(data) {
                alert("对不起，服务器出现了点异常!");
            });
        }
        $scope.onHover = function(val){
            $scope.hoverVal = val;
        };
        $scope.onLeave = function(){
            $scope.hoverVal = null;
        }
        $scope.onChange = function(val){
            $scope.ratingVal = val;
        }
        $scope.toReply=function(productEvaluate,reply){
            loginCheckBeforeHandler(function(){
                var url="${path}/product_series/evaluate/reply";
                reply.parent=productEvaluate;
//                reply.parent.id=productEvaluate.id;
                $http.post(url,reply).success(function(data){
//                    $scope.reply.content=undefined;
                    for(var i=0;i<$scope._page.content.length;i++){
                        var productEvaluateInPage=$scope._page.content[i];
                        if(productEvaluateInPage.id===productEvaluate.id){
                            $scope._page.content[i].replies=data;
                            break;
                        }
                    }
                });

            });
        }
        $scope.toPraise=function(productEvaluate){
            loginCheckBeforeHandler(function(){
                var url="${path}/product_series/evaluate/praise/"+productEvaluate.id;
                $http.get(url).success(function(data){
                    for(var i=0;i<$scope._page.content.length;i++){
                        var productEvaluateInPage=$scope._page.content[i];
                        if(productEvaluateInPage.id===productEvaluate.id){
                            $scope._page.content[i].praises=data;
                            break;
                        }
                    }
                });

            });
        }
        $scope.isEvaluated=function(orderId,productSeriesId){
            var url="${path}/order/evaluated?orderId="+orderId+"&productSeriesId="+productSeriesId;
            $http.get(url).success(function (data) {
                var isEvaluated = data.isEvaluated;
                if(isEvaluated){
                    alert("您已经评价过了")
                }else{
                    $("#evaluateModal").modal().show();
                }
            });
        }
        $scope.toggleInterest=function(){
            var url="${path}/product_series/toggle_interest";
            url+="?productSeriesId="+$scope.productSeries.id;
            $http.get(url).success(function (data) {
                $scope.interested = data.interested;
            });
        }
        $http.get('${path}/product_series/data/${id}?orderId=${requestScope.orderId}').success(function (data) {
            $scope.data = data;
        });

    }])
    .directive('star', function () {
        return {
            template: '<ul class="rating" ng-mouseleave="leave()">' +
            '<li ng-repeat="star in stars" ng-class="star" ng-click="click($index + 1)" ng-mouseover="over($index + 1)">' +
            '\u2605' +
            '</li>' +
            '</ul>',
            scope: {
                ratingValue: '=',
                max: '=',
                readonly: '@',
                onHover: '=',
                onLeave: '='
            },
            controller: function($scope){
                $scope.ratingValue = $scope.ratingValue || 0;
                $scope.max = $scope.max || 5;
                $scope.click = function(val){
                    if ($scope.readonly && $scope.readonly === 'true') {
                        return;
                    }
                    $scope.ratingValue = val;
                };
                $scope.over = function(val){
                    $scope.onHover(val);
                };
                $scope.leave = function(){
                    $scope.onLeave();
                }
            },
            link: function (scope, elem, attrs) {
                elem.css("text-align", "center");
                var updateStars = function () {
                    scope.stars = [];
                    for (var i = 0; i < scope.max; i++) {
                        scope.stars.push({
                            filled: i < scope.ratingValue
                        });
                    }
                };
                updateStars();

                scope.$watch('ratingValue', function (oldVal, newVal) {
                    if (newVal) {
                        updateStars();
                    }
                });
                scope.$watch('max', function (oldVal, newVal) {
                    if (newVal) {
                        updateStars();
                    }
                });
            }
        };
    });
//    angular.bootstrap(document.getElementById("page-main"), ['productSeriesApp']);
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
                $("#msg").show().animate({width: '250px'}, 200).fadeOut(1000);
//                addcar.css("cursor","default").removeClass('orange').unbind('click');
                this.destory();
            }
        });
    });
}

    jQuery(document).ready(function() {
        easyzoom();
        shoppingCartFly($(".add2cart"),$("#cart-block"));
//        $(".rating-kv").rating();
//        var $easyzoom = $('.easyzoom').easyZoom();
//        var api = $easyzoom.data('easyZoom');
//        var $tour_step1=$(".tour-step1");
//        if($tour_step1.length){
//            var tour = new Tour({
//                storage:false,
//                debug:false,
//                backdrop:true,
//                template: "<div class='popover'><div class='arrow'></div>" +
//                "<h3 class='popover-title'></h3>" +
//                "<div class='popover-content'></div>" +
//                "<div class='popover-navigation'>" +
//                " <button class='btn btn-default' data-role='prev'>« 前一步</button>" +
//                " <span data-role='separator'>|</span> " +
//                "<button class='btn btn-default' data-role='next'>下一步 »</button> " +
//                "</div><a class='btn btn-primary pull-right' data-role='end'>我知道了!</a></nav></div>",
//                steps: [
//                    {
//                        element: ".tour-step1",
//                        title: "提示",
//                        content: "点击这个按钮可以发表评论"
//                    },{
//                        element: ".tour-step2",
//                        title: "提示",
//                        content: "在这里可以查看你发表的评论"
//                    }
//                ]
//        });
//            tour.init();
//            tour.start();
//        }

//        App.init();
//        App.initBxSlider();
//        App.initImageZoom();
//        App.initSliderRange();
//        App.initUniform();
//        App.initTouchspin();
//        $(function() {$('#menu').metisMenu();});
//        $(document).on("click",".product-image",function(){
//            var $productMainImage=$(".product-main-image").find("img");
//            var imgSrc=$(this).attr("src");
//            $productMainImage.attr("src",imgSrc);
//            $productMainImage.attr("data-BigImgSrc",imgSrc);
//            App.initImageZoom();
//            $('.add2cart').shoping();
//        });
//        $('.replyForm').ajaxForm(function(){alert("提交成功1");});
//        $('.replyForm').submit(function(){
//            $(this).ajaxSubmit({
//
//            });
//        });
//        $(document).on("click",".add2cart",function(){
//            $('.add2cart').shoping();
//            var form=$('[name="cartForm"]');
//            var amount=$("#product-quantity").val();
//            var productSelected={};
//            productSelected.amount=amount;
//            productSelected.productSeriesId=form.find("[name='productSeriesId']").val();
//            var productPropertyValueIds=[];
//            form.find("select").each(function(){
//                var productPropertyValueId=$(this).val();
////                console.log(productPropertyValueId);
//                productPropertyValueIds.push(productPropertyValueId);
//            });
//            productSelected.productPropertyValueIds=productPropertyValueIds;
//            console.log(JSON.stringify(productSelected));
//            $.ajax({
//                url: path+"/index/cart",
//                contentType: "application/json",
//                data: JSON.stringify(productSelected),
//                method: "post",
//                success: function (data) {
////                    console.log("add to cart success");
//                    renderCart(data);
//                    $('.add2cart').shoping();
//                },
//                error:function(data){
//
//                }
//            })
//        });
    });
</script>
<%--<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>--%>
<!-- END PAGE LEVEL JAVASCRIPTS -->