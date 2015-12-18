<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="p" uri="/pageTag" %>
<%@taglib prefix="f" uri="/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

    <div class="container" id="page-main">
      <div ng-controller="productSeriesCtrl">
        <ul class="breadcrumb">
            <li><a href="${path}">首页</a></li>
            <li><a href="">商店</a></li>
            <li class="active">物品详情</li>
        </ul>
        <div class="row bg-info margin-bottom-40">
          <div class="col-lg-5 col-sm-5">
              <form name="form">
                <div class="row">
                  <div class="easyzoom easyzoom--adjacent" ng-init="img=0;">
                    <a ng-href="${path}/{{productSeries.pictures[img].bigPicture}}">
                      <img ng-src="${path}/{{productSeries.pictures[img].picture}}" class="img-responsive"/>
                    </a>
                  </div>
                </div>
                <div class="row">
                  <span class="thumbnail img-ico-lg col-lg-2 col-sm-2" ng-repeat="picture in productSeries.pictures">
                    <a class="control-label" href="javascript:void(0)" data-ng-click="$parent.img=$index;"><img class="img-thumbnail" ng-src="${path}/{{picture.picture}}"/></a>
                  </span>
                </div>
                <div class="row">
                  <div class="padding-left-10 padding-right-30"><i>{{productSeries.description}}</i></div>
                </div>

              </form>
          </div>
          <div class="col-lg-4 col-sm-4">
              <div class="row padding-bottom-20"><h1 class="center-block">{{productSeries.name}}</h1></div>
              <div class="row padding-bottom-20">
                <div class="col-sm-3 col-lg-3 padding-left-0 margin-left-0 text-left"><h3 class="fa fa-rmb fa-2x">{{productSeries.commonPrice}}</h3>
                  <em ng-if="productSeries.currentPrice &&productSeries.currentPrice.prevPrice && productSeries.currentPrice<productSeries.currentPrice.prevPrice">
                    <i class="fa fa-rmb"></i>{{productSeries.currentPrice.prevPrice.price}}
                  </em>
                </div>
              </div>
              <div class="row padding-bottom-20">
                <div class="col-lg-3 col-sm-3 padding-left-0 margin-left-0" star rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="true"></div>
              </div>

              <div class="row padding-bottom-20">
                <div class="col-sm-3 col-lg-3 text-left padding-left-0 margin-left-0">库存 {{productSeries.productStore.remain}}</div>
              </div>
              <div class="row padding-bottom-20">
                <div class="col-sm-3 col-lg-3 text-left padding-left-0 margin-left-0">{{productSeries.evaluateCount}}条评论</div>
                <div class="col-sm-3 col-lg-3 text-left padding-left-0 margin-left-0">
                  <a ng-if="order && order.id" href="javascript:void(0)" class="tour-step1" data-toggle="modal" data-target="#evaluateModal">发表评论</a>
                </div>
              </div>
            <div class="row padding-bottom-20 form-group">
                <div ng-repeat="productProperty in productSeries.productProperties">
                  <label class="control-label pull-left margin-top-10">{{productProperty.propertyName}}:</label>
                  <div class="col-lg-4 col-sm-4">
                    <select  ng-model="productSelected.productPropertyValueList[$index]" required="true" class="form-control"
                        ng-options="productPropertyValue.value for productPropertyValue in productProperty.propertyValues"></select>
                  </div>
                </div>
            </div>
            <div class="row padding-bottom-20">
                <div class="col-lg-4 col-sm-4"><input type="number" min="1" class="form-control" ng-model="productSelected.amount" placeholder="购买数量"/></div>
                <div class="col-lg-4 col-sm-4">
                  <button class="btn btn-primary add2cart fa fa-shopping-cart margin-left-20" type="button" data-ng-click="add2cart()">添加到购物车</button>
                </div>
            </div>
            <div class="row padding-bottom-20">
              <ul class="social-icons">
                <div class="bdsharebuttonbox">
                  <a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone"></a><a href="#" class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq" data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a href="#" class="bds_weixin" data-cmd="weixin"></a></div>
                <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"这里的东西太好吃了,都是生态环保的湖南宁乡土特产,你也来看看吧！","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16","tag":"pic1"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 col-sm-3">
            <div class="row margin-top-112" ng-init="interested=true">
              <div class="col-sm-6 col-lg-6" ng-if="!interested">
                <i class="fa fa-heart-o fa-2x">未关注</i>
              </div>
              <div class="col-sm-6 col-lg-6" ng-if="interested">
                <i class="fa fa-heart fa-2x">已关注</i>
              </div>
              <div class="col-sm-2 col-lg-2"><a href="javascript:void(0)" ng-class="{'fa':true,'fa-toggle-off':!interested,'fa-toggle-on':interested,'fa-2x':true}"  ng-click="interested=!interested"></a></div>
            </div>
          </div>
        </div>

        <div class="row margin-bottom-40">
          <div class="product-page-content">
            <ul id="myTab" class="nav nav-tabs">
              <li ng-class="{'active':!activeEvaluate}"><a href="#Description" data-toggle="tab">商品介绍</a></li>
              <li><a href="#Information" data-toggle="tab">规格参数</a></li>

              <li ng-class="{'tour-step2':true,'active':activeEvaluate}"><a href="#Reviews" data-toggle="tab">商品评论({{_page.totalElements}})</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
            <div ng-class="{'tab-pane fade':true,'in active':!activeEvaluate}" id="Description">
                <div ng-if="!productSeries.productBrochures">
                  <div class="datasheet-features-type">抱歉，暂无商品介绍宣传册。</div>
                </div>
                <img ng-if="productSeries.productBrochures &&productSeries.productBrochures === 'img' " ng-src="${path}/{{productSeries.productBrochures.url}}"/>
                <iframe ng-if="productSeries.productBrochures &&productSeries.productBrochures === 'page'" src="${productSeries.productBrochures.url}"  scroling="no"  width="100%" height="2600px;" name="float" frameborder="0"></iframe>
              </div>
              <div class="tab-pane fade" id="Information">
                <table class="datasheet">
                  <tr>
                    <th colspan="2">规格参数</th>
                      <tr ng-if="!productSeries.instructionManual">
                        <td class="datasheet-features-type" colspan="2">抱歉，暂无规格参数说明。</td>
                  </tr>
                  <tr ng-if="productSeries.instructionManual" ng-repeat="instructionManualItem in productSeries.instructionManual">
                    <td class="datasheet-features-type">${instructionManualItem.key}：</td>
                    <td>${instructionManualItem.value}</td>
                  </tr>
                </table>
              </div>
              <div ng-class="{'tab-pane fade':true,'in active':activeEvaluate,'table-responsive':true}" id="Reviews">
                <table ng-repeat="productEvaluate in _page.content" ng-class="{'table':true,'bg-info':true}">
                    <tr ng-init="showEvaluate=false">
                      <td width="16%">
                        <strong class="fa fa-user">
                          <span ng-if="productEvaluate.anonymous">匿名用户</span>
                          <span ng-if="!productEvaluate.anonymous">{{productEvaluate.order.user.name}}</span>
                        </strong>
                      </td>
                      <td>
                        <em class="fa fa-clock-o">发表于{{productEvaluate.date | date:'yyyy-MM-dd hh:mm'}}</em>
                      </td>
                      <td ng-init="ratingVal=productEvaluate.grade">
                        <div star rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="true"></div>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <b class="fa fa-file-text-o">{{productEvaluate.content}}</b>
                      </td>
                      <td>
                        <div class="review-item-image" ng-if="productEvaluate.pictures">
                          <img ng-repeat="picture in productEvaluate.pictures" class="img-responsive img-ico-md" ng-src="${path}/{{picture.picture}}"/>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td></td><td></td>
                      <td>
                        <a class="fa fa-thumbs-o-up pull-right" href="javascript:void(0)" data-ng-click="toPraise(productEvaluate)">
                          赞
                          <span ng-if="!productEvaluate.praises &&productEvaluate.praises.length==0">(0)</span>
                          <span ng-if="productEvaluate.praises">({{productEvaluate.praises.length}})</span>
                        </a>
                        &nbsp;
                        <a class="fa fa-reply pull-right" href="javascript:void(0)" data-ng-click="showEvaluate=!showEvaluate;">
                          回复<span ng-if="!productEvaluate.replies.length">(0)</span>
                          <span ng-if="productEvaluate.replies.length">({{productEvaluate.replies.length}})</span>
                        </a>
                      </td>
                    </tr>
                  <tr ng-show="showEvaluate">
                    <td colspan="2">
                      <textarea ng-model="reply.content" name="content" placeholder="回复内容(小于200个字符)" rows="1" style="width: 100%;" class="form-control" required="true" maxlength="200"></textarea>
                    </td>
                    <td>
                      <input type="button" ng-disabled="!reply.content ||reply.content.length==0"  ng-click="toReply(productEvaluate,reply)"
                             ng-class="{'btn btn-small btn-primary pull-right':true,'fa fa-ban':(!reply.content||reply.content.length==0)}" value="回复">
                    </td>
                  </tr>
                    <tr ng-show="showEvaluate">
                      <td colspan="3" class="table-responsive">
                        <table class="table table-striped table-hover">
                          <tr ng-repeat="evaluateReply in productEvaluate.replies">
                            <td width="16%" class="text-right">回复:</td>
                            <td>
                              <p class="font-size-12">{{evaluateReply.content}}</p>
                            </td>
                            <td width="25%" class="text-right" style="vertical-align: bottom">
                              <small>by:<i class="fa fa-user"></i><strong></strong>{{evaluateReply.replyUser.name}} {{evaluateReply.date | date:'yyyy-MM-dd hh:mm'}}</small>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>

                </table>
                  <div class="row" style="padding-bottom:20px;">
                    <tm-pagination conf="paginationConf"></tm-pagination>
                  </div>
              </div>
            </div>
          </div>

        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>
