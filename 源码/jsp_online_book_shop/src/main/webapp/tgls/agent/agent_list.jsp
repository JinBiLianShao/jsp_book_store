<%@page import="com.zhy.beans.User"%>
<%@page import="com.zhy.factory.DaoFactory"%>
<%@page import="com.zhy.tools.DBUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta name="renderer" content="webkit">
<!--国产浏览器高速模式-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="爱看图书" />
<!-- 作者 -->
<meta name="revised" content="爱看图书.v3, 2019/05/01" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<title>爱看图书出品</title>

<!-- 公共样式 开始 -->
<link rel="stylesheet" type="text/css" href="../../css/base.css">
<link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
<script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
<script type="text/javascript" src="../../layui/layui.js"></script>
<!-- 滚动条插件 -->
<link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
<script src="../../framework/jquery-ui-1.10.4.min.js"></script>
<script src="../../framework/jquery.mousewheel.min.js"></script>
<script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
<script src="../../framework/cframe.js"></script>
<!-- 仅供所有子页面使用 -->
<!-- 公共样式 结束 -->

</head>

<%
	List<User> users = DaoFactory.getUserDAO().getAllUsers();
	request.setAttribute("users", users);
%>
<body>
	<div class="cBody">
		<div class="console">

			<script>
				layui.use('form', function() {
					var form = layui.form;

					//监听提交
					form.on('submit(formDemo)', function(data) {
						layer.msg(JSON.stringify(data.field));
						return false;
					});
				});
			</script>
		</div>

		<table class="layui-table">
			<thead>
				<tr>
					<th>用户编号</th>
					<th>用户邮箱</th>
					<th>用户昵称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${users }" var="user">
				<tr>
					<input type="hidden"  value="${user.username }"/>
					<td>${user.id }</td>
					<td>${user.username }</td>
					<td>${user.nickname }</td>
					
					<td>
						<a class="layui-btn layui-btn-xs"   id="${user.username }" href="agent_update.jsp?username=${user.username }">修改</a> <a
						class="layui-btn layui-btn-xs"  href="${pageContext.request.contextPath }/UserServlet?method=delete&id=${user.id}">删除</a>
					</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	
		</script>
	</div>
</body>

</html>