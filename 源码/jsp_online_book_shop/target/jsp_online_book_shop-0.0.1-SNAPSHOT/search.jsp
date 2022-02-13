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
</head>
<body class="page">
	<%@include file="header.jsp"%>


	<!-- section-element-area-start -->

	<div class="container">
		<div class="category-image mb-30"></div>
		<div class="section-title-5 mb-30">
			<h4>以下是您搜索到的内容</h4>
		</div>

		<div class="tab-content">
			<div class="tab-pane active" id="th">
				<div class="row">

					<c:forEach var="book" items="${searchName }">
						<div class="col-lg-3 col-md-4 col-sm-6">
							<!-- single-product-start -->
							<div class="product-wrapper mb-40">
								<div class="product-img">
									<a> <img src="${pageContext.request.contextPath }${book.cover}" alt="book"
										class="primary" />
									</a>
									<div class="quick-view">
										<a href="${pageContext.request.contextPath }/ProductServlet?id=${book.id}"><i
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
										<a  ><span>${book.name }</span></a>
									</h4>
									<div class="product-price">
										<ul>
											<li>$${book.price }.00</li>
										</ul>
									</div>
								</div>
								<div class="product-link">
									<div class="product-button">
										<a href="${pageContext.request.contextPath }/CartServlet?method=add&id=${book.id}"
											title="Add to cart"><i class="fa fa-shopping-cart"></i>加入购物车</a>
									</div>
									<div class="add-to-link">
										<ul>
											<li><a href="${pageContext.request.contextPath }/ProductServlet?id=${book.id}"
												title="Details"><i class="fa fa-external-link"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- single-product-end -->
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- section-element-area-end -->
	</div>
</body>
</html>
