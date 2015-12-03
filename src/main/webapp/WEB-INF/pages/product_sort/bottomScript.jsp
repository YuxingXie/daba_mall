<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/back-to-top.js" type="text/javascript" ></script>
<script src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js" type="text/javascript"></script><!-- slider for products -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="${path}/statics/assets/plugins/jquery-ui.js" type="text/javascript" ></script>
<script src="${path}/statics/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<script src="${path}/statics/assets/plugins/bootstrap-tour-0.10.2/js/bootstrap-tour.js"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/multi-file-upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/onokumus-metisMenu-aaa0c7c/src/metisMenu.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery-bootpag-master/lib/jquery.bootpag.js"></script>

<script type="text/javascript">
    $('.demo4_top,.demo4_bottom').bootpag({
        total: ${_page.totalPages},
        page: ${page},
        maxVisible: 3,
        leaps: false,
        firstLastUse: true,
        first: '<span aria-hidden="true">&larr;</span>',
        last: '<span aria-hidden="true">&rarr;</span>'
//        wrapClass: 'pagination',
//        activeClass: 'active',
//        disabledClass: 'disabled',
//        nextClass: 'next',
//        prevClass: 'prev',
//        lastClass: 'last',
//        firstClass: 'first'
    }).on("page", function(event, num){
//        $(".content4").html("Page " + num); // or some ajax content loading...
        <c:url var="url" value="/index/product/search">
        <c:param name="keyWord" value="${keyWord}"/>
        <%--<c:param name="page" value="${page}"/>--%>
        </c:url>
        window.location.href="${url}&page="+num;
    }).find('.pagination');
    jQuery(document).ready(function() {
        var $tour_step1=$(".tour-step1");
        if($tour_step1.length){
            var tour = new Tour({
                storage:false,
                debug:true,
                backdrop:true,
                template: "<div class='popover tour'><div class='arrow'></div>" +
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
                ]});
            tour.init();
            tour.start();
        }

        App.init();
        App.initBxSlider();
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform();
        App.initTouchspin();
        $(function() {

            $('#menu').metisMenu();

            $('#menu2').metisMenu({
                toggle: false
            });

            $('#menu3').metisMenu({
                doubleTapToGo: true
            });

            $('#menu4').metisMenu();

        });
        $(document).on("click",".product-image",function(){
            var $productMainImage=$(".product-main-image").find("img");
            var imgSrc=$(this).attr("src");
            $productMainImage.attr("src",imgSrc);
            $productMainImage.attr("data-BigImgSrc",imgSrc);
            App.initImageZoom();
            $('.add2cart').shoping();
        });
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