var renderCart = function(data){
    var $cartList=$("#cart_list");
    $cartList.empty();
    if(!data.productSelectedList||data.productSelectedList.length==0){
        var $li_empty=$('<li>您的购物车中还没有商品</li>');
        $li_empty.appendTo($cartList);
        $('.J-shoping-num').text("0");
        return;
    }
    for(var i=0;i<data.productSelectedList.length;i++){
        var productSelected=data.productSelectedList[i];
        var $li=$("<li data-selected-index='"+i+"'></li>");
        $cartList.append($li);
        var $a=$('<a href="item.html"><img src="'+path+'/'+productSelected.productSeries.pictures[0]+'" width="37" height="34"/></a>');
        $a.appendTo($li);
        var $span=$('<span class="cart-content-count">x '+productSelected.amount+'</span>');
        $span.appendTo($li);
        var $strong=$("<strong></strong>");
        $strong.appendTo($li);
        var $strong_a=$('<a href="item.html">'+productSelected.productSeries.name+'</a>');
        $strong_a.appendTo($strong);
        for(var j=0;j<productSelected.productPropertySelects.length;j++){
            var productPropertySelect=productSelected.productPropertySelects[j];
            var $pps=$('<label> &nbsp;'+productPropertySelect.productProperty.propertyValues[productPropertySelect.selectIndex]+'</label>');
            $pps.appendTo($strong);
        }
        var $em=$('<em>￥'+productSelected.productSeries.commonPrice+'</em>');
        $em.appendTo($li);
        var $a_end=$('<a href="javascript:void(0);" class="del-goods"><i class="fa fa-times"></i></a>');
        $a_end.appendTo($li);
    }
    $('.J-shoping-num').text(data.productSelectedList.length);
}
$(document).ready(function () {
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
    $(document).on("click",".glyphicon-remove",function(){
        $(this).prev().val("").focus();
    });
    $(document).on("click", "#login", function () {
        var pwd=$.md5($("#password").val());
        $("#password").val(pwd);
        $.ajax({
            url: path+"/index/user/login",
            contentType: "application/json",
            data: JSON.stringify($('#loginForm').serializeObject()),
            method: "post",
            success: function (data) {
                if(data.loginStatus!=undefined){
                    $("#error-msg").text(data.loginStatus);
                    return;
                }

                $(".additional-nav>ul>li:eq(0)").remove();
                $(".additional-nav>ul>li:eq(0)").remove();
                var $new_li = $('<li>欢迎您,<a href="#">' + data.name + '</a>! </li><li><a href="#" id="logout">退出</a></li>');
                $new_li.insertBefore($(".additional-nav>ul>li:eq(0)"));
                $('#myModal').modal('hide');
            },
            error:function(data){
                console.log("there is an error!");
            }
        });
    })
    $(document).on("click", "#logout", function () {
        $.ajax(path+"/index/user/logout")
            .done(
            function () {
                $(".additional-nav>ul>li:eq(0)").remove();
                $(".additional-nav>ul>li:eq(0)").remove();
                var $new_li = $('<li><a href="login-page.html">注册</a></li><li><a href="#" data-toggle="modal" data-target="#myModal">登录</a></li>');
                $new_li.insertBefore($(".additional-nav>ul>li:eq(0)"));
            }
        ).fail()
    });

});
$.fn.serializeObject = function (excludeFields) {
    if(excludeFields!=undefined && !Array.isArray(excludeFields)) return false;
    var d = {};
    var t = $(this).serializeArray();
    $.each(t, function() {
        if($.inArray(this.name,excludeFields)<0){
            d[this.name] = this.value;
        }
    });
    return d;
};