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
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/user.register.js"></script>
        
    </head>
    <body class="login">
		<%@include file="header.jsp" %>
		<!-- breadcrumbs-area-start -->
		<div class="breadcrumbs-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumbs-menu">
							<ul>
								<li><a href="index.html">首页</a></li>
								<li><a   class="active">注册</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- user-login-area-start -->
		<div class="user-login-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="login-title text-center mb-30">
							<h2 class="strong">注册</h2>
							<p>想拥有一个新的账号吗？</p>
						</div>
					</div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
					<div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
						<div class="login-form">
							<p style="color:red">${message }</p>
							<div class="single-login">
								<label>昵称<span>*</span></label>
								<input type="text"  name="nickname" id="txtNickName"  placeholder="您的昵称可以由小写英文字母、中文、数字组成，长度4－20个字符"/>
								<span id="name.info" style="color:red"></span>
							</div>
							<div class="single-login">
								<label>用户名 <span>*</span></label>
								<input type="text" name="username" id="txtEmail"  placeholder="请填写您的Email地址"/>
								<span id="email.info" style="color:red"></span>
							</div>
							<div class="single-login">
								<label>密码 <span>*</span></label>
								<input type="password"   name="password" id="txtPassword"  placeholder="您的密码可以由大小写英文字母、数字组成，长度6－20位。"/>
								<span id="password.info" style="color:red"></span>
							</div>
							<div class="single-login">
								<label>密码 <span>*</span></label>
								<input type="password"  id="txtRepeatPass"  placeholder="再次输入您设置的密码："/>
								<span id="password1.info" style="color:red"></span>
							</div>
							<div class="single-login single-login-2">
								<button type="submit" id="btnClientRegister" class="btn btn-default pull-left">点击注册</button>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- user-login-area-end -->
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