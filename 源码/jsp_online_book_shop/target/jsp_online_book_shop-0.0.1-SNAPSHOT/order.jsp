<%@page import="com.zhy.beans.User"%>
<%@page import="com.zhy.beans.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>爱看图书 - 读最好的书</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="style.css">
<!-- responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr css -->
<script src="js/jquery-3.4.0.min.js"></script>
<script src="js/vendor/modernizr-2.8.3.min.js"></script>

</head>

<body class="cart">

	<%@include file="header.jsp"%>
	<%
		User user = (User) session.getAttribute("user");
		String name = user.getUsername();
		List<Order> orders = DaoFactory.getOrderDao().getOrdersByUsername(name);
		request.setAttribute("orders", orders);
	%>
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a>首页</a></li>
							<li><a class="active">我的订单</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- entry-header-area-start -->
	<div class="entry-header-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="entry-header-title"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->
	<!-- cart-main-area-start -->
	<div class="cart-main-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th>订单号</th>
										<th class="product-name">商品名</th>
										<th class="product-price">价格</th>
										<th class="product-price">收货人</th>
										<th class="product-price">收货地址</th>
										<th class="product-price">电话</th>
										<th class="product-price">备注</th>
										<th class="product-quantity">数量</th>
										<th class="product-subtotal">总计</th>
										<th>状态</th>
										<th class="product-subtotal">操作</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<c:forEach items="${orders }" var="order">
											<tr>
												<td>${order.id }</td>
												<td class="product-name">${order.name }</td>
												<td class="product-price">${order.price }元</td>
												<td class="product-price">${order.shou }</td>
												<td class="product-price">${order.address }</td>
												<td class="product-price">${order.phone }</td>
												<td class="product-price">${order.info }</td>
												<td class="product-quantity">${order.quantity }</td>
												<td class="product-subtotal">${order.total}</td>
												<td class="product-subtotal"><c:if
														test="${ order.status eq 0 }">
								等待发货
							</c:if> <c:if test="${ order.status eq 1 }">
								等待收货
							</c:if> <c:if test="${ order.status eq 2 }">
								订单完成
							</c:if></td>
												<td class="product-subtotal"><c:if
														test="${ order.status eq 1 }">
														<a class="layui-btn layui-btn-xs" id="${order.id }"
															href="${pageContext.request.contextPath }/OrderServlet?method=shouhuo&id=${order.id}">收货</a>
													</c:if></td>
											</tr>
										</c:forEach>

									</tr>

								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<!-- cart-main-area-end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- meanmenu js -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="js/wow.min.js"></script>
	<!-- jquery.parallax-1.1.3.js -->
	<script src="js/jquery.parallax-1.1.3.js"></script>
	<!-- jquery.countdown.min.js -->
	<script src="js/jquery.countdown.min.js"></script>
	<!-- jquery.flexslider.js -->
	<script src="js/jquery.flexslider.js"></script>
	<!-- chosen.jquery.min.js -->
	<script src="js/chosen.jquery.min.js"></script>
	<!-- jquery.counterup.min.js -->
	<script src="js/jquery.counterup.min.js"></script>
	<!-- waypoints.min.js -->
	<script src="js/waypoints.min.js"></script>
	<!-- plugins js -->
	<script src="js/plugins.js"></script>
	<!-- main js -->
	<script src="js/main.js"></script>
</body>
</html>
