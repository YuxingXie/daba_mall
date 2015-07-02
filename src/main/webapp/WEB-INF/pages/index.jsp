<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<script>
    path="${path}";
</script>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<!DOCTYPE html>
<html lang="en" >
<head>
</head>
<body >
<div class="page-slider margin-bottom-35">
    <!--LayerSlider begin-->
    <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">
        <!--LayerSlider layer-->
        <div class="ls-layer ls-layer2" style="slidedirection: right; transition2d: 110,111,112,113; ">
            <img src="${path}/${top3[0][1]}" class="ls-bg" alt="Slide background">
            <div class="ls-s-1 ls-title title" style=" top: 40%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                <strong class="title">${top3[0][2]}</strong>
                ${top3[0][3]}
                <em class="title">${top3[0][4]}</em>
            </div>

            <div class="ls-s-2 ls-price title" style=" top: 50%; left: 45%; slidedirection : fade; slideoutdirection : fade; durationout : 109750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                <b>${top3[0][5]}</b>
                <strong><span>￥</span>${top3[0][6]}</strong>
            </div>

            <a href="${path}/product/${top3[0][0]}" class="ls-s-1 ls-more mini-text" style=" top: 72%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; display: inline-block; white-space: nowrap;">
                添加到购物车
            </a>
        </div>
        <div class="ls-layer ls-layer5" style="slidedirection: right; transition2d: 110,111,112,113; ">
            <img src="${path}/${top3[1][1]}" class="ls-bg" alt="Slide background">

            <div class="ls-s-1 title" style=" top: 35%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                ${top3[1][2]}
            </div>

            <div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                <span>${top3[1][3]}</span>
                <a href="${path}/product/${top3[1][0]}">添加到购物车</a>
            </div>
        </div>
        <!--LayerSlider layer-->
        <div class="ls-layer ls-layer3" style="slidedirection: right; transition2d: 92,93,105; ">
            <img src="${path}/${top3[2][1]}" class="ls-bg" alt="Slide background">

            <div class="ls-s-1 ls-title" style=" top: 83px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                ${top3[2][2]}
                <strong>${top3[2][3]}</strong>
                ${top3[2][4]}
            </div>

            <div class="ls-s-1" style=" top: 333px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;">
                <a href="${path}/product/${top3[2][0]}" class="ls-buy">
                    添加到购物车
                </a>
                <div class="ls-price">
                    <span>${top3[2][5]}</span>
                    <strong><sup>￥</sup>${top3[2][6]}</strong>
                </div>
            </div>
        </div>

        <!--LayerSlider layer-->

    </div>
    <!--LayerSlider end-->
</div>
<!-- END SLIDER -->

<div class="main">
    <div class="container">
        <!-- BEGIN SALE PRODUCT & 新品上市 -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>新品上市</h2>
                <p>国家专利制作工艺,为您打造健康美味的生态食品</p>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>
                                    <%--新品--%>
                                    <%--<div class="sticker sticker-new"></div>--%>
                                    <c:if test="${prod.evaluateCount ge 1000}"><div class="sticker sticker-sale"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2></h2>
                <p>来自原产地的鲜活农产，感受鲜美跳动</p>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <%--<a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>--%>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>
                                        <%--新品--%>
                                        <%--<div class="sticker sticker-new"></div>--%>
                                    <c:if test="${prod.evaluateCount ge 1000}"><div class="sticker sticker-sale"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->

        <!-- BEGIN SALE PRODUCT & 热卖商品 -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>热卖商品</h2>
                <p>独一无二的制作工艺，让我们的产品成为您的首选</p>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>

                                    <c:if test="${prod.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>


        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2></h2>
                <p>原产地优质的水源孕育的灵动生物，让您每日品尝新鲜</p>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>

                                    <c:if test="${prod.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->

        <!-- BEGIN SALE PRODUCT & 特价优惠 -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>特价优惠</h2>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>

                                    <c:if test="${prod.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>


        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2></h2>
                <div class="bxslider-wrapper">
                    <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                        <c:forEach items="${hotSells}" var="prod">
                            <li>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="${path}/${prod.pictures[0]}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="${path}/${prod.pictures[0]}" class="btn btn-default fancybox-button">大图</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view" data-url="${path}/product_series/popover/${prod.id}">详情</a>
                                        </div>
                                    </div>
                                    <h3><a href="item.html">${prod.name}</a></h3>
                                    <div class="pi-price">￥${prod.commonPrice}</div>
                                    <a href="${path}/cart/${prod.id}" class="btn btn-default add2cart">添加到购物车</a>

                                    <c:if test="${prod.newProduct}"><div class="sticker sticker-new"></div></c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->

    </div>
