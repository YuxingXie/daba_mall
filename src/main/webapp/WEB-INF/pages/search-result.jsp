<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<jsp:useBean id="form" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<jsp:useBean id="phoneForm" class="com.dabast.mall.form.UserLoginForm" scope="request"></jsp:useBean>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<head>
    <meta charset="utf-8">
    <title>搜索结果页</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-">
    <!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
          type="text/css">
    <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <%--<link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
    <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <!-- for slider-range -->
    <link href="${path}/statics/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
    <link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${path}/statics/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${path}/statics/assets/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">搜索结果页</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <h1>搜索结果页</h1>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <form action="${path}/index/product/search" method="post">
                            <div class="input-group">
                                <input type="text" placeholder="重新搜索" class="form-control" name="keyWord"
                                       value="${keyWord}">
                      <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">搜索</button>
                      </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row list-view-sorting clearfix">
                <div class="col-md-10 col-sm-10" style=" width:100%;">
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后恢复默认排序">综合排序&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后按照价格从高到低排序">价格排序&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后按照销量从多到少排序">销量排序&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后按照评论从多到少排序">评论排序&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">热卖商品&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>
                    <div class="pull-left">
                        <label class="control-label"><a href="#" title="点击后按照人气从高到低排序">新品上市&nbsp;&nbsp;<i
                                class="fa fa-chevron-down"></i></a></label>
                    </div>

                </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
                <!-- PRODUCT ITEM START -->
                <c:choose>
                    <c:when test="${empty _page.content}">
                        对不起，没有找到合适的记录!
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="productSeries" items="${_page.content}">
                            <div class="col-md-12 col-sm-0 col-xs-12">
                                <div class="product-item">
                                    <img src="${path}/${productSeries.pictures[0]}" class="pull-left resule-thumb"
                                         alt="${productSeries.name}">

                                    <div class="introduce">
                                        <h3><a href="#" class="high-lighter">${productSeries.name}</a></h3>

                                        <p class="ware-desc pull-left high-lighter">${productSeries.description}</p>
                                    </div>
                                    <div class="price-avail pull-right">
                                        <div class="form-groupx">
                                            <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true"
                                                 data-rateit-readonly="true"></div>
                                        </div>
                                        <p class="discuss">评论数&nbsp;:&nbsp;<a>${productSeries.evaluateCount}</a></p>

                                        <p class="price">￥${productSeries.commonPrice}</p>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view"
                                           data-prod="${productSeries.id}">添加到购物车</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>



                <!-- PRODUCT ITEM END -->
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row" style=" padding-bottom:20px;">
                <div class="col-md-12 col-sm-12">
                    <ul class="pagination pull-right">
                        <c:set var="maxShowPage" value="3"/>
                        <c:set var="totalPages" value="${_page.totalPages}"/>
                        <li><a href="javascript:void(0)" class="prev-pages">&laquo;</a></li>
                        <c:forEach begin="0" end="${totalPages-1}" varStatus="varStatus">
                            <c:choose>
                                <c:when test="${varStatus.index+1 eq page}">
                                    <li class="now-page" page-index="${1+varStatus.index}">
                                        <span >${varStatus.index+1}</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="li-form" page-index="${1+varStatus.index}" <c:if test="${1+varStatus.index >maxShowPage}">style="display: none" </c:if> >
                                        <a href="javascript:void(0) ">${1+varStatus.index}</a>
                                        <form action="${path}/index/product/search" method="post">
                                            <input type="hidden" name="keyWord" value="${keyWord}">
                                            <input type="hidden" name="page" value="${1+varStatus.index}">
                                        </form>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li><a href="javascript:void(0)" class="next-pages">&raquo;</a></li>
                    </ul>
                </div>
            </div>
            <!-- END PAGINATOR -->
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN SIDEBAR -->
        <div class="sidebar col-md-3 col-sm-5">
            <div class="sidebar-products clearfix">
                <h2>为您推荐</h2>

                <div class="item">
                    <a href="item.html"><img src="${path}/statics/assets/temp/products/k1.jpg" alt="腊肉"></a>

                    <h3><a href="item.html">腊肉的防腐能力强，能延长保存时间</a></h3>

                    <div class="price">$31.00</div>
                </div>

            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
