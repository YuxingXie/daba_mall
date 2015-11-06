/**
 * 需要jquery.js,app.js
 */
var renderCart = function(cart){
    //console.log(cart);
    var $cartList=$("#cart_list");
    $cartList.empty();
    if(!cart.productSelectedList||cart.productSelectedList.length==0){
        var $li_empty=$('<li>您的购物车中还没有商品</li>');
        $li_empty.appendTo($cartList);
        $('.J-shoping-num').text("0");
        $("#total-price").text("总计：￥0");
        return;
    }
    var totalPrice=0;
    for(var i=0;i<cart.productSelectedList.length;i++){
        var productSelected=cart.productSelectedList[i];
        var $li=$("<li class='j-shoping-item' data-selected-index='"+i+"'></li>");
        $cartList.append($li);
        var $a=$('<a href='+path+'/product/'+productSelected.productSeriesId+'><img src="'+path+'/'+productSelected.productSeries.pictures[0]+'" width="37" height="34"/></a>');
        $a.appendTo($li);
        var $span=$('<span class="cart-content-count">x '+productSelected.amount+'</span>');
        $span.appendTo($li);
        var $strong=$("<strong></strong>");
        $strong.appendTo($li);
        var $strong_a=$('<a href='+path+'/product/'+productSelected.productSeriesId+'>'+productSelected.productSeries.name+'</a>');
        $strong_a.appendTo($strong);
        if(productSelected.productPropertyValueList){
            for(var j=0;j<productSelected.productPropertyValueList.length;j++){
                var productPropertyValue=productSelected.productPropertyValueList[j];
                var $pps=$('<label> &nbsp;'+productPropertyValue.value+'</label>');
                $pps.appendTo($strong);
            }
        }
        var $em=$('<em>￥'+productSelected.productSeries.commonPrice+'</em>');
        totalPrice+=Number(productSelected.amount*productSelected.productSeries.commonPrice);
        $em.appendTo($li);
        var $a_end=$('<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>');
        $a_end.appendTo($li);
    }
    $("#total-price").text("总计：￥"+totalPrice.toFixed(2));
    $('.J-shoping-num').text(cart.productSelectedList.length);
}
$(document).ready(function(){
    $(document).on("click","#product-pop-up .add2cart",function(){
        var form=$('[name="popForm"]');
        var amount=$("#product-quantity").val();
        var productSelected={};
        productSelected.amount=amount;
        productSelected.productSeriesId=form.find("[name='productSeriesId']").val();
        var productPropertyValueIds=[];
        form.find("select").each(function(){
            //productPropertySelect.productPropertyId=$(this).data("productPropertyId");
            var productPropertyValueId=$(this).val();
            productPropertyValueIds.push(productPropertyValueId);
        });
        productSelected.productPropertyValueIds=productPropertyValueIds;
        console.log(JSON.stringify(productSelected));
        $.ajax({
            url: path+"/index/cart",
            contentType: "application/json",
            data: JSON.stringify(productSelected),
            method: "post"
        }).done(function (cart) {
            $.fancybox.close();
            renderCart(cart);
            console.log("success")
        }).fail(function(){ console.log("error！"); });
        return false;
    });
    $(document).on("click",".del-goods",function(){
        var $li=$(this).parent();
        var selectedIndex =$li.data("selectedIndex");
        $.ajax({
            url: path+"/index/cart/remove",
            data: "selectedIndex="+selectedIndex,
            method: "post",
            success: function (data) {
                renderCart(data);
            },
            error:function(data){
                console.log("there is an error!")
            }
        });
    });
    $(".fancybox-fast-view").click(function(){
        var prod=$(this).data("prod");
        $.ajax(path+"/product_series/popover/"+prod).done(function(productSeries){
            $("#product-pop-up .product-main-image>img").attr("src",path+"/"+productSeries.pictures[0]);
            $("#product-pop-up h1").text(productSeries.name);
            $("#product-pop-up .price").html("<strong><span>￥</span>"+productSeries.commonPrice+"</strong><em>￥<span>62.00</span></em>");
            $("#product-pop-up .description>p").html(productSeries.description);
            $("#product-pop-up  .add2cart").unbind("click");
            var productProperties =productSeries.productProperties;
            var product_page_options=$("#product-pop-up .product-page-options");
            product_page_options.empty();
            var productSeriesId=$('<input type="hidden" name="productSeriesId" value="'+prod+'"/>');
            productSeriesId.appendTo(product_page_options);
            for(var i=0;i<productProperties.length;i++){
                var pull_left=$('<div class="pull-left"></div>');
                pull_left.appendTo(product_page_options);
                var control_label=$('<label class="control-label" style=" direction:ltr;">'+productProperties[i]["propertyName"]+'&nbsp;:&nbsp;</label>');
                control_label.appendTo(pull_left);
                var select=$('<select class="form-control input-sm product-property" name="productPropertyId" data-product-property-id="'+productProperties[i]["id"]+'">');
                select.appendTo(pull_left);
                var propertyValues= productProperties[i]["propertyValues"];
                for(var j=0;j<propertyValues.length;j++){
                    var option=$("<option value='"+propertyValues[j].id+"'>"+propertyValues[j].value+"</option>");
                    option.appendTo(select);
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
    $(document).on("click",".product-other-images a",function(){
        $(".product-main-image").find("img").attr("src",($(this).find("img").attr("src")));
        App.initImageZoom();
    })

});
$(function(){
    $('.add2cart').shoping(); //调用shoping函数
});