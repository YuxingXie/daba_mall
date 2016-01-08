
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="f" uri="/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<div class="container" ng-controller="productSeriesCtrl">
      <div >
          <ul class="breadcrumb">
              <li><a href="${path}">首页</a></li>
              <li><a href="">商店</a></li>
              <li class="active">物品详情</li>
          </ul>
          <div class="row bg-info margin-bottom-40">
          <div class="col-lg-4 col-sm-4">
              <form name="form">
                <div class="row padding-left-30 padding-top-30">
                    <div class="easyzoom easyzoom--adjacent easyzoom--with-thumbnails">
                        <a ng-href="${path}/{{productSelected.productSeries.pictures[0].bigPicture}}">
                            <img ng-src="${path}/{{productSelected.productSeries.pictures[0].picture}}" width="320" height="180"/>
                        </a>
                    </div>
                    <ul class="thumbnails easyzoom-thumbnails">
                        <li ng-repeat="picture in productSelected.productSeries.pictures">
                            <a ng-href="${path}/{{picture.bigPicture}}" data-standard="${path}/{{picture.picture}}">
                                <img ng-src="${path}/{{picture.iconPicture}}"  />
                            </a>
                        </li>
                    </ul>
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
                <div class="col-sm-3 col-lg-3 text-left padding-left-0 margin-left-0">{{_page.totalElements}}条评论</div>
                <div class="col-sm-3 col-lg-3 text-left padding-left-0 margin-left-0">
                    <c:if test="${not empty orderId}">
                      <a ng-click="isEvaluated('${orderId}',productSeries.id)" href="javascript:void(0)" class="tour-step1"
                         <%--data-toggle="modal" data-target="#evaluateModal"--%>
                              >发表评论</a>
                    </c:if>
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
          <div class="col-lg-4 col-sm-4 pull-left">

            <div class="row margin-top-20">
              <div class="col-sm-6 col-lg-6" ng-if="!$parent.interested[productSeries.id]">
                <i class="fa fa-heart-o fa-2x">未关注</i>
              </div>
              <div class="col-sm-6 col-lg-6" ng-if="$parent.interested[productSeries.id]">
                <i class="fa fa-heart fa-2x color-red">已关注</i>
              </div>
              <div class="col-sm-2 col-lg-2">
                  <a href="javascript:void(0)" ng-class="{'fa':true,'fa-toggle-off':!$parent.interested[productSeries.id],'fa-toggle-on':$parent.interested[productSeries.id],'fa-2x':true}" ng-click="toggleInterest(productSeries.id)"></a>
              </div>
            </div>
              <div class="row margin-top-10 input-group">
                  <div class="input-group form-inline margin-top-10" ng-repeat="productProperty in productSelected.productSeries.productProperties">
                      <span class="input-group-btn"><button class="btn btn-primary disabled">{{productProperty.propertyName}}</button></span>
                      <select  ng-model="$parent.productSelected.productPropertyValueList[$index]"
                               required="true" class="form-control form-control-inline"
                               ng-options="productPropertyValue.value for productPropertyValue in productProperty.propertyValues">
                      </select>

                  </div>
              </div>
              <div class="row margin-top-10">
                  <div class="col-lg-4 col-sm-4 input-group">
                      <span class="input-group-btn"><button class="btn btn-primary disabled">数量</button></span>
                      <input type="number" min="1" class="form-control" ng-model="productSelected.amount" placeholder="" style="width: 90px;"/>
                  </div>
              </div>
              <div class="row margin-top-10">
                  <div class="col-lg-4 col-sm-4 pull-left">
                      <button class="btn btn-primary add2cart fa fa-shopping-cart" type="button" data-ng-click="add2cart()">添加到购物车</button>

                  </div>
              </div>
          </div>
        </div>
          <ul id="myTab" class="nav nav-tabs">
              <li ng-class="{'active':!activeEvaluate}"><a href="#Description" data-toggle="tab">商品介绍</a></li>
              <li><a href="#Information" data-toggle="tab">规格参数</a></li>
              <li ng-class="{'tour-step2':true,'active':activeEvaluate}"><a href="#Reviews" data-toggle="tab">商品评论({{_page.totalElements}})</a></li>
            </ul>
          <div id="myTabContent" class="tab-content">
              <div ng-class="{'tab-pane fade':true,'in active':!activeEvaluate}" id="Description">
                <div ng-if="!productSeries.productBrochures">
                  <div class="fa fa-warning fa-2x margin-top-20 margin-bottom-20">抱歉，暂无商品介绍宣传册。</div>
                </div>
                <img ng-if="productSeries.productBrochures &&productSeries.productBrochures.type === 'img'" ng-src="{{productSeries.productBrochures.url}}"/>
                <iframe ng-if="productSeries.productBrochures &&productSeries.productBrochures.type === 'page'" ng-src="{{trustSrc(productSeries.productBrochures.url)}}"
                        allowfullscreen frameborder="0"  width="100%" height="2600px;" frameborder="0"></iframe>
              </div>
              <div class="tab-pane fade table-responsive" id="Information">
                <table class="datasheet">
                  <tr>
                    <th colspan="2">规格参数</th>
                      <tr ng-if="!productSeries.instructionManual">
                        <td class="fa fa-warning fa-2x" colspan="2">抱歉，暂无规格参数说明。</td>
                  </tr>
                  <tr ng-if="productSeries.instructionManual" ng-repeat="instructionManualItem in productSeries.instructionManual">
                    <td class="datasheet-features-type">${instructionManualItem.key}：</td>
                    <td>${instructionManualItem.value}</td>
                  </tr>
                </table>
              </div>
              <div ng-class="{'tab-pane fade':true,'in active':activeEvaluate}" id="Reviews">

                    <div ng-if="!_page.content||!_page.content.length" class="fa fa-warning fa-2x margin-top-20 margin-bottom-40">暂无评论!</div>
                    <div ng-repeat="productEvaluate in _page.content" class='margin-top-20'>
                        <div class="row padding-top-10 bg-light-primary padding-bottom-10 font-size-17-5" ng-init="showEvaluate=false">
                            <div class="col-lg-2 col-sm-2">
                                <strong ng-class="{'fa fa-user':!productEvaluate.anonymous,'fa fa-user-secret':productEvaluate.anonymous}">
                                    <span ng-if="productEvaluate.anonymous">匿名用户</span>
                                    <span ng-if="!productEvaluate.anonymous">{{productEvaluate.order.user.name}}</span>
                                </strong>
                            </div>
                            <div class="col-sm-3 col-lg-3">
                                发表于<i class="fa fa-clock-o"></i>{{productEvaluate.date | date:'yyyy-MM-dd'}}
                            </div>
                            <div class="col-sm-3 col-lg-3" ng-init="$parent.ratingVal=productEvaluate.grade">
                                <div star rating-value="$parent.ratingVal" max="$parent.max" on-hover="$parent.onHover" on-leave="$parent.onLeave" readonly="true"></div>
                            </div>
                        </div>
                        <div class="row padding-top-10 bg-light-blue">
                            <div class="col-sm-1 col-lg-1"></div>
                            <div class="col-sm-9 col-lg-9">
                                <b class="fa fa-file-text-o">{{productEvaluate.content}}</b>
                            </div>

                        </div>
                        <div class="row padding-top-10 bg-light-blue">
                            <div class="col-sm-1 col-lg-1"></div>
                            <div class="col-sm-10 col-lg-10">
                                <a ng-repeat="picture in productEvaluate.pictures" href="javascript:void(0)">
                                    <img class="img-responsive img-ico-md inline-block" ng-src="${path}/{{picture}}" onClick="$('#imageZoom').attr('src', $(this).attr('src')); $('#imageZoomModal').modal('show');"/></a>
                            </div>

                        </div>
                        <div ng-class="{'row bg-light-blue':true,'padding-bottom-10':!showEvaluate}">
                            <div class="col-lg-2 col-sm-2 pull-right">
                                <a ng-class="{'fa fa-plus-circle':!showEvaluate,'fa fa-minus-circle':showEvaluate} " href="javascript:void(0)" data-ng-click="showEvaluate=!showEvaluate;">
                                    回复<span ng-if="!productEvaluate.replies.length">(0)</span>
                                    <span ng-if="productEvaluate.replies.length">({{productEvaluate.replies.length}})</span>
                                </a> &nbsp;
                                <a class="fa fa-thumbs-o-up" href="javascript:void(0)" data-ng-click="toPraise(productEvaluate)">
                                    赞<span ng-if="!productEvaluate.praises &&productEvaluate.praises.length==0">(0)</span>
                                    <span ng-if="productEvaluate.praises">({{productEvaluate.praises.length}})</span>
                                </a>

                            </div>
                        </div>
                        <div ng-class="{'row bg-light-blue':true,'padding-top-10 padding-bottom-10':showEvaluate}" ng-show="showEvaluate">
                            <div class="col-lg-1 col-sm-1"></div>
                            <div class="col-lg-10 col-sm-10 input-group">
                                <textarea ng-model="reply.content" name="content" placeholder="回复内容(小于200个字符)"
                                          rows="1" style="width: 100%;" class="form-control" required="true" maxlength="200"></textarea>

                                <span class="input-group-btn">
                                    <button type="button" ng-disabled="!reply.content ||reply.content.length==0"  ng-click="toReply(productEvaluate,reply)"
                                        ng-class="{'btn btn-danger fa fa-reply':true}">回复</button>
                                    </span>
                            </div>
                        </div>

                        <div ng-show="showEvaluate" ng-repeat="evaluateReply in productEvaluate.replies" class="row table-bordered bg-info">
                            <div ng-class="{'col-sm-1 col-lg-1 text-right':true}"><p>&nbsp;</p></div>
                            <div ng-class="{'col-lg-8 col-sm-8':true}">
                                <p><i>{{evaluateReply.content}}</i></p>
                            </div>
                            <div ng-class="{'col-lg-3 col-sm-3 text-right':true}" style="vertical-align: bottom">
                                <p><small>回复by:<i class="fa fa-user"></i><strong></strong>{{evaluateReply.replyUser.name}} {{evaluateReply.date | date:'yyyy-MM-dd'}}</small></p>
                            </div>
                        </div>
                    </div>
                  <div class="row pull-right" style="padding-bottom:20px;">
                    <tm-pagination conf="paginationConf"></tm-pagination>
                  </div>
              </div>
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
                               data-max-file-size="3000"  data-max-file-count="3"
                               multiple data-preview-file-type="any" data-show-upload="false">
                        <input type="hidden" value="${orderId}" name="orderId"/>
                        <input type="hidden" value="{{productSeries.id}}" name="productSeriesId "/>{{productSeries.id}}
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
      <div class="modal fade active" id="imageZoomModal" tabindex="-1" role="dialog" aria-labelledby="imageZoomModal" aria-hidden="true">
          <div class="modal-dialog">
              <img src="" id="imageZoom">
          </div>
    </div>
</div>
