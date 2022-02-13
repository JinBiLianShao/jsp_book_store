<%@page import="com.zhy.beans.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta name="renderer" content="webkit">
<!--国产浏览器高速模式-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 作者 -->
<meta name="revised" content="爱看图书.v3, 2019/05/01" />
<!-- 定义页面的最新版本 -->
<meta name="description" content="网站简介" />
<!-- 网站简介 -->
<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
<title>后台管理 - 爱看图书</title>

<!-- 公共样式 开始 -->
<link rel="shortcut icon" href="img/logo.jpg" />
<link rel="bookmark" href="img/logo.jpg" />
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<script type="text/javascript" src="framework/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<!--[if lt IE 9]>
	      	<script src="framework/html5shiv.min.js"></script>
	      	<script src="framework/respond.min.js"></script>
	    <![endif]-->
<script type="text/javascript" src="layui/layui.js"></script>
<!-- 滚动条插件 -->
<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
<script src="framework/jquery-ui-1.10.4.min.js"></script>
<script src="framework/jquery.mousewheel.min.js"></script>
<script src="framework/jquery.mCustomScrollbar.min.js"></script>
<script src="framework/cframe.js"></script>
<!-- 仅供所有子页面使用 -->
<!-- 公共样式 结束 -->

<link rel="stylesheet" type="text/css" href="css/frameStyle.css">
<script type="text/javascript" src="framework/frame.js"></script>

</head>

<body>
<%
	Admin admin =  (Admin)request.getSession().getAttribute("admin");
	if(admin == null){
		response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
	}
%>
	<!-- 左侧菜单 - 开始 -->
	<div class="frameMenu">
		<div class="logo">
			
			<a href="frame.jsp"><img src="img/logo.jpg" /></a>
			<div class="logoText">
				<h1>爱看后台管理</h1>
				<p>AI KAN</p>
			</div>
		</div>
		<div class="menu">
			<ul>

				<li><a class="menuFA" href="javascript:void(0)"><i
						class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>用户管理<i
						class="iconfont icon-dajiantouyou right"></i></a>
					<dl>
						<dt>
							<a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/agent_add.jsp',this)">添加用户</a>
						</dt>
						<dt>
							<a href="javascript:void(0)" onclick="menuCAClick('tgls/agent/agent_list.jsp',this)">用户列表</a>
						</dt>
					</dl></li>
				<li><a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>商品管理<i
						class="iconfont icon-dajiantouyou right"></i></a>
					<dl>

						<dt>
							<a href="javascript:void(0)" onclick="menuCAClick('tgls/goodsManage/goods_list.jsp?page=1&size=9',this)">基本商品库</a>
						</dt>
						<dt>
							<a href="javascript:void(0)" onclick="menuCAClick('tgls/goodsManage/goods_add.jsp',this)">添加商品</a>
						</dt>
					</dl></li>
				<li><a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>分类管理<i
						class="iconfont icon-dajiantouyou right"></i></a>
					<dl>
						<dt>
							<a href="javascript:void(0)"
								onclick="menuCAClick('tgls/goodsManage/goodsType_list.jsp?page=1&size=9',this)">分类列表</a>
						</dt>

						<dt>
							<a href="javascript:void(0)" onclick="menuCAClick('tgls/goodsManage/goodsType_add.jsp',this)">添加分类</a>
						</dt>
					</dl></li>
					
					
					<li><a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>订单管理<i
						class="iconfont icon-dajiantouyou right"></i></a>
					<dl>
						<dt>
							<a href="javascript:void(0)"
								onclick="menuCAClick('tgls/order/orderlist.jsp',this)">订单列表</a>
						</dt>
 
					</dl></li>

			</ul>
		</div>
	</div>
	<!-- 左侧菜单 - 结束 -->

	<div class="main">
		<!-- 头部栏 - 开始 -->
		<div class="frameTop">
			<img class="jt" src="img/top_jt.png" />
			<div class="topMenu">
				<ul>
					<li><a href="javascript:void(0)" >管理员</a></li>
					<li><a href="javascript:void(0)" onclick="menuCAClick('tgls/modify_password.jsp',this)"><i
							class="iconfont icon-xiugaimima"></i>修改密码</a></li>
					<li><a href="${pageContext.request.contextPath}/AdminServlet?method=logout"><i class="iconfont icon-084tuichu"></i>注销</a></li>
				</ul>
			</div>
		</div>
		<!-- 头部栏 - 结束 -->

		<!-- 核心区域 - 开始 -->
		<div class="frameMain">
			<div class="title" id="frameMainTitle">
				<span><i class="iconfont icon-xianshiqi"></i>后台首页</span>
			</div>
			<div class="con">
				<iframe id="mainIframe" src="tgls/goodsManage/goods_list.jsp" scrolling="no"></iframe>
			</div>
		</div>
		<!-- 核心区域 - 结束 -->
	</div>
</body>

</html>