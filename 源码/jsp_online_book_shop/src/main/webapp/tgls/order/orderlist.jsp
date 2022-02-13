<%@page import="com.zhy.beans.Category"%>
<%@page import="com.zhy.factory.DaoFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zhy.beans.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="../../framework/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
<script type="text/javascript" src="../../layui/layui.js"></script>
<!-- 滚动条插件 -->
<link rel="stylesheet" type="text/css"
	href="../../css/jquery.mCustomScrollbar.css">
<script src="../../framework/jquery-ui-1.10.4.min.js"></script>
<script src="../../framework/jquery.mousewheel.min.js"></script>
<script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
<script src="../../framework/cframe.js"></script>
<!-- 仅供所有子页面使用 -->
<!-- 公共样式 结束 -->

<style>
.layui-table img {
	max-width: none;
}
</style>

</head>
<%
List<Order> orders = DaoFactory.getOrderDao().getAllOrders();
request.setAttribute("orders", orders);
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
					<th>订单号</th>
					<th>商品名</th>
					<th>价格</th>
					<th>收货人</th>
					<th>收货地址</th>
					<th>电话</th>
					<th>备注</th>
					<th>数量</th>
					<th>总计</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${orders }" var="order">
					<tr>
						<td>${order.id }</td>
						<td>${order.name }</td>
						<td class="product-price">${order.price }元</td>
						<td class="product-price">${order.shou }</td>
						<td class="product-price">${order.address }</td>
						<td class="product-price">${order.phone }</td>
						<td class="product-price">${order.info }</td>
						<td class="product-quantity">${order.quantity }</td>
						<td class="product-subtotal">${order.total}</td>
						<td class="product-subtotal">
							<c:if test="${ order.status eq 0 }">
								等待发货
							</c:if>
							<c:if test="${ order.status eq 1 }">
								等待收货
							</c:if>
							<c:if test="${ order.status eq 2 }">
								订单完成
							</c:if>
						</td>
						<td><c:if test="${ order.status eq 0 }">
								<a class="layui-btn layui-btn-xs" id="${order.id }"
									href="${pageContext.request.contextPath }/OrderServlet?method=fahuo&id=${order.id}">发货</a>
							</c:if><a class="layui-btn layui-btn-xs"
							href="${pageContext.request.contextPath }/OrderServlet?method=delete&id=${order.id}">删除</a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div id="pages"></div>

		<script>
	/* 		layui.use('laypage', function() {
				var laypage = layui.laypage;

				//总页数大于页码总数
				laypage
						.render({
							elem : 'pages',
							count : 100,
							layout : [ 'count', 'prev', 'page', 'next',
									'limit', 'skip' ],
							jump : function(obj) {
								//					      console.log(obj)
							}
						});
			}); */
			
		

			//删除
			function delCustomList(_this) {
				layui.use([ 'form', 'laydate' ], function() {
					layer.confirm('确定要删除么？', {
						btn : [ '确定', '取消' ]
					//按钮
					}, function() {
						$(_this).parent().parent().remove();
						layer.msg('删除成功', {
							icon : 1
						});
					}, function() {
						layer.msg('取消删除', {
							time : 2000
						//20s后自动关闭
						});
					});
				});
			}
		</script>
	</div>
</body>

</html>