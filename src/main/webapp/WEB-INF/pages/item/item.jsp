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
                    <a ng-href="${path}/statics/img/product/5649c4116f70e517dce0b22c.JPG">
                      <img ng-src="${path}/{{productSeries.pictures[img]}}" class="img-responsive"/>
                    </a>
                  </div>
                </div>
                <div class="row">
                  <span class="thumbnail img-ico-lg col-lg-2 col-sm-2" ng-repeat="picture in productSeries.pictures">
                    <a class="control-label" href="javascript:void(0)" data-ng-click="$parent.img=$index;"><img class="img-thumbnail" ng-src="${path}/{{picture}}"/></a>
                  </span>
                </div>
                <div class="row">
                  <div><i>{{productSeries.description}}</i></div>
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
                  <%--<a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone"></a><a href="#" class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq" data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a href="#" class="bds_weixin" data-cmd="weixin"></a></div>--%>
                <%--<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"这里的东西太好吃了,都是生态环保的湖南宁乡土特产,你也来看看吧！","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16","tag":"pic1"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>--%>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 col-sm-3">
            <div class="row margin-top-112" ng-init="interested=true">
              <div class="col-sm-5 col-lg-5" ng-if="!interested">
                <i class="fa fa-heart-o fa-2x">未关注</i>
              </div>
              <div class="col-sm-5 col-lg-5" ng-if="interested">
                <i class="fa fa-heart fa-2x">已关注</i>
              </div>
              <div class="col-sm-2 col-lg-2"><a href="javascript:void(0)" ng-class="{'fa':true,'fa-toggle-off':!interested,'fa-toggle-on':interested,'fa-2x':true}"  ng-click="interested=!interested"></a></div>
            </div>
          </div>
        </div>





        <div class="row margin-bottom-40">
          <div class="product-page-content">
            <ul id="myTab" class="nav nav-tabs">
              <li <c:if test="${!activeEvaluate}">class="active"</c:if>><a href="#Description" data-toggle="tab">商品介绍</a></li>
              <li><a href="#Information" data-toggle="tab">规格参数</a></li>

              <li class="tour-step2<c:if test="${activeEvaluate}"> active</c:if>"><a href="#Reviews" data-toggle="tab">商品评论(${_page.totalElements})</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade<c:if test="${!activeEvaluate}"> in active</c:if>" id="Description">
                    <c:choose>
                      <c:when test="${empty productSeries.productBrochures}">
                        <tr>
                          <td class="datasheet-features-type" colspan="2">抱歉，暂无商品介绍宣传册。</td>
                        </tr>
                      </c:when>
                      <c:otherwise>
                        <c:choose>
                          <c:when test="${productSeries.productBrochures eq 'img'}">
                              <img src="${path}/${productSeries.productBrochures.url}"/>
                          </c:when>
                          <c:when test="${productSeries.productBrochures eq 'page'}">
                              <iframe src="${productSeries.productBrochures.url}"  scroling="no"  width="100%" height="2600px;" name="float" frameborder="0"></iframe>
                          </c:when>
                          <c:otherwise></c:otherwise>
                        </c:choose>
                      </c:otherwise>
                    </c:choose>
                </div>
              <div class="tab-pane fade" id="Information">
                <table class="datasheet">
                  <tr>
                    <th colspan="2">规格参数</th>
                  </tr>
                  <c:choose>
                    <c:when test="${empty productSeries.instructionManual}">
                      <tr>
                        <td class="datasheet-features-type" colspan="2">抱歉，暂无规格参数说明。</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${productSeries.instructionManual}" var="instructionManualItem">
                        <tr>
                          <td class="datasheet-features-type">${instructionManualItem.key}：</td>
                          <td>${instructionManualItem.value}</td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </table>
              </div>
              <div class="tab-pane fade<c:if test="${activeEvaluate}"> in active</c:if>" id="Reviews">
                <!--<p>There are no reviews for this product.</p>-->

                <c:forEach var="productEvaluate" items="${_page.content}" varStatus="varStatus">
                  <div style="margin-bottom:10px;" class="table-bordered<c:if test="${varStatus.index mod 2 eq 1}"> bg-info</c:if>" ng-init="showEvaluate${productEvaluate.id}=false">
                      <div class="row">
                          <div class="col-sm-1 col-lg-1">
                            <strong class="fa fa-user">
                              <c:choose>
                                <c:when test="${productEvaluate.anonymous}">匿名用户</c:when>
                                <c:otherwise>${productEvaluate.order.user.name}</c:otherwise>
                              </c:choose>
                            </strong>
                          </div>
                          <div class="col-sm-2 col-lg-2 ">
                              <em class="fa fa-clock-o text-left"><fmt:formatDate value="${productEvaluate.date}" type="both" dateStyle="default"/></em>
                          </div>
                          <div class="col-sm-2 col-lg-2 pull-right">
                              <div class="rateit" data-rateit-value="${productEvaluate.grade}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                          </div>
                      </div>
                      <div class="row review-item-content">
                        <div class="col-lg-1 col-sm-1"></div>
                        <div class="col-lg-7 col-sm-7">
                          <pre class="fa fa-file-text-o">${productEvaluate.content}</pre>
                        </div>
                        <div class="col-lg-3 col-sm-3">
                          <div class="review-item-image">
                            <c:if test="${not empty productEvaluate.pictures}">
                              <c:forEach var="picture" items="${productEvaluate.pictures}">
                                <c:if test="${not empty picture}"><img class="img-responsive" src="${path}/${picture}"/></c:if>
                              </c:forEach>
                            </c:if>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-2 col-lg-2 pull-right">
                          <a class="fa fa-pencil-square-o" href="javascript:void(0)" data-ng-click="showEvaluate${productEvaluate.id}=!showEvaluate${productEvaluate.id};">
                            回复(<span ng-if="!evaluate${productEvaluate.id}ReplyCount">${fn:length(productEvaluate.replies)}</span>
                            <span ng-if="evaluate${productEvaluate.id}ReplyCount">{{evaluate${productEvaluate.id}ReplyCount}}</span>)
                          </a>&nbsp;
                          <a class="fa fa-thumbs-o-up" href="javascript:void(0)" data-ng-click="toPraise${varStatus.index}()">赞(<span ng-if="!evaluate${productEvaluate.id}PraiseCount&&evaluate${productEvaluate.id}PraiseCount!=0">${fn:length(productEvaluate.praises)}</span><span ng-if="!evaluate${productEvaluate.id}PraiseCount &&evaluate${productEvaluate.id}PraiseCount==0">0</span><span ng-if="evaluate${productEvaluate.id}PraiseCount">{{evaluate${productEvaluate.id}PraiseCount}}</span>)
                          </a>
                        </div>
                      </div>

                    <div class="row" ng-if="!evaluate${productEvaluate.id}Replies">
                      <c:forEach var="evaluateReply" items="${productEvaluate.replies}">
                        <div class="row" ng-show="showEvaluate${productEvaluate.id}">
                          <div class="col-sm-1 col-lg-1 text-right"><i class="fa fa-user"></i><strong>${evaluateReply.replyUser.name}</strong></div>
                          <div class="col-sm-10 col-lg-10">
                            <pre>${evaluateReply.content}</pre>
                          </div>
                        </div>
                      </c:forEach>
                      </div>
                    <div class="row" ng-if="evaluate${productEvaluate.id}Replies">
                        <div class="row" ng-show="showEvaluate${productEvaluate.id}" ng-repeat="evaluateReply in evaluate${productEvaluate.id}Replies">
                          <div class="col-sm-1 col-lg-1 text-right"><i class="fa fa-user"></i><strong>{{evaluateReply.replyUser.name}}</strong></div>
                          <div class="col-sm-10 col-lg-10">
                            <pre>{{evaluateReply.content}}</pre>
                          </div>
                        </div>
                    </div>
                    <div class="row" ng-show="showEvaluate${productEvaluate.id}">
                      <div class="col-sm-1 col-lg-1"></div>
                      <form action="${path}/product_series/evaluate/reply" method="post" id="reply${varStatus.index}Form" name="reply${varStatus.index}Form">
                        <div class="col-sm-10 col-lg-10"style="margin-bottom: 8px;">
                          <input type="hidden" ng-model="reply${varStatus.index}.parent.id" name="parentId" ng-init="reply${varStatus.index}.parent.id='${productEvaluate.id}'"/>
                          <textarea ng-model="reply${varStatus.index}.content" name="content" placeholder="回复内容(小于200个字符)" rows="1" style="width: 100%;" class="form-control" required="true" maxlength="200"></textarea>
                        </div>
                        <div class="col-sm-1 col-lg-1">
                          <a type="button" ng-disabled="reply${varStatus.index}Form.$invalid" class="btn btn-small btn-primary" data-ng-click="toReply${varStatus.index}()">回复</a>
                        </div>
                      </form>
                    </div>
                  </div>
                </c:forEach>
                <div class="row" style="padding-bottom:20px;">
                  <div id="infoPage"></div>
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
