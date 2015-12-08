var loginCheckBeforeHandler=function(handler){
    $.ajax({
        //dataType:"json",
        data:{},
        url: path + "/user/login_user"
    }).done(function (data) {
        if (!data.id) {
            $("#myModal").modal().show();
            $(document).on("click", "#login", new loginAndCallBack(handler));
            return false;
        }else{
            handler();
            return true;
        }
    }).fail(function(XMLHttpRequest, textStatus, errorThrown){
        console.log("error ");
        console.log(textStatus);
        console.log(XMLHttpRequest.status);
        console.log(XMLHttpRequest.readyState);

        return false;
    });
}
    var toUrl=function(url){
        return function(){
            if(url&&url!==undefined&&url!=="") window.location.href=url;
        }
    }
    var loginAndCallBack=function (callBack) {
        return function(){
            var pwd=$.md5($("#password").val());
            $("#password").val(pwd);
            //var $cartList=$("#cart_list");
            //if($cartList.find(".j-shoping-item")&&$cartList.find(".j-shoping-item").length>0){
            //    alert("购物车发现商品:"+$cartList.find(".j-shoping-item").length);
            //    $('#mergeCart').val(true);
            //}
            $.ajax({
                url: path+"/user/login",
                contentType: "application/json",
                data: JSON.stringify($('#loginForm').serializeObject()),
                method: "post"
            }).done(function (data) {
                if(data.loginStatus!=undefined){
                    $("#error-msg").text(data.loginStatus);
                    return;
                }

                $(".additional-nav>ul>li:eq(0)").remove();
                $(".additional-nav>ul>li:eq(0)").remove();
                var $new_li = $('<li>欢迎您,<a href="#">' + data.name + '</a>! </li><li><a href="#" id="logout">退出</a></li>');
                //$new_li.insertBefore($(".additional-nav>ul>li:eq(0)"));
                $new_li.appendTo($(".additional-nav>ul"));
                $('#myModal').modal('hide');
                if(callBack!==undefined){
                    console.log("login,now invoke callback");
                    callBack();
                }
                renderCart(data.cart);

            }).fail(function(data){
                console.log("there is an error!");
            });
        }

    }
$(document).ready(function () {
    $(document).on("click", "#login", new loginAndCallBack());
    $(".login-need").click(function(){
        var url=$(this).data("href");
        loginCheckBeforeHandler(new toUrl(url));
    });
    $(document).on("click",".glyphicon-remove",function(){
        $(this).prev().val("").focus();
    });

    $(document).on("click", "#logout", function () {
        $.ajax(path+"/user/logout")
        .done(function(){
            //$(".additional-nav>ul>li:eq(0)").remove();
            //$(".additional-nav>ul>li:eq(0)").remove();
            $(".additional-nav>ul").empty();
            var $new_li = $('<li><a href="'+path+'/user/register">注册</a></li><li><a href="#" data-toggle="modal" data-target="#myModal">登录</a></li>');
            $new_li.appendTo($(".additional-nav>ul"));
        }).fail()
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