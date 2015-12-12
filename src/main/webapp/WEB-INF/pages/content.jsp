<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>



<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular.min.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/angular-1.2.19/angular-route.js"></script>


<!-- BEGIN SLIDER -->

<!-- BEGIN BRANDS -->

<!-- END BRANDS -->

<%--<!-- BEGIN STEPS -->--%>
<%--<div class="steps3 steps3red">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-truck"></i>--%>
                <%--<div>--%>
                    <%--<h2>品质保证</h2>--%>
                    <%--<em>我们只生产生态绿色食品</em>--%>
                <%--</div>--%>
                <%--<span>&nbsp;</span>--%>
            <%--</div>--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-gift"></i>--%>
                <%--<div>--%>
                    <%--<h2>商务合作</h2>--%>
                    <%--<em>我们的强大需要您的加入</em>--%>
                <%--</div>--%>
                <%--<span>&nbsp;</span>--%>
            <%--</div>--%>
            <%--<div class="col-md-4 steps3-col">--%>
                <%--<i class="fa fa-phone"></i>--%>
                <%--<div>--%>
                    <%--<h2>87654321</h2>--%>
                    <%--<em>24小时竭诚为您服务热线</em>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- END STEPS -->--%>

<%--<!-- BEGIN PRE-FOOTER -->--%>
<%--<div class="pre-footer">--%>
    <%--<div class="container">--%>
        <%--<hr>--%>
        <%--<div class="row">--%>
            <%--<!-- BEGIN BOTTOM ABOUT BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>关于我们</h2>--%>
                <%--<p>长沙大坝生态农业科技有限公司组建于2013年，注册资本1000万元，现有固定员工180人。公司致力于现代生态高效农业产业化集群开发，着力打造全民创业、万众创新的平台，着力解决千家万户的"菜篮子"、"米袋子"、"果盘子"所需。</p>--%>
                <%--<p>公司拥有"一中心，二平台，三基地"。即特色农产品展示中心；特色农产品研发孵化平台，特色农产品信息交流平台；长沙大坝生态金棋现代农业示范基地，长沙大坝生态黄材水库有机野生鱼类养殖基地，长沙大坝生态干鱼加工基地。</p>--%>
            <%--</div>--%>
            <%--<!-- END BOTTOM ABOUT BLOCK -->--%>
            <%--<!-- BEGIN BOTTOM INFO BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>企业动态</h2>--%>
                <%--<ul class="list-unstyled">--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">公司崇尚的文化</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">大坝精神</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">我们有一支优秀的团队</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">企业历史</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">打造特色农产品信息交流平台</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">人民出版社出版大坝书籍</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">中央电视访谈大坝团队成功经历</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END INFO BLOCK -->--%>
            <%--<!-- BEGIN TWITTER BLOCK -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>媒体报道</h2>--%>
                <%--<ul class="list-unstyled">--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">大坝生态农业在美国上市</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">挺近世界500强的艰辛历程</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">成为国内首支团队完整的电商企业</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">荣获优秀企业称号</a></li>--%>
                    <%--<li><i class="fa fa-angle-right"></i> <a href="#">公司年营业额占据福布斯榜首</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END TWITTER BLOCK -->--%>
            <%--<!-- BEGIN BOTTOM CONTACTS -->--%>
            <%--<div class="col-md-3 col-sm-6 pre-footer-col">--%>
                <%--<h2>联系我们</h2>--%>
                <%--<address class="margin-bottom-40">--%>
                    <%--联系电话：0731-87654321<br>--%>
                    <%--企业QQ：88888888<br>--%>
                    <%--公司微信：weixin_daba<br>--%>
                    <%--电子邮件: <a href="mailto:info@metronic.com">info@metronic.com</a><br>--%>
                <%--</address>--%>
            <%--</div>--%>
            <%--<!-- END BOTTOM CONTACTS -->--%>
        <%--</div>--%>
        <%--<hr>--%>



    <%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<!-- END PRE-FOOTER -->--%>

<%--<!-- BEGIN FOOTER -->--%>
<%--<div class="footer padding-top-15">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<!-- BEGIN COPYRIGHT -->--%>
            <%--<div class="col-md-6 col-sm-6 padding-top-10">--%>
                <%--www.daba.com2015&copy; 湘ICP备88888888号-8--%>
            <%--</div>--%>
            <%--<!-- END COPYRIGHT -->--%>
            <%--<!-- BEGIN PAYMENTS -->--%>
            <%--<div class="col-md-6 col-sm-6">--%>
                <%--<ul class="list-unstyled list-inline pull-right margin-bottom-15">--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/american-express.jpg" alt="We accept American Express" title="We accept American Express"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/MasterCard.jpg" alt="We accept MasterCard" title="We accept MasterCard"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/PayPal.jpg" alt="We accept PayPal" title="We accept PayPal"></li>--%>
                    <%--<li><img src="${path}/statics/assets/img/payments/visa.jpg" alt="We accept Visa" title="We accept Visa"></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- END PAYMENTS -->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- END FOOTER -->--%>

<%--<!-- BEGIN fast view of a product -->--%>
<%--<div id="product-pop-up" style="display: none; width: 700px;">--%>
    <%--<div class="product-page product-pop-up">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-6 col-sm-6 col-xs-3">--%>
                <%--<div class="product-main-image">--%>
                    <%--<img src="${path}/statics/assets/temp/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">--%>
                <%--</div>--%>
                <%--<div class="product-other-images">--%>
                    <%--<a href="#" class="active"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model3.jpg"></a>--%>
                    <%--<a href="#"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model4.jpg"></a>--%>
                    <%--<a href="#"><img alt="Berry Lace Dress" src="${path}/statics/assets/temp/products/model5.jpg"></a>--%>
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
<%--</div>--%>

<%--<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>--%>
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
<script type="text/javascript">

               $(document).ready(function(){
                   console.log("init app...");
                   App.init();
                   App.initBxSlider();
                   Index.initLayerSlider();
                   App.initImageZoom();
                   App.initTouchspin();
               });

</script>