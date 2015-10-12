var App = function () {

     // IE mode
    var isRTL = false;
    var isIE8 = false;
    var isIE9 = false;
    var isIE10 = false;

    var responsive = true;

    var responsiveHandlers = [];

    var handleInit = function() {

        if ($('body').css('direction') === 'rtl') {
            isRTL = true;
        }

        isIE8 = !! navigator.userAgent.match(/MSIE 8.0/);
        isIE9 = !! navigator.userAgent.match(/MSIE 9.0/);
        isIE10 = !! navigator.userAgent.match(/MSIE 10.0/);
        
        if (isIE10) {
            jQuery('html').addClass('ie10'); // detect IE10 version
        }
    }

    // runs callback function set by App.addResponsiveHandler().
    var runResponsiveHandlers = function () {
        // reinitialize other subscribed elements
        for (var i in responsiveHandlers) {
            var each = responsiveHandlers[i];
            each.call();
        }
    }

    // handle the layout reinitialization on window resize
    var handleResponsiveOnResize = function () {
        var resize;
        if (isIE8) {
            var currheight;
            $(window).resize(function () {
                if (currheight == document.documentElement.clientHeight) {
                    return; //quite event since only body resized not window.
                }
                if (resize) {
                    clearTimeout(resize);
                }
                resize = setTimeout(function () {
                    runResponsiveHandlers();
                }, 50); // wait 50ms until window resize finishes.                
                currheight = document.documentElement.clientHeight; // store last body client height
            });
        } else {
            $(window).resize(function () {
                if (resize) {
                    clearTimeout(resize);
                }
                resize = setTimeout(function () {
                    runResponsiveHandlers();
                }, 50); // wait 50ms until window resize finishes.
            });
        }
    }

    var handleIEFixes = function() {
        //fix html5 placeholder attribute for ie7 & ie8
        if (isIE8 || isIE9) { // ie8 & ie9
            // this is html5 placeholder fix for inputs, inputs with placeholder-no-fix class will be skipped(e.g: we need this for password fields)
            jQuery('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function () {

                var input = jQuery(this);

                if (input.val() == '' && input.attr("placeholder") != '') {
                    input.addClass("placeholder").val(input.attr('placeholder'));
                }

                input.focus(function () {
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                });

                input.blur(function () {
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                });
            });
        }
    }

    // Handles scrollable contents using jQuery SlimScroll plugin.
    var handleScrollers = function () {
        $('.scroller').each(function () {
            var height;
            if ($(this).attr("data-height")) {
                height = $(this).attr("data-height");
            } else {
                height = $(this).css('height');
            }
            $(this).slimScroll({
                allowPageScroll: true, // allow page scroll when the element scroll is ended
                size: '7px',
                color: ($(this).attr("data-handle-color")  ? $(this).attr("data-handle-color") : '#bbb'),
                railColor: ($(this).attr("data-rail-color")  ? $(this).attr("data-rail-color") : '#eaeaea'),
                position: isRTL ? 'left' : 'right',
                height: height,
                alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false),
                railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false),
                disableFadeOut: true
            });
        });
    }

    var handleSearch = function() {    
        $('.search-btn').click(function () {            
            if($('.search-btn').hasClass('show-search-icon')){
                if ($(window).width()>767) {
                    $('.search-box').fadeOut(300);
                } else {
                    $('.search-box').fadeOut(0);
                }
                $('.search-btn').removeClass('show-search-icon');
            } else {
                if ($(window).width()>767) {
                    $('.search-box').fadeIn(300);
                } else {
                    $('.search-box').fadeIn(0);
                }
                $('.search-btn').addClass('show-search-icon');
            } 
        }); 
    }

    var handleMenu = function() {
        $(".header .navbar-toggle").click(function () {
            if ($(".header .navbar-collapse").hasClass("open")) {
                $(".header .navbar-collapse").slideDown(300)
                .removeClass("open");
            } else {             
                $(".header .navbar-collapse").slideDown(300)
                .addClass("open");
            }
        });
    }

    var handleSidebarMenu = function () {
        $(".sidebar .dropdown a").click(function () {
            if ($(this).hasClass("collapsed") == false) {
                $(this).addClass("collapsed");
                $(this).siblings(".dropdown-menu").slideDown(300);
            } else {
                $(this).removeClass("collapsed");
                $(this).siblings(".dropdown-menu").slideUp(300);
            }
        });
    }

    function handleDifInits() { 
        $(".header .navbar-toggle span:nth-child(2)").addClass("short-icon-bar");
        $(".header .navbar-toggle span:nth-child(4)").addClass("short-icon-bar");
    }

    function handleUniform() {
        if (!jQuery().uniform) {
            return;
        }
        var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle, .star)");
        if (test.size() > 0) {
            test.each(function () {
                    if ($(this).parents(".checker").size() == 0) {
                        $(this).show();
                        $(this).uniform();
                    }
                });
        }
    }

    var handleFancybox = function () {
        jQuery(".fancybox-fast-view").fancybox();

        if (!jQuery.fancybox) {
            return;
        }

        if (jQuery(".fancybox-button").size() > 0) {            
            jQuery(".fancybox-button").fancybox({
                groupAttr: 'data-rel',
                prevEffect: 'none',
                nextEffect: 'none',
                closeBtn: true,
                helpers: {
                    title: {
                        type: 'inside'
                    }
                }
            });

            $('.fancybox-video').fancybox({
                type: 'iframe'
            });
        }
    }

    // Handles Bootstrap Accordions.
    var handleAccordions = function () {
       
        jQuery('body').on('shown.bs.collapse', '.accordion.scrollable', function (e) {
            App.scrollTo($(e.target), -100);
        });
        
    }

    // Handles Bootstrap Tabs.
    var handleTabs = function () {
        // fix content height on tab click
        $('body').on('shown.bs.tab', '.nav.nav-tabs', function () {
            handleSidebarAndContentHeight();
        });

        //activate tab if tab id provided in the URL
        if (location.hash) {
            var tabid = location.hash.substr(1);
            $('a[href="#' + tabid + '"]').click();
        }
    }
	
    return {
        init: function () {
            // init core variables
            handleInit();
            handleResponsiveOnResize();
            handleIEFixes();
            handleSearch();
            handleFancybox();
            handleDifInits();
            handleSidebarMenu();
            handleAccordions();
            handleMenu();
            handleScrollers();

            this.addResponsiveHandler(function(){ 
                App.initBxSlider(true);
            });
        },

        initUniform: function (els) {
            if (els) {
                jQuery(els).each(function () {
                        if ($(this).parents(".checker").size() == 0) {
                            $(this).show();
                            $(this).uniform();
                        }
                    });
            } else {
                handleUniform();
            }
        },

        initTouchspin: function () {
            $(".product-quantity .form-control").TouchSpin({
                buttondown_class: "btn quantity-down",
                buttonup_class: "btn quantity-up"
            });
            $(".quantity-down").html("<i class='fa fa-angle-down'></i>");
            $(".quantity-up").html("<i class='fa fa-angle-up'></i>");
        },

        initBxSlider: function (reload) {
            $('.bxslider').each(function(){
                var width = $(window).width();

                var slides; 
                var slideMargin = parseInt($(this).attr("data-slide-margin"));
                var slideContainerWidth = $(this).closest('.bxslider-wrapper').width();
                var slideWidth;

                if (width <= 480) {
                    slides = $(this).attr("data-slides-phone");
                } else if (width > 480 && width <= 992) {
                    slides = $(this).attr("data-slides-tablet");
                } else {
                    slides = $(this).attr("data-slides-desktop");
                }

                slides = parseInt(slides);

                slideWidth = slideContainerWidth / slides;


                if (reload === true) {
                    if (!$(this).data("bxslider")) {
                        return;
                    }
                    $(this).data("bxslider").reloadSlider({
                        minSlides: slides,
                        maxSlides: slides,
                        slideWidth: slideWidth,
                        slideMargin: slideMargin,
                        moveSlides:5,
                        responsive:true
                    });
                } else {
                    //alert(2);
                    var slider = $(this).bxSlider({
                        minSlides: slides,
                        maxSlides: slides,
                        slideWidth: slideWidth,
                        slideMargin: slideMargin,   
                        moveSlides:5,
                        responsive:true
                    });
                    $(this).data("bxslider", slider);
                }
            });       
        },

        initImageZoom: function () {
            $('.product-main-image').zoom({url: $('.product-main-image img').attr('data-BigImgSrc')});
        },

        initSliderRange: function () {
            $( "#slider-range" ).slider({
              range: true,
              min: 0,
              max: 500,
              values: [ 50, 250 ],
              slide: function( event, ui ) {
                $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
              }
            });
            $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
            " - $" + $( "#slider-range" ).slider( "values", 1 ) );
        },

        // wrapper function to scroll(focus) to an element
        scrollTo: function (el, offeset) {
            var pos = (el && el.size() > 0) ? el.offset().top : 0;
            if (el) {
                if ($('body').hasClass('page-header-fixed')) {
                    pos = pos - $('.header').height(); 
                }            
                pos = pos + (offeset ? offeset : -1 * el.height());
            }

            jQuery('html,body').animate({
                scrollTop: pos
            }, 'slow');
        },

        //public function to add callback a function which will be called on window resize
        addResponsiveHandler: function (func) {
            responsiveHandlers.push(func);
        },

        scrollTop: function () {
            App.scrollTo();
        },

        gridOption1: function () {
            $(function(){
                $('.grid-v1').mixitup();
            });    
        }

    };
}();
/**
 * Created by Administrator on 2015/7/3.
 */
