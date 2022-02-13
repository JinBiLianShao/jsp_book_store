<%@page import="com.zhy.factory.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.zhy.beans.ShoppingCart"%>
<%@page import="com.zhy.beans.Book"%>
<%@page import="com.zhy.beans.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function selectname() {
		var search = document.getElementById("search").value;
		location.href = 'SearchServlet?search=' + search;
	}
</script>
<header>
	
	<!-- header-top-area-start -->
	<div class="header-top-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="language-area">
						<ul>
							<li><a href="${pageContext.request.contextPath }/adminLogin.jsp">点击进入后台管理</a></li>
						</ul>
					</div>

				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="account-area text-right">
						<ul>
							<c:if test="${user == null }">
								<li><a href="login.jsp">登录</a></li>
							</c:if>
							<c:if test="${user != null }">
								<li>欢迎您，${user.nickname }！<a href="order.jsp">查看订单</a></li>
								<li><a href="${pageContext.request.contextPath }/LogoutServlet">注销</a></li>
							</c:if>
							<li><a href="register.jsp">注册</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header-top-area-end -->
	<!-- header-mid-area-start -->
	<div class="header-mid-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
					<div class="header-search ">
						<form action="#">
							<input type="text" placeholder="请输入想要查询内容" value="${search}" id="search" /> <a
								href="javascript:selectname()"><i class="fa fa-search "></i></a>
						</form>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
					<div class="logo-area text-center logo-xs-mrg">
						<a href="index.jsp"><img src="img/logo/logo.png" alt="logo" /></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="my-cart">
						<ul>


							<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>我的购物车</a> <span>${(sessionScope.shoppingCart.num==0)?0:sessionScope.shoppingCart.num}</span>

								<div class="mini-cart-sub">
									<div class="cart-product">
										<c:forEach items="${sessionScope.shoppingCart.cartItems }" var="cartItem">
											<div class="single-cart">
												<div class="cart-img">
													<a><img src="${pageContext.request.contextPath }${cartItem.book.cover}"
														style="width: 100px; height: 100px"></a>
												</div>
												<div class="cart-info">
													<h5>
														<a>${cartItem.book.name }</a>
													</h5>
													<br> <br>
													<p>数量：${cartItem.quantity } &nbsp单价：${cartItem.book.price }</p>
												</div>
												<div class="cart-icon">
													<a
														href="${pageContext.request.contextPath }/CartServlet?method=delete&id=${cartItem.book.id}"><i
														class="fa fa-remove"></i></a>
												</div>
											</div>
										</c:forEach>


									</div>
									<div class="cart-totals">
										<h5>
											总计 <span>￥${ shoppingCart.totalPrice}</span>
										</h5>
									</div>
									<div class="cart-bottom">
										<a class="view-cart" href="cart.jsp">查看购物车</a>
										<c:if test="${user != null }">
											<a href="checkout.jsp">BUY</a>
										</c:if>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<%
	List<Category> rootCategories = DaoFactory.getCategoryDao().getCategoryByGrade(1);
	request.setAttribute("rootCategories", rootCategories);
	List<Category> sonCategories = DaoFactory.getCategoryDao().getCategoryByGrade(1);
	request.setAttribute("rc", sonCategories);
%>
<!-- main-menu-area-start -->
<div class="main-menu-area hidden-sm hidden-xs sticky-header-1" id="header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="menu-area">
					<nav>
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath }/CategoryServlet?method=getAllbooks">全部商品<i
									class="fa fa-angle-down"></i></a></li>
							<c:forEach var="rootCategory" items="${rootCategories }">
								<li><a>${ rootCategory.name}<i class="fa fa-angle-down"></i></a>
									<div class="sub-menu sub-menu-2">
										<ul>
											<c:forEach var="sc" items="${rootCategory.sonCategories}">
												<li><a
													href="${pageContext.request.contextPath }/CategoryServlet?method=get&id=${sc['id']}">${sc['name']}</a></li>
											</c:forEach>
										</ul>
									</div></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- main-menu-area-end -->