<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/back-to-top.js"></script>--%>
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/fancybox/source/jquery.fancybox.js"></script>--%>
<!-- pop up -->
<%--<script type="text/javascript" src="${path}/statics/assets/plugins/bxslider/jquery.bxslider.min.js"></script>--%>
<!-- slider for products -->
<%--<script type="text/javascript" src='${path}/statics/assets/plugins/zoom/jquery.zoom.min.js'></script>--%>
<!-- product zoom -->
<%--<script src="${path}/statics/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>--%>
<!-- Quantity -->

<!-- BEGIN LayerSlider -->
<%--<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>--%>
<%--<script src="${path}/statics/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/index.js"></script>--%>
<script type="text/javascript" src="${path}/statics/assets/scripts/jQuery-shopping.js"></script>
<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>

<script>
        var containsIgnoreCases=function(full,part){
                if(!full) return false;
                if(full==="") return false;
                if(!part) return true;
                if(part==="") return true;
                var fullStr=full.toString();
                var partStr=part.toString();
                if(fullStr.length<partStr.length) return false;
                for(var i=0;i<partStr.length;i++){//abc
                        var partStrChar=partStr.substring(0,i+1);
                        if(fullStr.indexOf(partStrChar)<0 &&fullStr.indexOf(partStrChar.toLowerCase())<0&&fullStr.indexOf(partStrChar.toUpperCase())<0){
                                return false;
                        }
                }
                return true;
        }
        var matchCode=function(code,input){
                return containsIgnoreCases(code,input);
        }
        var matchNo=function(cardSorts,input){
                if(!input) return true;
                if(input==="") return true;
                if(!cardSorts) return false;
                if(cardSorts==="") return false;
                if(cardSorts==="[]") return false;
                if(!Array.isArray(cardSorts)) return false;
                for(var i=0;i<cardSorts.length;i++){
                        var cardSort=cardSorts[i];
                        var noStart=cardSort.noStart;
                        if(!noStart) continue;
                        if(noStart==="")continue;
                        if(noStart.indexOf(input)>=0){
                                return true;
                        }
                        continue;
                }
                return false;
        }
        angular.module("bank",[])
                .controller("bankController",["$scope","$http",function($scope,$http){
                        $http.get(path+"/statics/assets/plugins/bank/bankInfo.json")
                                .then(function(response){
                                        $scope.banks=response.data;
                                });
                        $scope.matches=function(bank){
                                var code=bank.code;
                                var cardSorts=bank.cardSorts;
                                if(!$scope.cardNoOrCode){
                                        return true;
                                }
                                if(matchCode(code,$scope.cardNoOrCode)||matchNo(cardSorts,$scope.cardNoOrCode)){
                                        return true;
                                }
                                return false;
                        };

                }])
        $(document).ready(function(){
                $(document).on("click","#shortcuts .bank-ico",function () {
                        var $shortcutsPayModal=$("#shortcutsPayModal");
                        var $img=$('<img src="'+path+'/statics/assets/plugins/bank/ico/'+$(this).data("ico")+'"/>');
                        var $bankName=$shortcutsPayModal.find('[name="bankName"]');
                        $bankName.empty();
                        $bankName.append($img);
                        $bankName=$shortcutsPayModal.modal().show();
                });
        });
</script>