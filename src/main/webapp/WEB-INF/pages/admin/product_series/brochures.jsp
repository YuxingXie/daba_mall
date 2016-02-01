<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.ProductSeries" scope="request"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div ng-controller='BrochuresController'>

    <div class="row margin-bottom-10 text-danger"><p>本页用于制作非跨域宣传册。非跨域宣传册表示宣传册内容都包含在程序服务器范围之内；</p></div>
    <div class="row margin-bottom-10 text-danger"><p>如果为网页宣传册，请将其整体打包为rar或zip(可能包含html,css,图片,脚本等文件)，上传至服务器后，程序自动会将其解压；</p></div>
    <div class="row margin-bottom-10 text-danger"><p>程序将把名为"page.html"的文件作为宣传册文件，所以制作宣传册时注意html文件的命名；</p></div>
    <div class="row margin-bottom-10 text-danger"><p>如果为图片宣传册，单独上传图片即可(只能为单张图片)。</p></div>
    <div class="row margin-bottom-10"><b>商品名称：</b>{{productSeries.name}}</div>


    <div class="row margin-bottom-10"><b>当前宣传册:</b>
        <span ng-if="!productSeries.productBrochures">无</span>
        <span ng-if="productSeries.productBrochures">类型:</span>
        <span ng-if="productSeries.productBrochures.type==='img'">图片</span>
        <span ng-if="productSeries.productBrochures.type==='page'">网页</span>
        <span ng-if="productSeries.productBrochures">,url:<a ng-href="{{productSeries.productBrochures.url}}" target="_blank">{{productSeries.productBrochures.url}}</a></span>
    </div>
    <div class="row margin-bottom-10"><h4>制作宣传册</h4></div>

    <form action="${path}/admin/product_series/update_brochures" method="post" class="form-without-legend" novalidate="novalidate" name="form" enctype="multipart/form-data">
        <fieldset>
            <div class="row margin-top-10">
                <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">类型：</div>
                <div class="col-sm-7 col-lg-7">
                    <label>图片<input type="radio" name="type" value="img"/></label>
                    <label>网页<input type="radio" name="type" value="page"/></label>
                </div>
            </div>
            <div class="row margin-top-10">
                <div class="col-sm-2 col-lg-2 control-label padding-top-10 text-right">文件：</div>
                <div class="col-sm-4 col-lg-4 pull-left">
                    <input type="file" name="file" class="form-control"/>
                    <input type="text" name="id" class="hidden" value="{{productSeries.id}}"/>
                </div>
            </div>
            <div class="row margin-top-10">
                <div class="col-sm-7 col-lg-7 control-label padding-top-10 text-right"></div>
                <div class="col-sm-4 col-lg-4 pull-left input-group">
                    <span class="input-group-btn">
                        <input type="submit"class="btn btn-primary" value="确定"/>
                    </span>
                </div>
            </div>

        </fieldset>
    </form>

</div>


