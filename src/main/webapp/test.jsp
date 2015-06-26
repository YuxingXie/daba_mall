<!DOCTYPE html>
<%@page contentType="text/html; charset=utf-8" %>
<html >
<head>
</head>
<body>
<h2>Hello Mongo!</h2>
<h3>I have a try to do some CRUD operations on mongoDB!</h3>
<ul>
    <li><a href="insert_input.do">insert</a></li>
    <li><a href="test/find_all.do">findAll</a></li>
    <li><a href="find_input.do">find equals</a></li>
    <li><a href="find_ne_input.do">find not equals</a></li>
    <li><a href="test/find_in_input.do">find in</a></li>
    <li><a href="test/find_not_in_input.do">find not in</a></li>
    <li><a href="test/find_is_null.do">find height is null</a></li>
    <li><a href="test/find_by_regex.do">find by regex</a></li>
    <li><a href="test/find_in_array.do">find "interest" include "golf"</a></li>
    <li><a href="find_range_input.do">findRange</a></li>
    <li><a href="test/find_ref.do">find reference</a></li>
    <li><a href="test/find_page.do">find for pages</a></li>
    <li><a href="test/run_command.do">run command</a></li>
</ul>
<h3>表单属性中文</h3>
<form action="test/input_chn.do"><input name="json" type="text" value="{'中国名':'谢宇星'}"/><input type="submit" value="submit"/> </form>
</body>
</html>
