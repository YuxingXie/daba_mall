<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
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
<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>

<script>
  $(document).ready(function(){
    $(".fancybox-fast-view").click(function(){
      var prod=$(this).data("prod");
      $.ajax(path+"/product_series/popover/"+prod).done(function(productSeries){
        $("#product-pop-up .product-main-image>img").attr("src",path+"/"+productSeries.pictures[0]);
        $("#product-pop-up h1").text(productSeries.name);
        //
        if(productSeries.currentPrice && productSeries.currentPrice.prevPrice){
          $("#product-pop-up .price").html("<strong><span>￥</span>"+productSeries.commonPrice+"</strong><em>$<span>productSeries.currentPrice.prevPrice.price</span></em>");
        }else{
          $("#product-pop-up .price").html("<strong><span>￥</span>"+productSeries.commonPrice+"</strong>");
        }
        var remainStr="";
        if(productSeries.productStore){
          var warningAmount=productSeries.productStore.warningAmount;
          var remain=productSeries.productStore.remain;
          if(remain===undefined){
            remainStr="无库存信息";
          }else if(remain){
            remainStr="剩余"+remain+"件";
          }else{
            remainStr="售罄";
          }
        }else{
          remainStr="无库存信息";
        }
        $("#product-pop-up .availability").html("库存 <strong><span>"+remainStr+"</span></strong>");
        $("#product-pop-up .description>p").html(productSeries.description);
        $("#product-pop-up  .add2cart").unbind("click");
        var productProperties =productSeries.productProperties;
        var product_page_options=$("#product-pop-up .product-page-options");
        product_page_options.empty();
        var productSeriesId=$('<input type="hidden" name="productSeriesId" value="'+prod+'"/>');
        productSeriesId.appendTo(product_page_options);
        if(productProperties.length&&productProperties.length>0){
          for(var i=0;i<productProperties.length;i++){
            var pull_left=$('<div class="pull-left"></div>');
            pull_left.appendTo(product_page_options);
            var control_label=$('<label class="control-label" style=" direction:ltr;">'+productProperties[i]["propertyName"]+'&nbsp;:&nbsp;</label>');
            control_label.appendTo(pull_left);
            var propertyValues= productProperties[i]["propertyValues"];
            if(propertyValues.length&&propertyValues.length>0){
              if(propertyValues.length==1){
                var select=$('<label class="control-label" style=" direction:ltr;">'+propertyValues[0].value+'</label><input type="hidden" name="productPropertyId" data-product-property-id="'+productProperties[i]["id"]+'" value="'+propertyValues[0].id+'"/>');
                select.appendTo(pull_left);
              }else{
                var select=$('<select class="form-control input-sm product-property" name="productPropertyId" data-product-property-id="'+productProperties[i]["id"]+'"></select>');
                select.appendTo(pull_left);
                for(var j=0;j<propertyValues.length;j++){
                  var option=$("<option value='"+propertyValues[j].id+"'>"+propertyValues[j].value+"</option>");
                  option.appendTo(select);
                }
              }

            }

          }
        }
        $(".product-other-images").empty();
        for(var j=0;j<productSeries.pictures.length;j++){
          if(j==0){
            $(".product-other-images").append("<a href='javascript:void(0)' class='active'><img src='"+path+"/"+productSeries.pictures[j]+"'/></a>");
          }else{
            $(".product-other-images").append("<a href='javascript:void(0)'><img src='"+path+"/"+productSeries.pictures[j]+"'/></a>");
          }
        }
        App.initImageZoom();
        $('.add2cart').shoping();
      }).fail(function(){ console.log("error！"); });
    });

    App.init();
    App.initBxSlider();
    Index.initLayerSlider();
    App.initImageZoom();
    App.initTouchspin();

  });
</script>
