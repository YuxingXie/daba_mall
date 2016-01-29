<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>


<div  ng-controller="HomePageTopController">
    <form name="form" id="form" target="_blank"  method="post">
        <input type="hidden" name="data" id="data"/>

        <div class="row">
            <h4>顶部轮播图<c:if test="${empty id}">制作</c:if><c:if test="${not empty id}"> 编辑</c:if></h4>
        </div>
        <div class="page-slider">
            <!--LayerSlider begin-->
            <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">
                <!--LayerSlider layer-->
                <div class="ls-layer ls-layer2" style="slidedirection: right; transition2d: 110,111,112,113; ">
                    <img src="${path}/${top3[0][1]}" class="ls-bg" alt="Slide background">
                    <div class="ls-s-1 ls-title title" style=" top: 40%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                        <strong class="title">${top3[0][2]}</strong>
                        ${top3[0][3]}
                        <em class="title">${top3[0][4]}</em>
                    </div>

                    <div class="ls-s-2 ls-price title" style=" top: 50%; left: 45%; slidedirection : fade; slideoutdirection : fade; durationout : 109750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                        <b>${top3[0][5]}</b>
                        <strong><span>￥</span>${top3[0][6]}</strong>
                    </div>

                    <a href="javascript:void(0)" data-href="${path}/product_series/${top3[0][0]}" class="ls-s-1 ls-more mini-text add2cart" style=" top: 72%; left: 21%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; easingout : easeInOutQuint; delayin : 0; delayout : 0; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; display: inline-block; white-space: nowrap;">
                        添加到购物车
                    </a>
                </div>
                <div class="ls-layer ls-layer5" style="slidedirection: right; transition2d: 110,111,112,113; ">
                    <img src="${path}/${top3[1][1]}" class="ls-bg" alt="Slide background">

                    <div class="ls-s-1 title" style=" top: 35%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                        ${top3[1][2]}<br>${top3[1][3]}
                    </div>

                    <div class="ls-s-1 mini-text" style=" top: 70%; left: 60%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap;">
                        <span>${top3[1][4]}</span>
                        <a href="javascript:void(0)" data-href="${path}/product_series/${top3[1][0]}" class="add2cart">添加到购物车</a>
                    </div>
                </div>
                <!--LayerSlider layer-->
                <div class="ls-layer ls-layer3" style="slidedirection: right; transition2d: 92,93,105; ">
                    <img src="${path}/${top3[2][1]}" class="ls-bg" alt="Slide background">

                    <div class="ls-s-1 ls-title" style=" top: 83px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                        ${top3[2][2]}
                        <strong>${top3[2][3]}</strong>
                        ${top3[2][4]}
                    </div>

                    <div class="ls-s-1" style=" top: 333px; left: 33%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; scalein : .8; scaleout : .8; showuntil : 4000; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;">
                        <a href="javascript:void(0)" data-href="${path}/product_series/${top3[2][0]}" class="ls-buy add2cart">
                            添加到购物车
                        </a>
                        <div class="ls-price">
                            <span>${top3[2][5]}</span>
                            <strong><sup>￥</sup>${top3[2][6]}</strong>
                        </div>
                    </div>
                </div>
                <!--LayerSlider layer-->
            </div>
            <!--LayerSlider end-->
        </div>
        <div class="row margin-bottom-20 margin-left-20">
            <div class="center-block font-size-17-5">
                <b>第一步：从下方列表选择三个产品（如果选择多于三个，只有前三个会生效）</b>
            </div>
            <div class="center-block font-size-17-5">
                <b>第二步：选择一张产品的图片作为广告图片（不选默认为产品第一张图片）</b>
            </div>
            <div class="center-block font-size-17-5">
                <b>第三步：对照示例修改文字,<span class="color-red">注：可以为输入的文字添加添加html元素，定义样式和使用类</span></b>
            </div>
            <div class="center-block font-size-17-5">
                <b>第四步：点击右侧按钮预览效果</b><button type="submit" class="btn btn-primary btn-xs" data-ng-click="preview()"> 预览<i class=" fa fa-eye"></i></button>
            </div>
            <div class="center-block font-size-17-5">
                <b>第五步：如果效果已经确定，为该方案设置一个优先级，只有优先级最大的方案才会在首页显示，优先级为一个1-9999之间的数字。不输入默认优先级为零。</b>
                <input type="number" ng-model="priority" placeholder="1-9999之间的数字" max="9999" <c:if test="${not empty topCarousel.priority}">ng-init="priority=${topCarousel.priority}"</c:if>/>
                <a class="btn btn-primary btn-xs"  ng-init="showTopCarousels=false" data-ng-click="showTopCarousels=!showTopCarousels;getTopCarousels()">显示/隐藏其它方案的优先级<i class=" fa fa-search"></i></a>
                <div class="table-responsive" ng-if="showTopCarousels">
                    <table class="table table-hover table-condensed table-bordered">
                        <tr>
                            <th class="font-size-12">方案名称</th>
                            <th class="font-size-12">优先级</th>
                        </tr>
                        <tr ng-if="!topCarousels||!topCarousels.length">
                            <td colspan="3" class="font-size-12">暂时没有方案</td>
                        </tr>
                        <tr ng-repeat="topCarousel in topCarousels">
                            <td class="font-size-12">{{topCarousel.name}}</td>
                            <td class="font-size-12">{{topCarousel.priority}}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="center-block font-size-17-5">
                <b>第六步：为该方案命名。</b>
                <input type="text" class="form-control" ng-model="topCarouselName" ng-init="topCarouselName='${topCarousel.name}'" placeholder="方案名称">
            </div>
            <div class="center-block font-size-17-5">
                <b>第七步：保存方案。如果优先级设置为所有方案中最高，该方案会立即生效。</b>
                <button type="submit" class="btn btn-primary btn-xs" data-ng-click="save()">保存方案 <i class=" fa fa-save"></i></button>
            </div>
            <div class="center-block font-size-17-5 color-red fa fa-warning">
                <b>注意：每个产品的第一项为产品id,第二项为产品图片，一般情况下请不要手动修改第一二项。</b>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;" ng-repeat="adv in top3 track by $index">
                <div class="row">
                    <b class="font-size-13-5">第{{$index+1}}个产品</b>
                </div>
                <div class="row padding-bottom-10">

                    <b class="font-size-13-5">输入的时候如果输入框失去焦点影响输入，请在下面的输入框输入，再使用复制粘贴</b>
                    <input type="text" class="form-control" placeholder="在这里输入不会失去焦点" style="width: 400px;"/>

                </div>
                <div class="row padding-top-5"  ng-repeat="word in adv track by $index">
                    <%--<input type="text" ng-model="adv[$index]" ng-init="adv[$index]=word" class="form-control">--%>
                    <input type="text" ng-init="adv[$index]=word" ng-model="adv[$index]" class="form-control" style="width: 350px;">
                </div>
            </div>
            <div class="row table-bordered">

            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-12 col-sm-12 text-center"><h3>请选择三个产品,并为每个产品选择一张图片</h3></div>


            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-4" style="margin-bottom: 15px;margin-top: 15px;" ng-repeat="productSeriesSelected in productSeriesSelectedList">
                        <span class="pull-left" href="javascript:void(0)" ng-repeat="picture in productSeriesSelected.pictures">
                            <img ng-src="${path}/{{picture.iconPicture}}"/>
                            <input ng-model="top3[$parent.$index][1]" type="radio" class="form-control" ng-model="" name="top3{{$parent.$index}}" value="{{picture.bigPicture}}"/>

                        </span>
                    {{productSeriesSelected.name}}
                </div>
            </div>

            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                <div class="col-lg-12 col-sm-12 table-responsive">
                    <table class="table table-hover">
                        <tr>
                            <th>产品名称</th>
                            <th>价格</th>
                            <th>上架日期</th>
                            <th>分类</th>
                            <th>选择</th>
                        </tr>
                        <tr ng-repeat="productSeries in productSeriesList">
                            <td><img ng-src="${path}/{{productSeries.pictures[0].iconPicture}}"/>{{productSeries.name}}</td>
                            <td>{{productSeries.currentPrice.price}}</td>
                            <td>{{productSeries.shelvesDate | date:'yyyy-MM-dd hh:mm'}}</td>
                            <td>{{productSeries.productSubCategory.productCategory.categoryName}} {{productSeries.productSubCategory.subCategoryName}}</td>
                            <td ng-init="checked=false">
                                <input type="checkbox" ng-click="checked=!checked;addToList(checked,$index,productSeries)" ng-checked="checked"/></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;margin-top: 15px;">
                    <div class="col-lg-6 col-sm-6  text-right ">
                    </div>
                    <div class="col-lg-6 col-sm-6">

                    </div>
            </div>


        </div>

        </div>
        <div class="modal fade active" id="imageZoomModal" tabindex="-1" role="dialog" aria-labelledby="imageZoomModal" aria-hidden="true">
            <div class="modal-dialog">

            </div>
        </div>
    </form>
</div>
