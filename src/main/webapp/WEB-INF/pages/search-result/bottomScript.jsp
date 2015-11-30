<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

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
<%--<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>--%>

<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>--%>
<script type="text/javascript" src="${path}/statics/assets/plugins/jquery-bootpag-master/lib/jquery.bootpag.js"></script>
<script>
    $('.demo4_top,.demo4_bottom').bootpag({
        total: ${_page.totalPages},
        page: ${page},
        maxVisible: 3,
        leaps: false,
        firstLastUse: true,
        first: '<span aria-hidden="true">&larr;</span>',
        last: '<span aria-hidden="true">&rarr;</span>'
//        wrapClass: 'pagination',
//        activeClass: 'active',
//        disabledClass: 'disabled',
//        nextClass: 'next',
//        prevClass: 'prev',
//        lastClass: 'last',
//        firstClass: 'first'
    }).on("page", function(event, num){
//        $(".content4").html("Page " + num); // or some ajax content loading...
        <c:url var="url" value="/index/product/search">
        <c:param name="keyWord" value="${keyWord}"/>
        <%--<c:param name="page" value="${page}"/>--%>
        </c:url>
        window.location.href="${url}&page="+num;
    }).find('.pagination');
    highLighter = function () {
        $(".high-lighter").each(function () {
            var oldText = $(this).text();
            var newText = oldText.replace('${keyWord}', '<span style="color:red">${keyWord}</span>');
            $(this).html(newText);
        });
    }
    $(document).ready(function () {
        App.init();
        App.initBxSlider();
        Index.initLayerSlider();
        App.initImageZoom();
        App.initTouchspin();
        highLighter();
    });
</script>