<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<
<head>
  <meta charset="utf-8">
  <title>物品详情页</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">
  <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="${path}/statics/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="${path}/statics/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href=${path}/statics/"assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"><!-- for slider-range -->
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


    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">物品详情</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <c:forEach var="productCategory" items="${f:getProductCategories()}">
                <c:set var="productSeriesCategoryId" value="${f:getProductCategoryIdByProductSeriesId(productSeries.id)}"/>
                <li class="list-group-item clearfix dropdown
                <c:if test="${productSeriesCategoryId eq productCategory.id}"> active</c:if>
                        "><a href="javascript:void(0);" class="collapsed">
                    <i class="fa fa-angle-right"></i>
                    ${productCategory.categoryName}
                    <i class="fa fa-angle-down"></i>
                  </a>
                  <ul class="dropdown-menu" style="display:block;">
                    <c:forEach var="subCategory" items="${f:getProductSubCategoriesByCategoryId(productCategory.id)}">
                      <li <c:if test="${productSeries.subCategoryId eq subCategory.id}">class="list-group-item dropdown clearfix active"</c:if>>
                        <a href="product-list.html"><i class="fa fa-circle"></i>${subCategory.subCategoryName}</a>
                      </li>
                    </c:forEach>
                  </ul>
                </li>
              </c:forEach>
            </ul>
            <div class="sidebar-products clearfix">
              <h2>热销商品</h2>
              <c:forEach var="productSeries" items="${hotSells}">
                <div class="item">
                  <a href="${path}/product/${productSeries.id}"><img src="${path}/${productSeries.pictures[0]}" alt="腊肉"></a>
                  <h3><a href="${path}/product/${productSeries.id}">${productSeries.description}</a></h3>
                  <div class="price">$${productSeries.commonPrice}</div>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img src="${path}/${productSeries.pictures[0]}" alt="${productSeries.name}" class="img-responsive" data-BigImgSrc="${path}/${productSeries.pictures[0]}">
                  </div>
                  <div class="product-other-images">
                    <c:forEach var="pic" items="${productSeries.pictures}" varStatus="varStatus">
                      <a href="#" <c:if test="${varStatus.index eq 0}">class="active"</c:if>><img class="product-image" src="${path}/${pic}"></a>
                    </c:forEach>
                  </div>
                </div>

                <div class="col-md-6 col-sm-6">
                  <form name="cartForm">
                    <input type="hidden" name="productSeriesId" value="${productSeries.id}">
                    <h1>${productSeries.name}</h1>
                    <div class="price-availability-block clearfix">
                      <div class="price">
                        <strong><span>￥</span>${productSeries.commonPrice}</strong>
                        <%--<em>￥<span>62.00</span></em>--%>
                      </div>
                      <div class="availability">
                        状态:<strong>货源充足</strong>
                      </div>
                    </div>
                    <div class="description">
                      <p>${productSeries.description}</p>
                    </div>
                    <div class="product-page-options">
                      <c:forEach var="productProperty" items="${f:getProductPropertiesById(productSeries.id)}">
                        <div class="pull-left">
                          <label class="control-label" style=" direction:ltr;">${productProperty.propertyName}&nbsp;:&nbsp;</label>
                          <select class="form-control input-sm" name="productPropertyId" data-product-property-id="${productProperty.id}">
                            <c:forEach var="propertyValue" items="${productProperty.propertyValues}" varStatus="varStatus">
                              <option value="${varStatus.index}">${propertyValue}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </c:forEach>
                    </div>
                    <div class="product-page-cart">
                      <div class="product-quantity">
                        <input type="text" value="1" readonly class="form-control input-sm" id="product-quantity">
                      </div>
                      <button class="btn btn-primary add2cart" type="submit">添加到购物车</button>
                    </div>
                    <div class="review">
                      <input type="range" value="4" step="0.25" id="backing4">
                      <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                      </div>
                      <a href="#"><c:choose><c:when test="${empty productSeries.evaluateCount}">0</c:when><c:otherwise>${ productSeries.evaluateCount}</c:otherwise></c:choose>条评论</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">发表评论</a>
                    </div>
                    <ul class="social-icons">
                      <div class="bdsharebuttonbox">
                        <a href="#" class="bds_more" data-cmd="more"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                        <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                      </div>
                    </ul>
                  </form>
                </div>
                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Description" data-toggle="tab">商品介绍</a></li>
                    <li><a href="#Information" data-toggle="tab">规格参数</a></li>
                    <li><a href="#Reviews" data-toggle="tab">商品评论</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                      <p>由于不同地区自然条件和饮食习惯的不同，腌腊鱼的生产工艺也有所差异，其风味也就不同</p>
                      <div class="imgdisp">
                      <%--<img src="images/1.jpg">--%>
                      <%--<img src="images/2.jpg">--%>
                      <%--<img src="images/3.jpg">--%>
                      <%--<img src="images/4.jpg">--%>
                      <%--<img src="images/5.jpg">--%>
                      <%--<img src="images/6.jpg">--%>
                      <%--<img src="images/7.jpg">--%>
                      <%--<img src="images/8.jpg">--%>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="Information">
                      <table class="datasheet">
                        <tr>
                          <th colspan="2">规格参数</th>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">进口/国产：</td>
                          <td>国产</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">配送范围：</td>
                          <td>湖南/重庆/江西/湖北/广西/其它地区</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">净重(g)：</td>
                          <td>300</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">包装：</td>
                          <td>袋装</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">产品标准号：</td>
                          <td>DB43/344-2015</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">储藏方法：</td>
                          <td>放入冰箱冷冻</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">商品添加剂：</td>
                          <td>无</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">配料表：</td>
                          <td>鱼、调料</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">食品保质期：</td>
                          <td>180天</td>
                        </tr>
                      </table>
                    </div>
                    <div class="tab-pane fade" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>马云</strong>
                          <em>2015/06/20 - 07:37</em>
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>商品评价是指生产厂家、商家或者消费者根据具体商品的性能、规格、材质、使用寿命、外观等商品的内在价值设定一个可量化或定性的评价体系，由消费者对商品使用价值进行评价的过程。</p>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">

        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>




    <!-- BEGIN fast view of a product -->
