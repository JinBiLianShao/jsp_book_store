<%@page import="com.zhy.factory.DaoFactory"%>
<%@page import="com.zhy.beans.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.zhy.tools.*"%>
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
<script src="../../framework/frame.js"></script>
 <!-- 仅供所有子页面使用 -->
<!-- 公共样式 结束 -->
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
ul

 

.pagination

 

li

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:

 

#ddd


;
}
</style>
</head>
<%
 	List<Category> categories = DaoFactory.getCategoryDao().getAllCategory();
	int pagesize = PageUtils.getPageSize(categories);
	categories = PageUtils.getList(categories, request.getParameter("page"),request);
	 
	request.setAttribute("nowpage", request.getParameter("page"));
	
	request.setAttribute("cs", categories);
%>
<body>
	<div class="cBody">


		<table class="layui-table">
			<thead>
				<tr>
					<th>分类ID</th>
					<th>名称</th>
					<th>分类等级</th>
					<th>上级分类ID&nbsp[上级分类为0表示无上级分类]</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cs}" var="c">

					<tr>
						<td>${c.id }</td>
						<td>${c.name }</td>
						<td>${c.grade }</td>
						<td>${c.parent }</td>
						<td><a class="layui-btn layui-btn-xs" id="${c.id }"
							href="goodsType_update.jsp?id=${c.id }">修改</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<ul class="pagination">
 		 
			<c:forEach var="i" begin="1" end="${ pagesize }">
				<c:if test="${nowpage eq i}">
					<li><a class="active"
						href="/jsp_online_book_shop/tgls/goodsManage/goodsType_list.jsp?page=${nowpage}&size=9">${i}</a></li>
				</c:if>
				<c:if test="${nowpage ne i}">
					<li><a
						href="/jsp_online_book_shop/tgls/goodsManage/goodsType_list.jsp?page=${i}&size=9">${i}</a></li>
				</c:if>
			</c:forEach>
			 
		</ul>

		<!-- layUI 分页模块 -->
		<!-- <div id="pages"></div> -->
		<script>
		function menuCAClick(url,_this){
			
			//处理frameMain url地址
			$("#mainIframe").attr("src",url);
			
			//处理frameMain title名称变化
			if($(_this).find("i").attr("class") == "iconfont icon-yonghu1"){
				$("#frameMainTitle span").html('<i class="iconfont icon-xianshiqi"></i>个人资料');
				return;
			}
			if($(_this).text() == "修改密码"){
				$("#frameMainTitle span").html('<i class="iconfont icon-xianshiqi"></i>'+$(_this).text());
				return;
			}
			if($(_this).attr("class") == "menuFA"){
				$("#frameMainTitle span").html('<i class="iconfont icon-xianshiqi"></i>'+$(_this).text());
			}else{
				//显示父菜单
//				$("#frameMainTitle span").html('<i class="iconfont icon-xianshiqi"></i>'+$(_this).parent().parent().siblings(".menuFA").text());
				//显示子菜单
				$("#frameMainTitle span").html('<i class="iconfont icon-xianshiqi"></i>'+$(_this).text());
			}
			
			//处理菜单样式变化
			$(_this).css("cssText", "background-color:#fbcc19 !important;").css("color","#FFF");
			$(_this).parent().siblings().find("a").css("cssText", "background-color:#transparent").css("color","#c2c2c2");
			$(_this).parent().parent().parent().siblings().find("dl dt a").css("cssText", "background-color:#transparent").css("color","#c2c2c2")
			
		}
		</script>

	</div>

</body>

</html>