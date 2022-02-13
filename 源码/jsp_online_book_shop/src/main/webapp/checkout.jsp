<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<script src="js/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="js/order.address.js"></script>
</head>
<body class="checkout">
	<%@ include file="header.jsp"%>
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a>首页</a></li>
							<li><a class="active">订单</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- checkout-area-start -->
	<div class="checkout-area mb-70">
		<div class="container">
			<div class="row">
				<form action="${pageContext.request.contextPath }/OrderServlet?method=add" method="post">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
						<div class="checkbox-form">
							<h3>送货地址</h3>
							<div class="row">

								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="checkout-form-list">
										<label>收货人姓名 <span class="required">*</span></label> <input type="text" placeholder=""
											name="shou" id="receiveName"> <span style="color: red" id="name.info"></span>
									</div>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="checkout-form-list">
										<label>地址<span class="required">*</span></label> <input type="text" placeholder="具体地址"
										name="address"	id="fullAddress"> <span style="color: red" id="address.info"></span>
									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="checkout-form-list">
										<label>电话 <span class="required">*</span></label> <input name="phone" type="text" placeholder="请填写有效号码" id="phone">
									<span style="color: red" id="phone.info"></span>
									</div>
								</div>

							</div>
							<div class="order-notes">
								<div class="checkout-form-list">
									<label>您有什么想对商家说的吗？</label>
									<textarea name="info" rows="10" cols="30" id="checkout-mess"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
						<div class="your-order">
							<h3>你的订单</h3>
							<div class="your-order-table table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product-name">产品</th>
											<th class="product-total">总计</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="item" items="${sessionScope.shoppingCart.cartItems }">
											<tr class="cart_item">
												<td class="product-name">${item.book.name }<strong class="product-quantity">
														× ${item.quantity }</strong>
												</td>
												<td class="product-total"><span class="amount">${item.subtotalPrice }</span></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr class="order-total">
											<th>总价：</th>
											<td><strong><span class="amount">${sessionScope.shoppingCart.totalPrice }</span></strong></td>
										</tr>
									</tfoot>
								</table>
							</div>
							<div class="payment-method">

								<div class="order-button-payment">
									<input type="submit" value="付款" id="btnClientRegister">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- checkout-area-end -->


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
