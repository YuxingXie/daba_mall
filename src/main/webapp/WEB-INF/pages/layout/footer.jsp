<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!-- BEGIN STEPS -->
<div class="steps3 steps3red">
  <div class="container">
    <div class="row">
      <div class="col-md-4 steps3-col">
        <i class="fa fa-truck"></i>

        <div>
          <h2>品质保证</h2>
          <em>我们只生产生态绿色食品</em>
        </div>
        <span>&nbsp;</span>
      </div>
      <div class="col-md-4 steps3-col">
        <i class="fa fa-gift"></i>

        <div>
          <h2>商务合作</h2>
          <em>我们的强大需要您的支持</em>
        </div>
        <span>&nbsp;</span>
      </div>
      <div class="col-md-4 steps3-col">
        <i class="fa fa-phone"></i>

        <div>
          <h2>87654321</h2>
          <em>24小时竭诚为您服务热线</em>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- END STEPS -->

<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
  <div class="container">
    <hr>
    <div class="row">
      <!-- BEGIN BOTTOM ABOUT BLOCK -->
      <div class="col-md-3 col-sm-6 pre-footer-col">
        <h2>关于我们</h2>

        <p>
          长沙大坝生态农业科技有限公司组建于2013年，注册资本1000万元，现有固定员工180人。公司致力于现代生态高效农业产业化集群开发，着力打造全民创业、万众创新的平台，着力解决千家万户的"菜篮子"、"米袋子"、"果盘子"所需。</p>

        <p>
          公司拥有"一中心，二平台，三基地"。即特色农产品展示中心；特色农产品研发孵化平台，特色农产品信息交流平台；长沙大坝生态金棋现代农业示范基地，长沙大坝生态黄材水库有机野生鱼类养殖基地，长沙大坝生态干鱼加工基地。</p>
      </div>
      <!-- END BOTTOM ABOUT BLOCK -->
      <!-- BEGIN BOTTOM INFO BLOCK -->
      <div class="col-md-3 col-sm-6 pre-footer-col">
        <h2>企业动态</h2>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i> <a href="#">公司崇尚的文化</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">大坝精神</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">我们有一支优秀的团队</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">企业历史</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">打造特色农产品信息交流平台</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">人民出版社出版大坝书籍</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">中央电视访谈大坝团队成功经历</a></li>
        </ul>
      </div>
      <!-- END INFO BLOCK -->
      <!-- BEGIN TWITTER BLOCK -->
      <div class="col-md-3 col-sm-6 pre-footer-col">
        <h2>媒体报道</h2>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i> <a href="#">大坝生态农业在美国上市</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">挺近世界500强的艰辛历程</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">成为国内首支团队完整的电商企业</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">荣获优秀企业称号</a></li>
          <li><i class="fa fa-angle-right"></i> <a href="#">公司年营业额占据福布斯榜首</a></li>
        </ul>
      </div>
      <!-- END TWITTER BLOCK -->
      <!-- BEGIN BOTTOM CONTACTS -->
      <div class="col-md-3 col-sm-6 pre-footer-col">
        <h2>联系我们</h2>
        <address class="margin-bottom-40">
          联系电话：0731-87654321<br>
          企业QQ：88888888<br>
          公司微信：weixin_daba<br>
          电子邮件: <a href="mailto:info@metronic.com">info@metronic.com</a><br>
        </address>
      </div>
      <!-- END BOTTOM CONTACTS -->
    </div>
    <hr>


  </div>
</div>


<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer padding-top-15">
  <div class="container">
    <div class="row">
      <!-- BEGIN COPYRIGHT -->
      <div class="col-md-6 col-sm-6 padding-top-10">
        www.daba.com2015&copy; 湘ICP备88888888号-8
      </div>
      <!-- END COPYRIGHT -->
      <!-- BEGIN PAYMENTS -->
      <div class="col-md-6 col-sm-6">
        <ul class="list-unstyled list-inline pull-right margin-bottom-15">
          <li><img src="${path}/statics/assets/img/payments/american-express.jpg"
                   alt="We accept American Express" title="We accept American Express"></li>
          <li><img src="${path}/statics/assets/img/payments/MasterCard.jpg" alt="We accept MasterCard"
                   title="We accept MasterCard"></li>
          <li><img src="${path}/statics/assets/img/payments/PayPal.jpg" alt="We accept PayPal"
                   title="We accept PayPal"></li>
          <li><img src="${path}/statics/assets/img/payments/visa.jpg" alt="We accept Visa"
                   title="We accept Visa"></li>
        </ul>
      </div>
      <!-- END PAYMENTS -->
    </div>
  </div>
</div>
<!-- END FOOTER -->

