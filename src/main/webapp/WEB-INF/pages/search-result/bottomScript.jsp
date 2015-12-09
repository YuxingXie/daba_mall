<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

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
<script src="${path}/statics/assets/plugins/bootstrap-paginator-master/build/bootstrap-paginator.min.js"></script>
<script>
    var options = {
        currentPage: ${page},
        totalPages: ${_page.totalPages},
        itemContainerClass: function (type, page, current) {
            return (page === current) ? "active" : "everyPage";
        },pageUrl: function(type, page, current){
            return "${path}/index/product/search?page="+page+"&keyWord=${keyWord}";
        },itemTexts: function (type, page, current) {
            switch (type) {
                case "first":
                    return "<i class='fa fa-fast-backward'></i>";
                case "prev":
                    return "<i class='fa fa-backward'></i>";
                case "next":
                    return "<i class='fa fa-forward'></i>";
                case "last":
                    return "<i class='fa fa-fast-forward'></i>";
                case "page":
                    return page;
            }
        }
    }
    $('#infoPage').bootstrapPaginator(options);
    highLighter = function () {
        $(".high-lighter").each(function () {
            var oldText = $(this).text();
            var newText = oldText.replace('${keyWord}', '<span style="color:red">${keyWord}</span>');
            $(this).html(newText);
        });
    }
    $(document).ready(function () {
//        App.init();
//        App.initBxSlider();
//        Index.initLayerSlider();
//        App.initImageZoom();
//        App.initTouchspin();
        highLighter();
    });
</script>