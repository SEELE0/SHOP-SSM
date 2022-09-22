<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>用户中心</title>
	
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../js/pages/css/layui.css">
	<link href="../css/layer.css" rel="stylesheet">
    <script src="../js/layer.js"></script>
</head>
<body>
	<div class="header_con" style="font-size: 12px">
		<div class="header">
			<div  class="welcome fl">欢迎!</div>
			<div class="fr">
				<div class="login_btn fl" id="userPs">
					<a href="login.jsp">登录</a>
					<span>|</span>
					<a href="register.jsp">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="cart.jsp">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.jsp">我的订单</a>
					<span>|</span>
					<a href="loginOut.do">退出</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl" style="margin-right: 60px;"><img src="../images/logo.png" style="width: 200px;"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
	
	</div>

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_info.jsp">· 个人信息</a></li>
				<li><a href="user_center_order.jsp" class="active">· 全部订单</a></li>
				<li><a href="user_center_site.jsp">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">全部订单</h3>
				
			<div id="carts">

				
				
			</div>



			<div id="page" class="pagenation">

				</div>
		</div>
	</div>



	<div class="footer">

	</div>
	
	<script src="../js/pages/layui.js" charset="utf-8"></script>
	<script src="../js/order.js" charset="utf-8"></script>
	<script>
	
	
	function login_success() {
		if($.cookie('shop-users')!=null){
			$('#userPs').html("欢迎您：<span style='color: red'>"+eval("(" + $.cookie('shop-users') + ")")['users']+"</span>");
		}
	}
	login_success();
	
	</script>
</body>
</html>