//
$(document).ready(function(){
//        var appendDom=function(pd_id){
//            console.log(pd_id);
//        $('#product-pop-up'+pd_id).remove();
//        var $product_pop_up_div=$('<div id="product-pop-up'+pd_id+'" style="display: none; width: 700px;"></div>');
//
//        $product_pop_up_div.empty();
//        var $product_page_div=$('<div class="product-page product-pop-up"></div>');
//        $product_page_div.appendTo($product_pop_up_div);
//        var $row_div=$('<div class="row"></div>');
//        $row_div.appendTo($product_page_div);
//        var $col_div=$('<div class="col-md-6 col-sm-6 col-xs-3"></div>');
//        $col_div.appendTo($row_div);
//        var $main_image_div=$('<div class="product-main-image"></div>');
//        $main_image_div.appendTo($col_div);
//        var $img=$('<img class="img-responsive"/>');
//        $img.attr("src","");
//        $img.appendTo($main_image_div);
//        var $other_images=$('<div class="product-other-images"></div>');
//        $other_images.appendTo($col_div);
//        var $col_div2=$('<div class="col-md-6 col-sm-6 col-xs-9"></div>');
//        $col_div2.appendTo($row_div);
//        var $h1_title=$('<h1 style=" text-align:center;"></h1>');
//        $h1_title.appendTo($col_div2);
//        var $price_availability_block=$('<div class="price-availability-block clearfix"></div>');
//        $price_availability_block.appendTo($col_div2);
//        var $price_div=$('<div class="price"></div>');
//        $price_div.html("<strong><span>￥</span></strong><em>￥<span></span></em>");
//        $price_div.appendTo($price_availability_block);
//        var $availability_div=$('<div class="availability">状态: <strong>货源充足</strong></div>');
//        $availability_div.appendTo($price_availability_block);
//        var $description_div=$('<div class="description" style=" direction:ltr;"></div>');
//        var $description_p=$('<p></p>');
//        $description_p.appendTo($description_div);
//        $description_div.appendTo($col_div2);
//        var $product_page_options=$('<div class="product-page-options"></div>');
//        $product_page_options.empty();
//        $product_page_options.appendTo($col_div2);
//        var $product_page_cart=$('<div class="product-page-cart"></div>');
//        $product_page_cart.appendTo($col_div2);
//        var $product_quantity=$('<div class="product-quantity"></div>');
//        $product_quantity.appendTo($product_page_cart);
//        var $input_quantity=$('<input type="text" value="1" readonly name="product-quantity" class="form-control input-sm"/>');
//        $input_quantity.appendTo($product_quantity);
//        var $btn_add2cart=$('<button class="btn btn-primary add2cart" type="submit">添加到购物车</button>');
//        $btn_add2cart.unbind("click");
//        $btn_add2cart.appendTo($product_page_cart);
//        var $btn_more=$('<button class="btn btn-default" type="submit">更多商品</button>');
//        $btn_more.appendTo($product_page_cart);
//        $product_pop_up_div.appendTo($('body'));
//    }
//    $(".fancybox-fast-view").click(function(){
//        var data_newpd_id=$(this).data("newpd-id");
//        appendDom(data_newpd_id);
//
//        $.ajax($(this).attr("data-url")).done(function(data){
//            $("#product-pop-up  .add2cart").unbind("click");
//            var $img=$('#product-pop-up .img-responsive');
//            $img.attr("src",path+"/"+data.pictures[0]);
//
//            var $h1_title=$('#product-pop-up h1');
//            $h1_title.text(data.name);
//
//            var $price_availability_block=$('#product-pop-up .price-availability-block.clearfix');
//            var $price_div=$('#product-pop-up .price');
//            $price_div.html("<strong><span>￥</span>"+data.commonPrice+"</strong><em>￥<span>62.00</span></em>");
//            $price_div.appendTo($price_availability_block);
//            var $description_p=$('#product-pop-up .description p');
//            $description_p.html(data.description);
//            var $product_page_options=$('#product-pop-up .product-page-options');
//            var productProperties =data.productProperties;
//            for(var i=0;i<productProperties.length;i++){
//                var pull_left=$('<div class="pull-left"></div>');
//                pull_left.appendTo($product_page_options);
//                var productProperty=productProperties[i];
//                var control_label=$('<label class="control-label" style=" direction:ltr;">'+productProperty["propertyName"]+'&nbsp;:&nbsp;</label>');
//                control_label.appendTo(pull_left);
//                var select=$('<select class="form-control input-sm" name='+productProperty["id"]+'>');
//                select.appendTo(pull_left);
//                var propertyValues= productProperty["propertyValues"];
//                for(var j=0;j<propertyValues.length;j++){
//                    var option=$("<option>"+propertyValues[j]+"</option>");
//                    option.appendTo(select);
//                }
//            }
//            var pictures=data.pictures;
//            var $images=$("#product-pop-up  .product-other-images");
////                $images.empty();
//            for(var i=0;i<pictures.length;i++){
//                var $img;
//                if(i==0)
//                    $img =$('<a href="#" class="active"><img src="'+path+'/'+pictures[i]+'"/></a>');
//                else
//                    $img =$('<a href="#"><img src="'+path+'/'+pictures[i]+'"/></a>');
//                $img.appendTo($images);
//            }
//
//            $("#product-pop-up  .add2cart").click(function(){
////                    console.log("id:"+data.id);
//            });
////                App.init();
////                App.initBxSlider();
////                Index.initLayerSlider();
//            App.initImageZoom();
////                App.initTouchspin();
//        }).fail(function(){ console("something wrong!"); });
//    });
//    App.init();
//    App.initBxSlider();
//    Index.initLayerSlider();
////        App.initImageZoom();
//    App.initTouchspin();
//    /* center modal */
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
