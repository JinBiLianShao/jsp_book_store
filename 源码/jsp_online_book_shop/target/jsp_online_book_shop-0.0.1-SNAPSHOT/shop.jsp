<%@page import="com.zhy.beans.Book"%>
<%@page import="com.zhy.dao.CategoryDao"%>
<%@page import="com.zhy.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>爱看图书商城</title>
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
<style>
ul.pagination {
	display: inline-block;
	padding: 0;
	margin: 0;
}

ul.pagination li {
	display: inline;
}

ul.pagination li a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

ul.pagination li a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

ul .pagination li a:hover:not (.active ) {
	background-color: #ddd;
}
</style>
</head>
<body class="shop">
	<%@ include file="header.jsp"%>
	<!-- breadcrumbs-area-start -->

	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="index.jsp">首页</a></li>
							<li><a class="active">${category[0].category}</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- shop-main-area-start -->
	<div class="shop-main-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<div class="shop-left">
						<div class="section-title-5 mb-30">
							<h2>购物选择</h2>
						</div>

						<div class="left-title mb-20">
							<h4>今日推荐</h4>
						</div>
						<div class="random-area mb-30">
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a><img src="img/product/20.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Endeavor Daytrip</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a><img src="img/product/21.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Savvy Shoulder Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$35.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Compete Track Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$35.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a><img src="img/product/23.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Voyage Yoga Bag</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a><img src="img/product/24.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Impulse Duffle</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$70.00</li>
													<li class="old-price">$74.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
													<li><a><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a>Fusion Backpack</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$59.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="banner-area mb-30">
							<div class="banner-img-2">
								<a><img src="img/banner/31.jpg" alt="banner" /></a>
							</div>
						</div>
						<div class="left-title-2 mb-30">
							<h2>Compare Products</h2>
							<p>You have no items to compare.</p>
						</div>
						<div class="left-title-2">
							<h2>My Wish List</h2>
							<p>You have no items in your wish list.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<div class="category-image mb-30">
						<a><img src="img/banner/32.jpg" alt="banner" /></a>
					</div>
					<div class="section-title-5 mb-30">
						<h2>${category[0].category}</h2>
					</div>


					<div class="tab-content">
						<div class="tab-pane active" id="th">
							<div class="row">

								<c:forEach var="book" items="${category }">
									<div class="col-lg-3 col-md-4 col-sm-6">
										<!-- single-product-start -->
										<div class="product-wrapper mb-40">
											<div class="product-img">
												<a> <img
													src="${pageContext.request.contextPath }${book.cover}"
													alt="book" class="primary" width="200" height="200" />
												</a>
												<div class="quick-view">
													<a
														href="${pageContext.request.contextPath }/ProductServlet?id=${book.id}"><i
														class="fa fa-search-plus"></i></a>
												</div>
												<div class="product-flag">
													<ul>
														<li><span class="sale">新品</span></li>
														<li><span class="discount-percentage">-5%</span></li>
													</ul>
												</div>
											</div>
											<div class="product-details text-center">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>


													</ul>
												</div>
												<h4>
													<a><span>${book.name }</span></a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$${book.price }.00</li>
													</ul>
												</div>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a
														href="${pageContext.request.contextPath }/CartServlet?method=add&id=${book.id}"><i
														class="fa fa-shopping-cart"></i>加入购物车</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a
															href="${pageContext.request.contextPath }/ProductServlet?id=${book.id}"
															title="Details"><i class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
										<!-- single-product-end -->
									</div>
								</c:forEach>

							</div>

							<ul class="pagination">
								<li><a
									href="/jsp_online_book_shop/CategoryServlet?method=get&id=${cateid}&page=${nowpage - 1}">«</a></li>
								<c:forEach var="i" begin="1" end="${ pagesize }">
									<c:if test="${nowpage eq i}">
										<li><a class="active"
											href="/jsp_online_book_shop/CategoryServlet?method=get&id=${cateid}&page=${nowpage}">${i}</a></li>
									</c:if>
									<c:if test="${nowpage ne i}">
										<li><a
											href="/jsp_online_book_shop/CategoryServlet?method=get&id=${cateid}&page=${i}">${i}</a></li>
									</c:if>
								</c:forEach>
								<li><a
									href="/jsp_online_book_shop/CategoryServlet?method=get&id=${cateid}&page=${nowpage + 1}">«</a></li>
							</ul>

						</div>
						<div class="tab-pane fade" id="list">
							<!-- single-shop-start -->
							<div class="single-shop mb-30">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="product-wrapper-2">
											<div class="product-img">
												<a> <img src="img/product/3.jpg" alt="book"
													class="primary" />
												</a>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<div class="product-wrapper-content">
											<div class="product-details">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a>Crown Summit</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$36.00</li>
														<li class="old-price">$38.00</li>
													</ul>
												</div>
												<p>The sporty Joust Duffle Bag can't be beat - not in
													the gym, not on the luggage carousel, not anywhere. Big
													enough to haul a basketball or soccer ball and some
													sneakers with plenty of room to spare,...</p>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a title="Add to cart"><i class="fa fa-shopping-cart"></i>加入购物车</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- single-shop-end -->
							<!-- single-shop-start -->
							<div class="single-shop mb-30">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="product-wrapper-2">
											<div class="product-img">
												<a> <img src="img/product/18.jpg" alt="book"
													class="primary" />
												</a>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<div class="product-wrapper-content">
											<div class="product-details">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a>Driven Backpack</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$34.00</li>
														<li class="old-price">$36.00</li>
													</ul>
												</div>
												<p>The sporty Joust Duffle Bag can't be beat - not in
													the gym, not on the luggage carousel, not anywhere. Big
													enough to haul a basketball or soccer ball and some
													sneakers with plenty of room to spare,...</p>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a title="Add to cart"><i class="fa fa-shopping-cart"></i>加入购物车</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- single-shop-end -->
							<!-- single-shop-start -->
							<div class="single-shop mb-30">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="product-wrapper-2">
											<div class="product-img">
												<a> <img src="img/product/10.jpg" alt="book"
													class="primary" />
												</a>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<div class="product-wrapper-content">
											<div class="product-details">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a>Fusion Backpack</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$59.00</li>
													</ul>
												</div>
												<p>The sporty Joust Duffle Bag can't be beat - not in
													the gym, not on the luggage carousel, not anywhere. Big
													enough to haul a basketball or soccer ball and some
													sneakers with plenty of room to spare,...</p>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a title="Add to cart"><i class="fa fa-shopping-cart"></i>Add
														to cart</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- single-shop-end -->
							<!-- single-shop-start -->
							<div class="single-shop mb-30">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="product-wrapper-2">
											<div class="product-img">
												<a> <img src="img/product/5.jpg" alt="book"
													class="primary" />
												</a>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<div class="product-wrapper-content">
											<div class="product-details">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a>Set of Sprite Yoga Straps</a>
												</h4>
												<div class="product-price">
													<ul>
														<li><span>Starting at</span>$34.00</li>
													</ul>
												</div>
												<p>The sporty Joust Duffle Bag can't be beat - not in
													the gym, not on the luggage carousel, not anywhere. Big
													enough to haul a basketball or soccer ball and some
													sneakers with plenty of room to spare,...</p>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a title="Add to cart"><i class="fa fa-shopping-cart"></i>Add
														to cart</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- single-shop-end -->
							<!-- single-shop-start -->
							<div class="single-shop">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="product-wrapper-2">
											<div class="product-img">
												<a> <img src="img/product/19.jpg" alt="book"
													class="primary" />
												</a>
											</div>
										</div>
									</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
										<div class="product-wrapper-content">
											<div class="product-details">
												<div class="product-rating">
													<ul>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
														<li><a><i class="fa fa-star"></i></a></li>
													</ul>
												</div>
												<h4>
													<a>Compete Track Tote</a>
												</h4>
												<div class="product-price">
													<ul>
														<li>$32.00</li>
													</ul>
												</div>
												<p>The sporty Joust Duffle Bag can't be beat - not in
													the gym, not on the luggage carousel, not anywhere. Big
													enough to haul a basketball or soccer ball and some
													sneakers with plenty of room to spare,...</p>
											</div>
											<div class="product-link">
												<div class="product-button">
													<a title="Add to cart"><i class="fa fa-shopping-cart"></i>Add
														to cart</a>
												</div>
												<div class="add-to-link">
													<ul>
														<li><a href="product-details.html" title="Details"><i
																class="fa fa-external-link"></i></a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- single-shop-end -->
						</div>
					</div>
					<!-- tab-area-end -->
					<!-- pagination-area-start -->

					<!-- pagination-area-end -->
				</div>
			</div>
		</div>
	</div>
	<!-- shop-main-area-end -->
	<!-- footer-area-start -->




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
