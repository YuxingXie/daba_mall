<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- BEGIN TOP BAR -->

<!-- END HEADER -->

<div class="container ">
        <ul class="breadcrumb">
            <li><a href="${path}/index">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">搜索结果页</li>
        </ul>

        <div class="padding-top-25">
            <div class="content-search margin-bottom-20">
                <div class="row">
                    <div class="col-md-3 col-sm-3 text-right">
                        <h3>搜索到以下商品</h3>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <form action="${path}/index/product/search" method="post">
                            <div class="input-group margin-top-20">
                                <input type="text" placeholder="重新搜索" class="form-control" name="keyWord" required="true" value="${keyWord}">
                      <span class="input-group-btn">
                        <button class="btn btn-primary pull-left" type="submit">重新搜索<i class="fa fa-search"></i></button>
                      </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- BEGIN PRODUCT LIST -->
            <div class="table-responsive">
                <!-- PRODUCT ITEM START -->
                <table class="table table-hover">
                    <c:choose>
                    <c:when test="${empty _page.content}">
                        <tr class="text-danger high-lighter text-center" style="margin-top: 20px;margin-bottom: 10px;">
                            <th>对不起，没有找到关于"${keyWord}"的记录!</th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th colspan="2" class="text-center">商品名称</th>
                            <th>分类</th>
                            <th style="width: 50%">产品描述</th>
                            <th>商品信息</th>
                        </tr>
                    <c:forEach var="productSeries" items="${_page.content}" varStatus="varStatus">
                        <tr>
                            <td >
                                <a href="${path}/product_series/${productSeries.id}">
                                    <img src="${path}/${productSeries.pictures[0].iconPicture}" class="pull-left" alt="${productSeries.name}">
                                </a>
                            </td>
                            <td class="pull-left high-lighter">
                                    ${productSeries.name}
                            </td>
                            <td >
                                <p class="fa">${productSeries.productSubCategory.subCategoryName}</p>
                            </td>
                            <td>
                                <p class="fa fa-file-text-o high-lighter pull-left">${productSeries.description}</p>
                            </td>
                            <td>
                                <ul class="list-group list-inline">
                                            <li class="fa fa-cubes">库存:<a><c:choose><c:when test="${empty productSeries.productStore}">0</c:when><c:otherwise>${productSeries.productStore.remain}</c:otherwise></c:choose></a></li>
                                            <li class="fa fa-pencil">评论数:<a>${productSeries.evaluateCount}</a></li>
                                            <li class="fa fa-rmb">价格:<a>${productSeries.commonPrice}</a></li>
                                </ul>
                            </td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                </table>



                <!-- PRODUCT ITEM END -->
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row" style=" padding-bottom:20px;">
                <div id="infoPage"></div>
            </div>
            <!-- END PAGINATOR -->
        </div>
        <!-- END CONTENT -->

    </div>
    <!-- END SIDEBAR & CONTENT -->





