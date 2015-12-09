<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js" type="text/javascript"></script><!-- slider for products -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<%--<script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.loadManual.js" type="text/javascript"></script>--%>
<script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap-star-rating-master/js/star-rating.min.js" type="text/javascript"></script>
<script src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->

<script src="${path}/statics/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="${path}/statics/assets/plugins/bootstrap-tour-0.10.2/js/bootstrap-tour.js"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/onokumus-metisMenu-aaa0c7c/src/metisMenu.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap-paginator-master/build/bootstrap-paginator.min.js"></script>
<script src="${path}/statics/assets/plugins/jquery-ui.js" type="text/javascript" ></script>

<script type="text/javascript">
    angular.module("productSeriesApp",[])
    .controller('productSeriesCtrl', ['$scope', '$http', function ($scope, $http) {
    <c:forEach var="productEvaluate" items="${_page.content}" varStatus="varStatus">
        $scope.toReply${varStatus.index}=function(){
            loginCheckBeforeHandler(function(){
                var $form=$("#reply${varStatus.index}Form");
                var url=$form.attr("action");
                var reply=JSON.stringify($scope.reply${varStatus.index});
                $.ajax({
                    url: url,
                    contentType: "application/json",
                    data: reply,
                    method: "post"
                }).done(function (data) {
                    $scope.$apply(function () {
                        if(data && data.length){
                            $scope.evaluate${productEvaluate.id}ReplyCount=data.length;
                        }else{
                            $scope.evaluate${productEvaluate.id}ReplyCount=0;
                        }
                        <%--console.log( $scope.evaluate${productEvaluate.id}ReplyCount);--%>
                        $scope.evaluate${productEvaluate.id}Replies=data;
                        $scope.reply${varStatus.index}.content="";
//                        $form[0].reset();
                    })
                }).fail(function(){ console.log("error！"); });
                <%--$scope.replies${varStatus.index}();--%>
            });
        }
        $scope.toPraise${varStatus.index}=function(){
            loginCheckBeforeHandler(function(){
                var url="${path}/product_series/evaluate/praise/${productEvaluate.id}";
                $.ajax({
                    url: url,
                    method: "get"
                }).done(function (data) {
                    $scope.$apply(function () {
                        if(data && data.length){
                            $scope.evaluate${productEvaluate.id}PraiseCount=data.length;
                        }else{
                            $scope.evaluate${productEvaluate.id}PraiseCount=0;
                        }
                        $scope.evaluate${productEvaluate.id}Praises=data;
                      <%--console.log($scope.evaluate${productEvaluate.id}PraiseCount);--%>
                    })
                }).fail(function(){ console.log("error！"); });
                <%--$scope.replies${varStatus.index}();--%>
            });
        }
    </c:forEach>

        $http.get('${path}//product_series/data/${id}?orderId=${requestScope.orderId}').success(function (data) {
            $scope.data = data;
        });
    }]);
    angular.bootstrap(document.getElementById("page-main"), ['productSeriesApp']);
    <c:if test="${not empty _page and _page.totalPages gt 0}">
        var options = {
            currentPage:${page},
            totalPages: ${_page.totalPages},
            itemContainerClass: function (type, page, current) {
                return (page === current) ? "active" : "everyPage";
            },pageUrl: function(type, page, current){
                return "${path}/product_series/${productSeries.id}?page="+page;
            },itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "<i class='fa fa-fast-backward'></i>";
                    case "prev":
                        return "<i class='fa fa-backward'></i>";
                    case "next":
                        return "<i class='fa fa-forward'></i>";
                    case "last":
                        return "<i class='fa fa-fast-forward'></i>";
                    case "page":
                        return page;
                }
            }
        };
        $('#infoPage').bootstrapPaginator(options);
    </c:if>
    jQuery(document).ready(function() {
//        $(".rating-kv").rating();
        var $tour_step1=$(".tour-step1");
        if($tour_step1.length){
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

        App.init();
        App.initBxSlider();
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform();
        App.initTouchspin();
        $(function() {$('#menu').metisMenu();});
        $(document).on("click",".product-image",function(){
            var $productMainImage=$(".product-main-image").find("img");
            var imgSrc=$(this).attr("src");
            $productMainImage.attr("src",imgSrc);
            $productMainImage.attr("data-BigImgSrc",imgSrc);
            App.initImageZoom();
            $('.add2cart').shoping();
        });
//        $('.replyForm').ajaxForm(function(){alert("提交成功1");});
//        $('.replyForm').submit(function(){
//            $(this).ajaxSubmit({
//
//            });
//        });
        $(document).on("click",".add2cart",function(){
            $('.add2cart').shoping();
            var form=$('[name="cartForm"]');
            var amount=$("#product-quantity").val();
            var productSelected={};
            productSelected.amount=amount;
            productSelected.productSeriesId=form.find("[name='productSeriesId']").val();
            var productPropertyValueIds=[];
            form.find("select").each(function(){
                var productPropertyValueId=$(this).val();
//                console.log(productPropertyValueId);
                productPropertyValueIds.push(productPropertyValueId);
            });
            productSelected.productPropertyValueIds=productPropertyValueIds;
            console.log(JSON.stringify(productSelected));
            $.ajax({
                url: path+"/index/cart",
                contentType: "application/json",
                data: JSON.stringify(productSelected),
                method: "post",
                success: function (data) {
//                    console.log("add to cart success");
                    renderCart(data);
                    $('.add2cart').shoping();
                },
                error:function(data){

                }
            })
        });
    });
</script>
<%--<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>--%>
<!-- END PAGE LEVEL JAVASCRIPTS -->