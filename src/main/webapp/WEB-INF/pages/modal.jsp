<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<!DOCTYPE html>


<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<!--<![endif]-->
<html lang="en">
<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>大坝生态农业</title>
    <link href="${path}/statics/assets/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet">
</head>

<body>
<button id="ab" >aaa</button>
<!--[if lt IE 9]>
<script src="${path}/statics/assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="${path}/statics/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${path}/statics/assets/plugins/bootstrap-3.3.0/dist/js/bootstrap.js" type="text/javascript"></script>

<script type="text/javascript">
 $(document).ready(function(){
     $("#ab").bind("click",function(){alert('aaabbb')});
 });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>