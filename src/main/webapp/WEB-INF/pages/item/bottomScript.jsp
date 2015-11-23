<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
<script src="${path}/statics/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>





<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initBxSlider();
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform();
        App.initTouchspin();
        $(document).on("click",".product-image",function(){
            var $productMainImage=$(".product-main-image").find("img");
            var imgSrc=$(this).attr("src");
            $productMainImage.attr("src",imgSrc);
            $productMainImage.attr("data-BigImgSrc",imgSrc);
            App.initImageZoom();
            $('.add2cart').shoping();
        });
        $(document).on("click",".add2cart",function(){
//          var propertyId=$(".product-property").attr("propertyId");
            var form=$('[name="cartForm"]');
            var remain=$("#product-quantity").val();
            console.log("remain "+remain);
            var data={};
            data.remain=remain;
            data.productSeriesId=form.find("[name='productSeriesId']").val();
//            var productPropertySelects=[];
//            form.find("select").each(function(){
//                var productPropertySelect={};
//                productPropertySelect.productPropertyId=$(this).data("productPropertyId");
//                productPropertySelect.selectIndex=$(this).val();
//                productPropertySelects.push(productPropertySelect);
//            });
//            data.productPropertySelects=productPropertySelects;
            var productPropertyValueIds=[];
            form.find("select").each(function(){
                var productPropertyValueId=$(this).val();
                console.log(productPropertyValueId);
                productPropertyValueIds.push(productPropertyValueId);
            });
            data.productPropertyValueIds=productPropertyValueIds;
            console.log(JSON.stringify(data));
            $.ajax({
                url: path+"/index/cart",
                contentType: "application/json",
                data: JSON.stringify(data),
                method: "post",
                success: function (data) {
                    console.log("add to cart success");
//              $.fancybox.close();
                    renderCart(data);
                },
                error:function(data){

                }
            })
        });
    });
</script>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->