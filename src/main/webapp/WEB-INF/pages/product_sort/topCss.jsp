<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<link href="${path}/statics/assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
<%--<style>--%>
    <%--#infoPage {text-align: center;padding:0px 0 0 0;}--%>
    <%--#infoPage{float:right;width:auto;/*padding-top: 10px;*/}/*expression(doucment.getElementById('infoPage').scrollWidth+'px';);*/--%>
    <%--#infoPage .prev {margin-right: 20px;}--%>
    <%--#infoPage .next {margin-left: 15px;}--%>
    <%--#infoPage .everyPage{/*border: 1px solid #D4D4D4;*/color: #b3b5bd;margin-right: 3px;padding: 2px 7px;text-decoration: none;}--%>
    <%--#infoPage .active{margin-right: 3px;padding: 2px 7px;text-decoration: none;color:darkgreen;}--%>
    <%--#infoPage span, .pager a {font-size: 12px;font-weight: bolder; text-decoration: none;}--%>
    <%--#infoPage li {display: inline-block;/*height: 34px;*/}--%>
    <%--#infoPage li a, #infoPage li{display: block; float: left; width: auto; line-height:11px;}--%>
    <%--#infoPage a:hover {color:#0061DE; }--%>
    <%--#infoPage .upPage,#infoPage .downPage {color: #0061DE; border: 1px solid #E5E5E5;/*height: 16px;*/ padding-top: 2px;text-align: center; width: 48px;margin-right: 4px;}--%>
    <%--#inputPage{border:#b3b5bd 1px solid; width:25px; /*height: 20px;*/text-align: center;}--%>
    <%--#infoPage .goToPage{margin-left:0px;width:30px;/*height:20px;*/display:inline-block;}--%>
<%--</style>--%>
<style>
    .page-list .pagination {float:left;}
    .page-list .pagination span {cursor: pointer;}
    .page-list .pagination .separate span{cursor: default; border-top:none;border-bottom:none;}
    .page-list .pagination .separate span:hover {background: none;}
    .page-list .page-total {float:left; margin: 25px 20px;}
    .page-list .page-total input, .page-list .page-total select{height: 26px; border: 1px solid #ddd;}
    .page-list .page-total input {width: 70px; padding-left:3px;}
    /*.page-list .page-total select {width: 50px;}*/
</style>