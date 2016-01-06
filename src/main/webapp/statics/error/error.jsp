<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"  isELIgnored="false"%>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="webRoot" value="<%=request.getContextPath() %>"/><c:if test="${webRoot eq '/'}"><c:set var="webRoot" value=""/></c:if>
<html>
<head>
	<title>Error Page</title>
	<link href="${webRoot}/statics/assets/plugins/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${webRoot}/statics/assets/plugins/bootstrap-3.3.0/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${webRoot}/statics/assets/css/style.css" rel="stylesheet" type="text/css">
	<script language="javascript">
		function showDetail()
		{
			var elm = document.getElementById('detail_system_error_msg');
			if(elm.style.display == '') {
				elm.style.display = 'none';
			}else {
				elm.style.display = '';
			}
		}
	</script>
</head>
<%
	String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
	LogFactory.getLog(requestUri).error(exception.getMessage(), exception);
%>
<body class="container">
	<div class="row margin-top-20">
		<div class="col-sm-6 col-lg-6">
			<img alt="system internal error" src="${webRoot}/statics/error/404/3/error.gif" class="margin-top-20 img-responsive"/>
		</div>
	</div>
	<div class="row margin-top-20"><h3>对不起,发生系统内部错误,不能处理你的请求</h3></div>
	<%--<b>错误信息:</b> <%=exception.getMessage()%>--%>
	<div class="row margin-top-20"><a href="${webRoot}" class="fa fa-home fa-2x margin-top-20">返回首页</a></div>
	<div class="row margin-top-20">
		<div><i class="fa fa-smile-o margin-left-10 font-size-13-5">通常情况下</i></div>
		<ul class="list-unstyled margin-left-10">
			<li class="margin-top-10"><i class="fa fa-dot-circle-o"></i>您可能输入了错误的地址</li>
			<li class="margin-top-10"><i class="fa fa-dot-circle-o"></i>您可能登录超时了</li>
			<li class="margin-top-10"><i class="fa fa-dot-circle-o"></i>我们的攻城狮可能犯错了</li>
			<li class="margin-top-10"><i class="fa fa-dot-circle-o"></i>无论如何，您可以点击<a href="#" onclick="showDetail();">这里</a>看个究竟</li>
		</ul>
	</div>
	<div id="detail_system_error_msg" style="display:none" class="row">
		<code class="text-justify"><%exception.printStackTrace(new java.io.PrintWriter(out));%></code>
	</div>
</body>
</html>