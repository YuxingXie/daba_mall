/**
 * 需要jquery.js,app.js
 */
$(document).ready(function(){
    $(document).on("click","#product-pop-up .add2cart",function(){
        var propertyId=$(".product-property").attr("propertyId");
        var form=$('[name="popForm"]');
        var amount=$("#product-quantity").val();
        var data={};
        data.amount=amount;
        data.productSeriesId=form.find("[name='productSeriesId']").val();
        var productPropertySelects=[];
        form.find("select").each(function(){
            var productPropertySelect={};
            productPropertySelect.productPropertyId=$(this).data("productPropertyId");
            productPropertySelect.selectIndex=$(this).val();
            productPropertySelects.push(productPropertySelect);
        });
        data.productPropertySelects=productPropertySelects;
        //console.log(JSON.stringify(data));

        $.ajax({

            url: path+"/index/cart",
            contentType: "application/json",
            data: JSON.stringify(data),
            method: "post",
            success: function (data) {
                $.fancybox.close();
                renderCart(data);
            },
            error:function(data){

            }
        })
    });
    $(".fancybox-fast-view").click(function(){
        var prod=$(this).data("prod");
        $.ajax(path+"/product_series/popover/"+prod).done(function(data){
            $("#product-pop-up .product-main-image>img").attr("src",path+"/"+data.pictures[0]);
            $("#product-pop-up h1").text(data.name);
            $("#product-pop-up .price").html("<strong><span>￥</span>"+data.commonPrice+"</strong><em>￥<span>62.00</span></em>");
            $("#product-pop-up .description>p").html(data.description);
            $("#product-pop-up  .add2cart").unbind("click");
            var json =data.productProperties;
            var product_page_options=$("#product-pop-up .product-page-options");
            product_page_options.empty();
            var productSeriesId=$('<input type="hidden" name="productSeriesId" value="'+prod+'"/>');
            productSeriesId.appendTo(product_page_options);
            for(var i=0;i<json.length;i++){
                var pull_left=$('<div class="pull-left"></div>');
                pull_left.appendTo(product_page_options);
                var control_label=$('<label class="control-label" style=" direction:ltr;">'+json[i]["propertyName"]+'&nbsp;:&nbsp;</label>');
                control_label.appendTo(pull_left);
                var select=$('<select class="form-control input-sm product-property" name="productPropertyId" data-product-property-id="'+json[i]["id"]+'">');
                select.appendTo(pull_left);
                var propertyValues= json[i]["propertyValues"];
                for(var j=0;j<propertyValues.length;j++){
                    var option=$("<option value='"+j+"'>"+propertyValues[j]+"</option>");
                    option.appendTo(select);
                }
            }
            $(".product-other-images").empty();
            for(var j=0;j<data.pictures.length;j++){
                if(j==0){
                    $(".product-other-images").append("<a href='javascript:void(0)' class='active'><img src='"+path+"/"+data.pictures[j]+"'/></a>");
                }else{
                    $(".product-other-images").append("<a href='javascript:void(0)'><img src='"+path+"/"+data.pictures[j]+"'/></a>");
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