<div class="modal fade active" id="evaluateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <form name="evaluateForm" id="evaluateForm" action="${path}/order/evaluate/product" novalidate="novalidate" method="POST" enctype="multipart/form-data">

  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h2 class="modal-title">评论</h2>
      </div>
      <div class="modal-body">
          <fieldset>
            <div class="form-group has-feedback">
              <div class="row">
                <label class="col-lg-2 control-label">满意度<span class="require">*</span></label>

                <div class="col-lg-8 has-success">
                  <input type="range" value="3" step="1" id="backing0" name="grade"/>
                  <div class="rateit" data-rateit-backingfld="#backing0" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label class="col-lg-2 control-label">评价内容 <span class="require">*</span></label>
                <div class="col-lg-8 has-success">
                  <textarea name="content" class="form-control text-area" rows="6"  placeholder="请发表您的评价(少于200个字符)" required="true" maxlength="200"></textarea>
                </div>
              </div>
              </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label  class="col-lg-2 control-label">上传图片</label>
                <div class="col-lg-8 has-success">
                  <input name="files" id="file-5" class="file"  data-preview-class="bg-info" type="file"
                         data-max-file-size="100"  data-max-file-count="3"
                         multiple data-preview-file-type="any" data-show-upload="false">
                  <input type="hidden" value="${order.id}" name="orderId"/>
                  <input type="hidden" value="${productSeries.id}" name="productSeriesId "/>
                </div>
              </div>
            </div>
            <div class="form-group has-feedback">
              <div class="row">
                <label  class="col-lg-2 control-label">匿名评论</label>
                <div class="col-lg-8 col-sm-8 form-inline">
                  <input type="checkbox" name="anonymous" value="true" />
                </div>
              </div>
            </div>
          </fieldset>
      </div>
      <div class="modal-footer">
        <div class="col-lg-6 col-sm-6"></div>
        <div class="col-lg-4 col-sm-4">
          <button type="submit" class="btn btn-primary" >提交</button>
          <button type="button" class="btn btn-primary modal-close" data-dismiss="modal" aria-hidden="true">关闭</button>
        </div>
      </div>
    </div>
  </div>
  </form>

</div>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
