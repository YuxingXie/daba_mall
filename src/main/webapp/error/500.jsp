<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" href="${path}/statics/error/css/main.css" type="text/css" media="screen, projection" /> <!-- main stylesheet -->
<link rel="stylesheet" type="text/css" media="all" href="${path}/statics/error/css/tipsy.css" /> <!-- Tipsy implementation -->

<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href="${path}/statics/error/css/ie8.css" />
<![endif]-->

<script type="text/javascript" src="${path}/statics/error/scripts/jquery-1.7.2.min.js"></script> <!-- uiToTop implementation -->
<script type="text/javascript" src="${path}/statics/error/scripts/custom-scripts.js"></script>
<script type="text/javascript" src="${path}/statics/error/scripts/jquery.tipsy.js"></script> <!-- Tipsy -->

<script type="text/javascript">

$(document).ready(function(){
			
	universalPreloader();
						   
});

$(window).load(function(){

	//remove Universal Preloader
	universalPreloaderRemove();
	
	rotate();
    dogRun();
	dogTalk();
	
	//Tipsy implementation
	$('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});
						   
});

</script>


<title>500 - Server error</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>

<!-- Universal preloader -->
<div id="universal-preloader">
    <div class="preloader">
        <img src="${path}/statics/error/images/universal-preloader.gif" alt="universal-preloader" class="universal-preloader-preloader" />
    </div>
</div>
<!-- Universal preloader -->

<div id="wrapper">
<!-- 404 graphic -->
	<div class="graphic"></div>
<!-- 404 graphic -->
<!-- Not found text -->
	<div class="not-found-text">
    	<h1 class="not-found-text">Sorry,我们出了点错!</h1>
    </div>
<!-- Not found text -->

<!-- search form -->
<div class="search">
	<form name="search" method="get" action="#" />
        <input type="text" name="search" value="Search ..." />
        <input class="with-tooltip" title="Search!" type="submit" name="submit" value="" />
    </form>
</div>
<!-- search form -->

<!-- top menu -->
<div class="top-menu">
	<a href="#" class="with-tooltip" title="Return to the home page">首页</a> | <a href="#" class="with-tooltip" title="Navigate through our sitemap">站点地图</a> | <a href="#" class="with-tooltip" title="Contact us!">联系</a> | <a href="#" class="with-tooltip" title="Request additional help">帮助</a>
</div>
<!-- top menu -->

<div class="dog-wrapper">
<!-- dog running -->
	<div class="dog"></div>
<!-- dog running -->
	
<!-- dog bubble talking -->
	<div class="dog-bubble">
    	
    </div>
    
    <!-- The dog bubble rotates these -->
    <div class="bubble-options">
    	<p class="dog-bubble">
        	你输了，芽？别担心，我是一个很好的指导！
        </p>
    	<p class="dog-bubble">
	        <br />
        	 汪! 汪!
        </p>
        <p class="dog-bubble">
        	<br />
        	不用担心！我就可以了！
        </p>
        <p class="dog-bubble">
        	我希望我有一个饼干<br /><img style="margin-top:8px" src="${path}/statics/error/images/cookie.png" alt="cookie" />
        </p>
        <p class="dog-bubble">
        	<br />
        	吉兹！这是很烦人！
        </p>
        <p class="dog-bubble">
        	<br />
        	我在越来越接近？
        </p>
        <p class="dog-bubble">
        	还是我只是要在圈子？罗...
        </p>
        <p class="dog-bubble">
        	<br />
            OK，我现在正式失去了...
        </p>
        <p class="dog-bubble">
        	I think I saw a <br /><img style="margin-top:8px" src="${path}/statics/error/images/cat.png" alt="cat" />
        </p>
        <p class="dog-bubble">
        	那么，我们应该在寻找，到底？ @_@
        </p>
    </div>
    <!-- The dog bubble rotates these -->
<!-- dog bubble talking -->
</div>

<!-- planet at the bottom -->
	<div class="planet"></div>
<!-- planet at the bottom -->
</div>
<div style="text-align:center;">
<p>来源：<a href="http://www.mycodes.net/" title="源码之家" target="_blank">源码之家</a></p>
</div>
</body>
</html>