</div>
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <form name="popForm">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                    <div class="product-main-image">
                        <img src="${path}/statics/assets/temp/products/model7.jpg" alt="Cool green dress with red bell"
                             class="img-responsive">
                    </div>
                    <div class="product-other-images">
                        <a href="#" class="active"><img alt="Berry Lace Dress"
                                                        src="${path}/statics/assets/temp/products/model3.jpg"></a>
                        <a href="#"><img alt="Berry Lace Dress"
                                         src="${path}/statics/assets/temp/products/model4.jpg"></a>
                        <a href="#"><img alt="Berry Lace Dress"
                                         src="${path}/statics/assets/temp/products/model5.jpg"></a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                    <h1 style=" text-align:center;">帝王蟹</h1>

                    <div class="price-availability-block clearfix">
                        <div class="price">
                            <strong><span>$</span>47.00</strong>
                            <em>$<span>62.00</span></em>
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
                            <input id="product-quantity" type="text" value="1" name="product-quantity"
                                   class="form-control input-sm">
                        </div>
                        <button class="btn btn-primary pop" type="button">添加到购物车</button>
                        <button class="btn btn-default" type="submit">更多商品</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
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
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>
<script>
    highLighter = function () {
        $(".high-lighter").each(function () {
            var oldText = $(this).text();
            var newText = oldText.replace('${keyWord}', '<span style="color:red">${keyWord}</span>');
            $(this).html(newText);
        });
    }
    $(document).ready(function () {
        App.init();
        highLighter();
        $(".li-form").on("click",function(){$(this).find("form").submit();});
        $(".prev-pages").on("click",function(){
            var nowPage=Number($(".now-page").find("span").text());
            alert("当前页是"+nowPage);
            var minShowPage=nowPage;
            if(nowPage===1) {alert("当前第一页，不能退了");return;}
            var canBack=true;
            $(".li-form").each(function(){
                var formGoPage= Number($(this).find("a").text());
                if(formGoPage<=minShowPage) minShowPage=formGoPage;
                if(minShowPage===1){alert("最小页是第一页，不能退了");canBack=false; return false;}
            });
            if(!canBack) return;
            $(".now-page").find("span").text(nowPage-1);
            $(".li-form").each(function(){
                var oldFormNumber= Number($(this).find("a").text());
                if(oldFormNumber-1===nowPage){
                    $(this).find("a").html("<span>"+oldFormNumber-1+"/<span>");
                }else
                $(this).find("a").text(oldFormNumber-1);
                $(this).find("[name='page']").text(oldFormNumber-1);
            });
        });




        $(".next-pages").on("click",function(){
            var nowPage=Number($(".now-page").find("span").text());
            var maxShowPage=nowPage;
            if(nowPage===${totalPages}) {alert("当前最大页，不能进了");return;}
            var canForward=true;
            $(".li-form").each(function(){
                var formGoPage= Number($(this).find("a").text());
                if(formGoPage>=maxShowPage) maxShowPage=formGoPage;
                if(maxShowPage===${totalPages}){alert("最大页是第${totalPages}页，不能进了");canForward=false; return false;}
            });
            if(!canForward) return;
            $(".now-page").find("span").text(nowPage+1);
            $(".li-form").each(function(){
                var oldFormNumber= Number($(this).find("a").text());
                if(oldFormNumber+1===nowPage){
                    alert("页"+oldFormNumber+"变为页"+(oldFormNumber+1));
                    $(this).find("a").html("<span>"+(oldFormNumber+1)+"/<span>");
                }else{
                    $(this).find("a").text(oldFormNumber+1);
                }
                $(this).find("[name='page']").text(oldFormNumber+1);
            });
        });
    });
</script>
</body>
