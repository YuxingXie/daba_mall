<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="productSeries" class="com.dabast.entity.deprecated.ProductSeries" scope="request"/>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <title></title>
    <link href="${path}/metronic_v2.0.2/admin/template/assets/plugins/typeahead/typeahead.css"/>

</head>
<body>
<form:form action="${path}/product_series/new.do" commandName="productSeries" enctype="multipart/form-data">
  name:<form:input cssClass="twitter-typeahead" id="autocompleteInput"
                   autocomplete="off" path="name" type="text" data-provide="typeahead"
                   data-source="['干鱼','腊肉','鱼肉','腊鱼']" />
    <form:errors path="name"/>
  shelvesDate:<form:errors path="shelvesDate" /><form:input path="shelvesDate" value="2012-05-03"/>
  picture:<input name="file" type="file" />
    <button type="submit">submit</button>
</form:form>
<%--<img src="${path}/img/product/5579139c584a0e0f8c7bb37a.jpg"/>--%>
<%--<script src="${path}/statics/plugins/bootstrap-3.3.0/js/bootstrap.autocomplete.js"></script>--%>
<input id="product_search" type="text" data-provide="typeahead"
       data-source='["Deluxe Bicycle", "Super Deluxe Trampoline", "Super Duper Scooter"]'/>
</div>
<script src="http://v2.bootcss.com/assets/js/bootstrap-typeahead.js"></script>
</body>
</html>