<%@page import="com.zhy.beans.Book"%>
<%@page import="com.zhy.factory.DaoFactory"%>
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

<style>
.layui-form-label {
	width: 100px;
}

.layui-input-block {
	margin-left: 130px;
}
</style>

</head>

<body>
	<%
		String id = request.getParameter("id");
		Book book = DaoFactory.getBookDao().getBookById(Integer.parseInt(id));
		request.setAttribute("book", book);
	%>
	<div class="cBody">
		<form id="addForm" class="layui-form"
			action="${pageContext.request.contextPath }/BookServlet?method=update" method="post"
			enctype="multipart/form-data">

			<div class="layui-form-item">
				<label class="layui-form-label">书本名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" value="${book.name }" required lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">书本封面</label>
				<div class="layui-upload-drag" id="cover">
					<i class="layui-icon"></i>
					<p>点击上传</p>
					<input type="file" name="cover" "/>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" value="${book.price }" required lay-verify="required|number"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">作者</label>
				<div class="layui-input-block">
					<input type="text" name="author" value="${book.author }" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">库存</label>
				<div class="layui-input-block">
					<input type="number" name="stock" value="${book.stock }" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">简介</label>
				<div class="layui-input-block">
					<textarea name="introduction"  class="layui-textarea">${book.introduction }</textarea>
				</div>
			</div>
			<%
				request.setAttribute("sc", DaoFactory.getCategoryDao().getCategoryByGrade(2));
			%>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<select name="provid" id="provid" >
						<c:forEach items="${sc }" var="c">


							<option>${c.name }</option>

						</c:forEach>

					</select>
				</div>

			</div>

			<input type="hidden" name="id" value="${book.id }">
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="submitBut">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>

		

	</div>
</body>

</html>