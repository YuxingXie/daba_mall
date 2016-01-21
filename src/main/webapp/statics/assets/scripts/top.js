var logout=function () {
    $.ajax(path+"/user/logout")
        .done(function(){
            var $commonLogin=$("#commonLogin");
            $commonLogin.empty();
            var $new_li = $('<li><a href="'+path+'/user/register_phone">注册</a></li>' +
            '<li><a data-href="'+uri+'" data-target="_blank" class="login-need" href="javascript:void(0)">登录</a></li>');
            $new_li.appendTo($commonLogin);
            console.log("user logout");
            console.log($commonLogin.attr("id"));
            var appElement = document.querySelector('[ng-controller=mainController]');
            var $scope = angular.element(appElement).scope();
            $scope.$apply();
            //window.location.reload();
        }).fail()
}
var loginCheckBeforeHandler=function(handler){
    $.ajax({
        //dataType:"json",
        data:{},
        url: path + "/user/login_user"
    }).done(function (data) {
        if (!data.id) {
            if(typeof handler==='string'){
                //alert("handler is string")
                var str=encodeURIComponent(handler);
                window.location.href=path+"/user/to_login?to="+str;
                //window.open(path+"/user/to_login?to="+str);
                return false;
            }else{
                $("#myModal").modal().show();
                $(document).on("click", "#login", new loginAndCallBack(handler));
                return false;
            }

        }else{
            if(typeof handler==='string'){
                window.location.href=handler;
                return false;
            }else{
                handler();
                return true;
            }

        }
    }).fail(function(XMLHttpRequest, textStatus, errorThrown){
        console.log("error ");
        console.log(textStatus);
        console.log(XMLHttpRequest.status);
        console.log(XMLHttpRequest.readyState);

        return false;
    });
}
var toUrl=function(url,target){
    return function(){
        if(target&&target=="_blank"){
            var a = document.createElement("a");
            a.setAttribute("href", url);
            a.setAttribute("target", "_blank");
            document.body.appendChild(a);
            a.click();
        }
        else if(url&&url!==undefined&&url!=="") {
            window.location.href=url;
        }

    }
}
var loginAndCallBack=function (callBack) {
    return function(){
        var pwd=$.md5($("#password").val());
        $("#password").val(pwd);
        $.ajax({
            url:path+"/user/login",
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
            //获得mainController的作用域
            var appElement = document.querySelector('[ng-controller=mainController]');
            var $scope = angular.element(appElement).scope();
            $scope.cart=data.cart;
            $scope.$apply();

        }).fail(function(data){
            console.log(JSON.stringify(data));
        });
    }

}
$(document).ready(function () {
    $(document).on("click", "#login", new loginAndCallBack());
    $(document).on("click",".login-need",function(){
        var url=$(this).data("href");
        var target=$(this).data("target");

        //loginCheckBeforeHandler(new toUrl(url,target));
        loginCheckBeforeHandler(url);
    });
    $(document).on("click",".glyphicon-remove",function(){
        $(this).prev().val("").focus();
    });

    $(document).on("click", "#logout", logout);

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