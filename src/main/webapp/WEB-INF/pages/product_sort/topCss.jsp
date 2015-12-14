<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<link href="${path}/statics/assets/css/home-page.css" rel="stylesheet" type="text/css">
<style>
    #infoPage .prev {padding: 2px 7px;}
    #infoPage .next {padding: 2px 7px;}
    #infoPage .page{/*border: 1px solid #D4D4D4;*/color: #b3b5bd;margin-right: 3px;padding: 2px 7px;text-decoration: none;}
    #infoPage .active{margin-right: 3px;padding: 2px 7px;text-decoration: none;}
    #infoPage .active a{background-color: #00CCFF;-webkit-border-radius: 3px;-moz-border-radius: 3px;}
    /*#infoPage span, .pager a {font-size: 12px;font-weight: bolder; text-decoration: none;}*/
    #infoPage li a, #infoPage li{display: block; float: left; width: auto;}
    #infoPage a:hover {color:#0061DE; }
    /*#infoPage .upPage,#infoPage .downPage {color: #0061DE; border: 1px solid #E5E5E5;*//*height: 16px;*//* padding-top: 2px;text-align: center; width: 48px;margin-right: 4px;}*/
    /*#inputPage{border:#b3b5bd 1px solid; width:25px; *//*height: 20px;*//*text-align: center;}*/
    #infoPage .separate a{cursor: default; border: none;}
    #infoPage .separate a:hover {background: none;}
</style>
<link href="${path}/statics/assets/css/breadcrumb.css" rel="stylesheet" type="text/css">