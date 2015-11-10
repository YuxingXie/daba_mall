<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>
<html>
<head>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.2 基础排版</title>
    <!-- BootStrap -->
    <link href="${path}/plugins/bootstrap-3.3.0/dist/css/bootstrap.css" rel="stylesheet" media="screen"/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/4.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${path}/plugins/jquery-1.8.3.min.js"></script>
    <script src="${path}/plugins/bootstrap-3.3.0/dist/js/bootstrap.js"></script>
    <script src="${path}/plugins/bootstrap-3.3.0/js/alert.js"></script>

</head>
<body>
<h3>标题</h3>

<div class="container">
    <h1>h1
        <small>h1</small>
    </h1>
    <h2>h2</h2>

    <h3>h3</h3>
    <h4>h4</h4>
    <h5>h5</h5>
    <h6>h6</h6>
</div>
<div class="container">
    <span class="h1">class h1<small>class h1</small></span><br/>
    <span class="h2">class h2</span><br/>
    <span class="h3">class h3</span><br/>
    <span class="h4">class h4</span><br/>
    <span class="h5">class h5</span><br/>
    <span class="h6">class h6</span><br/>
</div>
<h3>页面主题</h3>

<div class="container">
    <p class="lead">This is a lead paragraph,so the words are different.</p>

    <p>This is a normal paragraph,so the words are normal.</p>
</div>
<h3>强调文本</h3>

<div class="container">
    <small>small</small>
    <strong>strong</strong>
    <em>em</em>
    <cite>cite</cite>

    <p class="text-left">text left</p>

    <p class="text-center">text center</p>

    <p class="text-right">text right</p>

    <p class="text-justify">text justify</p>
</div>

<h3>缩略语</h3>

<div class="container">
    <abbr title="这是一句缩略语">鼠标移到我这儿来</abbr>
</div>
<h3>地址元素</h3>

<div class="container">
    <address>
        <strong>大坝生态农业科技有限公司</strong><br/>
        湖南省宁乡县玉潭镇<br/>
        新康路华都丽景17栋
        <abbr title="电话">电话</abbr> 0731-78888888
    </address>
</div>

<h3>表格</h3>

<div class="container">
    <table class="table table-bordered table-responsive">
        <thead>
        <tr>
            <th>name</th>
            <th>address</th>
            <th>tel</th>
            <th>married</th>
            <th>birthday</th>
            <th>job</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
            <th>xx</th>
        </tr>
        </thead>
        <tbody>
        <tr class="active">
            <td>zx</td>
            <td>dfdsfdsfdfsdf</td>
            <td>ggffdfgfgfgfg</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="bg-success">
            <td>zx</td>
            <td>dfdsfdsfdfsdf</td>
            <td>ggffdfgfgfgfg</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="bg-info">
            <td>zx</td>
            <td>dfdsfdsfdfsdf</td>
            <td>ggffdfgfgfgfg</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="bg-warning">
            <td>zx</td>
            <td>dfdsfdsfdfsdf</td>
            <td>ggffdfgfgfgfg</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="bg-danger">
            <td>zx</td>
            <td>dfdsfdsfdfsdf</td>
            <td>ggffdfgfgfgfg</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
<h3>表单</h3>

<div class="container">
    <form class="form-group">
        <fieldset>
            <legend>用户注册</legend>
            <div class="form-group has-success has-feedback">
                <label class="control-label">姓名：</label>
                <label class="control-label" for="inputWarning">invalid name</label>
                <input type="text" class="form-control" id="inputWarning"/>
                <span class="glyphicon glyphicon-ok form-control-feedback"></span>
            </div>
                地址：<input type="text" class="form-control input-group-lg"/>
                <label>性别：</label>
                <select class="form-control">
                <option>男</option>
                <option>女</option>
            </select>
                <label>长相：</label>
                <input type="checkbox"/>丑
                <input type="checkbox"/>帅


        </fieldset>
        <button type="submit" class="btn btn-default">submit</button>
    </form>
</div>
http://tp4.sinaimg.cn/5138058543/180/5727163016/1
<h3>图片</h3>
<img src="http://tp4.sinaimg.cn/5138058543/180/5727163016/1" class="img-responsive"/>
<img src="http://tp4.sinaimg.cn/5138058543/180/5727163016/1" class="img-circle"/>
<img src="http://tp4.sinaimg.cn/5138058543/180/5727163016/1" class="img-rounded"/>
<img src="http://tp4.sinaimg.cn/5138058543/180/5727163016/1" class="img-thumbnail"/>
</body>
</html>
