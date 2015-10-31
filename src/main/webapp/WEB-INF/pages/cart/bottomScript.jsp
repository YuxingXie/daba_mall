<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path"
                                                                                             value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script>
<!-- pop up -->
<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
<!-- slider for products -->
<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>
<!-- product zoom -->
<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<!-- Quantity -->
<!-- BEGIN LayerSlider -->
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"
        type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js"
        type="text/javascript"></script>

<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<script type="text/javascript">
    var nonHtml5Post =function(){
        var cart={};
        var productSelectedList=[];
        $('[name="productSelected"]').each(function(){

            var productSelected={};
            var productSeries={};
            var productSeriesId= $(this).data("productSeriesId");
            productSelected.productSeriesId=productSeriesId;
            productSelected.amount=$(this).find("[name='amount']").val();
            var commonPrice=$(this).data("commonPrice");
            var pictures0=$(this).find("[name='pictures0']").data("pictures0");
            var pictures=[pictures0];
            productSeries.pictures=pictures;
            productSeries.id=productSeriesId;
            productSeries.commonPrice=commonPrice;
            productSelected.productSeries=productSeries;
//            productSelected.commonPrice=commonPrice;
            var productPropertyValueList=[];
            var $productPropertyValue=$(this).find('[name="productPropertyValue"]');

            $productPropertyValue.each(function(){
                var productPropertyValue={};
                productPropertyValue.id=$(this).data("productPropertyValueId");
                productPropertyValue.value=$(this).data("productPropertyValueValue");
                productPropertyValue.productPropertyId==$(this).data("productPropertyValueProductPropertyId");;
                productPropertyValueList.push(productPropertyValue);
            });
            console.log($productPropertyValue.length);
            if($productPropertyValue &&$productPropertyValue.length>0){
                productSelected.productPropertyValueList=productPropertyValueList;
            }
            productSelectedList.push(productSelected);
        });
        cart.productSelectedList=productSelectedList;
//        cart.productSelectedList=[];
//        cart.userId="232323ddasdsad2ada";


        console.log(JSON.stringify(cart));
//        var url=$("#form").attr("action");
        $("#form").find("[name='cart']").val(JSON.stringify(cart));
        $("#form").submit();
        return;
//        $.ajax({
//            url: url,
//            contentType: "application/json",
//            data: JSON.stringify(cart),
//            method: "post"
//        }).done(function () {
//            window.location.href=path+"/to_bill";
////            alert(url);
//        }).fail(function(){ console.log("error！"); });
    }
    $(document).ready(function () {
        $("#toBill").click(function () {
            var supportHtml5=false;
            if (window.applicationCache) {
                supportHtml5=true;
            } else {
                supportHtml5=false;
            }
            var isLogin = false;
            $.ajax({
                url: path + "/index/login_user"

            }).done(function (data) {
                if (!data.id) {
                    console.log("user not log in");
                    $("#myModal").modal().show();
                    return false;
                }else{
                   nonHtml5Post();
                    return false;
                }
            }).fail(function(){
                console.log("error ");
                return false;
            });

        });
    });

</script>