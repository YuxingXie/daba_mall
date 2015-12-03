<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path"
                                                                                             value=""/></c:if>
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
<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.modal.js"></script>
<script type="text/javascript" src="${path}/statics/assets/plugins/sco.js-master/js/sco.confirm.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#toBill").click(function () {
            var supportHtml5=false;
            if (window.applicationCache) {
                supportHtml5=true;
            } else {
                supportHtml5=false;
            }
            var isLogin = false;
            $.ajax({
                url: path + "/index/login_user"

            }).done(function (data) {
                if (!data.id) {
                    console.log("user not log in");
                    $("#myModal").modal().show();
                    return false;
                }else{
                   nonHtml5Post();
                    return false;
                }
            }).fail(function(){
                console.log("error ");
                return false;
            });

        });
        $(".del-order").click(function(){
            var action=$(this).data("href");
            $("#ensure-delete").attr("href",action);
            $(this).scojs_confirm({
                target:'#confirmDeleteOrderModal'
            });
        });

    });

</script>