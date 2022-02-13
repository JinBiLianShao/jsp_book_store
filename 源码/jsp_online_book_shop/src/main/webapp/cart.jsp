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
<script type="text/javascript">

         //改变购物项数量
         function updateCart(input,id,oldvalue) {
             var quantity = input.value;
             //验证非零的正整数：^\+?[1-9][0-9]*$ 
             var reg= /^\+?[1-9][0-9]*$/;
             //判断输入是否为正整数
             if(!reg.test(quantity)) {
                 alert("请输入正确的数字！");
                 input.value = oldvalue;
                 return;
             }
             var result = true;
             if(result) {
                 window.location.href="${pageContext.request.contextPath}/CartServlet?method=update&id="+id + "&quantity=" + quantity;
             } else {
                 input.value = oldvalue;
             }
         }
     </script>
</head>

<body class="cart">

	<%@include file="header.jsp"%>
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a>首页</a></li>
							<li><a class="active">我的购物车</a></li>
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
					<div class="entry-header-title">
						<h2>购物车</h2>
					</div>
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
							<p style="color: red" id="txtLoginErr">${message1 }</p>
							<table>
								<thead>
									<tr>

										<th class="product-thumbnail">商品图</th>
										<th class="product-name">名称</th>
										<th class="product-price">价格</th>
										<th class="product-price">库存</th>
										<th class="product-quantity">数量</th>
										<th class="product-remove">删除商品</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<c:forEach items="${sessionScope.shoppingCart.cartItems }" var="cartItem">
											<tr>
												<td class="product-thumbnail"><div>
														<img src="${pageContext.request.contextPath }${cartItem.book.cover}"
															style="width: 100px; height: 150px">
													</div></td>
												<td class="product-name">${cartItem.book.name }</td>
												<td class="product-price">${cartItem.book.price }元</td>
												<td>${cartItem.book.stock }</td>
												<c:choose>
													<c:when test="${cartItem.book.stock <  cartItem.quantity}">
														<td class="product-quantity"><input type="number" value="${cartItem.book.stock}"
															onMouseOut="updateCart(this,${cartItem.book.id },${cartItem.book.stock })" /></td>
													</c:when>
													<c:otherwise>
														<td class="product-quantity"><input type="number" value="${cartItem.quantity }"
															onMouseOut="updateCart(this,${cartItem.book.id },${cartItem.quantity })" /></td>

													</c:otherwise>
												</c:choose>
												<td class="product-remove"><a
													href="${pageContext.request.contextPath }/CartServlet?method=delete&id=${cartItem.book.id}"><i
														class="fa fa-times"></i></a></td>
											</tr>
										</c:forEach>

									</tr>

								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
					<div class="buttons-cart mb-30">
						<ul>
							<li><a href="${pageContext.request.contextPath }/CartServlet?method=clear">清空购物车</a></li>
							<li><a href="${pageContext.request.contextPath }/IndexServlet">回到首页</a></li>
						</ul>
					</div>

				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
					<div class="cart_totals">

						<div class="order-total">
							<span>总计</span> <strong> <span class="amount">${sessionScope.shoppingCart.totalPrice }</span>
							</strong>
						</div>
						<div class="wc-proceed-to-checkout">
							<c:if test="${user == null }">
								<span>您还没有登录，请登录后再付款！ →</span>
								<a href="login.jsp">登录</a>
							</c:if>
							<c:if test="${user != null }">
								<a href="checkout.jsp">BUY</a>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- cart-main-area-end -->
	<!-- footer-area-start -->

	<!-- footer-area-end -->


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
