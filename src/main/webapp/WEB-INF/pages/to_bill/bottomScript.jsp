<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
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
<%--<script type="text/javascript" src="${path}/statics/assets/scripts/cart.js"></script>--%>

<script src="${path}/statics/assets/plugins/cascading-select-address-master/js/selectAddress2.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/cascading-select-address-master/js/index.js"></script>

<%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>--%>
<%--<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>--%>
<%--<script>--%>
    <%--var map;--%>
    <%--var gpsPoint;--%>
    <%--var baiduPoint;--%>
    <%--var gpsAddress;--%>
    <%--var baiduAddress;--%>

    <%--function getLocation() {--%>
        <%--//根据IP获取城市--%>
        <%--var myCity = new BMap.LocalCity();--%>
        <%--return myCity.get(getCityByIP);--%>

        <%--//获取GPS坐标--%>
<%--//        if (navigator.geolocation) {--%>
<%--//            navigator.geolocation.getCurrentPosition(showMap, handleError, { enableHighAccuracy: true, maximumAge: 1000 });--%>
<%--//        } else {--%>
<%--////            alert("您的浏览器不支持使用HTML 5来获取地理位置服务");--%>
<%--//        }--%>
    <%--}--%>

    <%--function showMap(value) {--%>
        <%--var longitude = value.coords.longitude;--%>
        <%--var latitude = value.coords.latitude;--%>
        <%--map = new BMap.Map("map");--%>
        <%--//alert("坐标经度为：" + latitude + "， 纬度为：" + longitude );--%>
        <%--gpsPoint = new BMap.Point(longitude, latitude);    // 创建点坐标--%>
        <%--map.centerAndZoom(gpsPoint, 15);--%>

        <%--//根据坐标逆解析地址--%>
        <%--var geoc = new BMap.Geocoder();--%>
        <%--geoc.getLocation(gpsPoint, getCityByCoordinate);--%>

        <%--BMap.Convertor.translate(gpsPoint, 0, translateCallback);--%>
    <%--}--%>

    <%--translateCallback = function (point) {--%>
        <%--baiduPoint = point;--%>
        <%--var geoc = new BMap.Geocoder();--%>
        <%--geoc.getLocation(baiduPoint, getCityByBaiduCoordinate);--%>
    <%--}--%>

    <%--function getCityByCoordinate(rs) {--%>
        <%--gpsAddress = rs.addressComponents;--%>
        <%--var address = "GPS标注：" + gpsAddress.province + "," + gpsAddress.city + "," + gpsAddress.district + "," + gpsAddress.street + "," + gpsAddress.streetNumber;--%>
        <%--var marker = new BMap.Marker(gpsPoint);  // 创建标注--%>
        <%--map.addOverlay(marker);              // 将标注添加到地图中--%>
        <%--var labelgps = new BMap.Label(address, { offset: new BMap.Size(20, -10) });--%>
        <%--marker.setLabel(labelgps); //添加GPS标注--%>
    <%--}--%>

    <%--function getCityByBaiduCoordinate(rs) {--%>
        <%--baiduAddress = rs.addressComponents;--%>
        <%--var address = "百度标注：" + baiduAddress.province + "," + baiduAddress.city + "," + baiduAddress.district + "," + baiduAddress.street + "," + baiduAddress.streetNumber;--%>
        <%--var marker = new BMap.Marker(baiduPoint);  // 创建标注--%>
        <%--map.addOverlay(marker);              // 将标注添加到地图中--%>
        <%--var labelbaidu = new BMap.Label(address, { offset: new BMap.Size(20, -10) });--%>
        <%--marker.setLabel(labelbaidu); //添加百度标注--%>
    <%--}--%>

    <%--//根据IP获取城市--%>
    <%--function getCityByIP(rs) {--%>
        <%--var cityName = rs.name;--%>
<%--//        console.log(rs);--%>
<%--//        alert("根据IP定位您所在的城市为:" + cityName);--%>
    <%--}--%>

    <%--function handleError(value) {--%>
        <%--switch (value.code) {--%>
            <%--case 1:--%>
<%--//                alert("位置服务被拒绝");--%>
                <%--break;--%>
            <%--case 2:--%>
<%--//                alert("暂时获取不到位置信息");--%>
                <%--break;--%>
            <%--case 3:--%>
<%--//                alert("获取信息超时");--%>
                <%--break;--%>
            <%--case 4:--%>
<%--//                alert("未知错误");--%>
                <%--break;--%>
        <%--}--%>
    <%--}--%>

    <%--function init() {--%>
        <%--getLocation();--%>
    <%--}--%>
    <%--window.onload = init;--%>
<%--</script>--%>