<%--<div id="product-pop-up" style="display: none; width: 700px;">--%>
            <%--<div class="product-page product-pop-up">--%>
              <%--<div class="row">--%>
                <%--<div class="col-md-6 col-sm-6 col-xs-3">--%>
                  <%--<div class="product-main-image">--%>
                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" class="img-responsive">--%>
                  <%--</div>--%>
                  <%--<div class="product-other-images">--%>
                    <%--<a href="#" class="active"><img src="${path}/statics/assets/temp/products/model3.jpg"></a>--%>
                    <%--<a href="#"><img  src="${path}/statics/assets/temp/products/model4.jpg"></a>--%>
                    <%--<a href="#"><img src="${path}/statics/assets/temp/products/model5.jpg"></a>--%>
                  <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-6 col-sm-6 col-xs-9">--%>
                  <%--<h1 style=" text-align:center;">烟熏腊鱼</h1>--%>
                  <%--<div class="price-availability-block clearfix">--%>
                    <%--<div class="price">--%>
                      <%--<strong><span>￥</span>47.00</strong>--%>
                      <%--<em>￥<span>62.00</span></em>--%>
                    <%--</div>--%>
                    <%--<div class="availability">--%>
                      <%--状态: <strong>货源充足</strong>--%>
                    <%--</div>--%>
                  <%--</div>--%>
                  <%--<div class="description" style=" direction:ltr;">--%>
                    <%--<p>腊鱼是将鱼洗净腌制晒干后的称呼，鲫鱼、草鱼、鲤鱼都可以制作腊鱼。腌制腊鱼是我国传统水产加工食品，其风味独特，耐贮藏，在我国南方的饮食文化中有着重要地位。在腌腊鱼的加工过程中，由于微生物和原料鱼中酶类的作用</p>--%>
                  <%--</div>--%>
                  <%--<div class="product-page-options">--%>
                    <%--<div class="pull-left">--%>
                    <%--<label class="control-label" style=" direction:ltr;">产地&nbsp;:&nbsp;</label>--%>
                      <%--<select class="form-control input-sm">--%>
                        <%--<option>黄材</option>--%>
                        <%--<option>横市</option>--%>
                        <%--<option>双凫铺</option>--%>
                        <%--<option>大成桥</option>--%>
                        <%--<option>回龙铺</option>--%>
                        <%--<option>宁乡</option>--%>
                      <%--</select>--%>
                      <%----%>
                    <%--</div>--%>
                    <%--<div class="pull-left">--%>
                   <%--<label class="control-label" style=" direction:ltr;">种类&nbsp;:&nbsp;</label>--%>
                      <%--<select class="form-control input-sm">--%>
                        <%--<option>三文鱼腊鱼</option>--%>
                        <%--<option>福寿鱼腊鱼</option>--%>
                        <%--<option>草鱼腊鱼</option>--%>
                      <%--</select>--%>

                    <%--</div>--%>
                  <%--</div>--%>
                  <%--<div class="product-page-cart">--%>
                    <%--<div class="product-quantity">--%>
                        <%--<input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">--%>
                    <%--</div>--%>
                    <%--<button class="btn btn-primary" type="submit">添加到购物车</button>--%>
                    <%--<button class="btn btn-default" type="submit">更多商品</button>--%>
                  <%--</div>--%>
                <%--</div>--%>

              <%--</div>--%>
            <%--</div>--%>
    <%--</div>    <!-- END fast view of a product -->--%>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="${path}/statics/assets/plugins/respond.min.js"></script>
    <![endif]-->  
    <script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
    <script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="${path}/statics/assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
    <script src="${path}/statics/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <%--<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>--%>
    <script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/scripts/app.js"></script>

	<script type="text/javascript">
      jQuery(document).ready(function() {
        App.init();   
        App.initBxSlider(); 
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform();
        App.initTouchspin();
        $(document).on("click",".product-image",function(){
          var $productMainImage=$(".product-main-image").find("img");
          var imgSrc=$(this).attr("src");
          $productMainImage.attr("src",imgSrc);
          $productMainImage.attr("data-BigImgSrc",imgSrc);
          App.initImageZoom();
          $('.add2cart').shoping();
        });
        $(document).on("click",".add2cart",function(){
//          var propertyId=$(".product-property").attr("propertyId");
          var form=$('[name="cartForm"]');
          var amount=$("#product-quantity").val();
          console.log("amount "+amount);
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
          console.log(JSON.stringify(data));
          $.ajax({
            url: path+"/index/cart",
            contentType: "application/json",
            data: JSON.stringify(data),
            method: "post",
            success: function (data) {
              console.log("add to cart success");
//              $.fancybox.close();
              renderCart(data);
            },
            error:function(data){

            }
          })
        });
      });
    </script>
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>

