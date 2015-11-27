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
        var $em=$('<em>￥'+((productSelected.productSeries.commonPrice*productSelected.amount).toFixed(2))+'</em>');
        totalPrice+=Number(productSelected.amount*productSelected.productSeries.commonPrice);
        $em.appendTo($li);
        var $a_end=$('<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>');
        $a_end.appendTo($li);
    }
    $("#total-price").text("总计：￥"+totalPrice.toFixed(2));
    $('.J-shoping-num').text(cart.productSelectedList.length);
}
$(document).ready(function(){

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


});
$(function(){
    $('.add2cart').shoping(); //调用shoping函数
});