</div>

<!-- BEGIN fast view of a product -->

<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-3">
                <div class="product-main-image">
                    <img src="#"class="img-responsive">
                </div>
                <div class="product-other-images">
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-9">
                <h1 style=" text-align:center;"></h1>
                <div class="price-availability-block clearfix">
                    <div class="price">
                    </div>
                    <div class="availability">
                        状态: <strong>货源充足</strong>
                    </div>
                </div>
                <div class="description" style=" direction:ltr;">
                    <p></p>
                </div>
                <div class="product-page-options">
                </div>
                <div class="product-page-cart">
                    <div class="product-quantity">
                        <input type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary add2cart" type="submit">添加到购物车</button>
                    <button class="btn btn-default" type="submit">更多商品</button>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
    <!--[if lt IE 9]>
    <script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<%--<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
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
<script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript">

    jQuery(document).ready(function(){
        $(".fancybox-fast-view").click(function(){
            $.ajax($(this).data("url")).done(function(data){
                $("#product-pop-up .product-main-image>img").attr("src","${path}/"+data.pictures[0]);
                $("#product-pop-up h1").text(data.name);
                $("#product-pop-up .price").html("<strong><span>￥</span>"+data.commonPrice+"</strong><em>￥<span>62.00</span></em>");
                $("#product-pop-up .description>p").html(data.description);
                $("#product-pop-up  .add2cart").unbind("click");
                var json =data.productProperties;
//                console.log("执行了ajax请求，属性数量是"+json.length);
                var product_page_options=$("#product-pop-up .product-page-options");
                product_page_options.empty();
                for(var i=0;i<json.length;i++){
                    var pull_left=$('<div class="pull-left"></div>');

                    pull_left.appendTo(product_page_options);
                    var control_label=$('<label class="control-label" style=" direction:ltr;">'+json[i]["propertyName"]+'&nbsp;:&nbsp;</label>');
                    control_label.appendTo(pull_left);
                    var select=$('<select class="form-control input-sm" name='+json[i]["id"]+'>');
                    select.appendTo(pull_left);
                    var propertyValues= json[i]["propertyValues"];
                    for(var j=0;j<propertyValues.length;j++){
                        var option=$("<option>"+propertyValues[j]+"</option>");
                        option.appendTo(select);
                    }
                }
                var pictures=data.pictures;
                var $images=$("#product-pop-up  .product-other-images");
                $images.empty();
                for(var i=0;i<pictures.length;i++){
//                    alert("第"+i+"个图："+pictures[i]);
                    var $img;
                    if(i==0)
                     $img =$('<a href="#" class="active"><img src="${path}/'+pictures[i]+'"/></a>');
                    else
                     $img =$('<a href="#"><img src="${path}/'+pictures[i]+'"/></a>');
                    $img.appendTo($images);
                }

                $("#product-pop-up  .add2cart").click(function(){
//                    console.log("id:"+data.id);
                });
//                App.init();
//                App.initBxSlider();
//                Index.initLayerSlider();
                App.initImageZoom();
//                App.initTouchspin();
            }).fail(function(){ console("something wrong!"); });
        });
        App.init();
        App.initBxSlider();
        Index.initLayerSlider();
//        App.initImageZoom();
        App.initTouchspin();
        /* center modal */
        function centerModals(){
            $('.modal').each(function(i){
//                console.log("centerModals....")
                var $clone = $(this).clone().css('display', 'block').appendTo('body');    var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
                top = top > 0 ? top : 0;
                $clone.remove();
                $(this).find('.modal-content').css("margin-top", top);
            });
        }
        $('.modal').on('show.bs.modal', centerModals);
        $(window).on('resize', centerModals);
    });
</script>
</html>
