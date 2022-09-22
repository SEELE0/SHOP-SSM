<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>购物车</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎!</div>
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
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
	
	</div>

	<div class="total_count">全部商品<em id="ems"></em>件</div>	 
	
	
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	<div id="cart_lists">
	
	
	
	
	</div>
	
	
	


	<ul class="settlements">
		<li class="col01"><input type="checkbox" id="btn_check"></li>
		<li class="col02"><input type="button" id="btn" value="删除"/></li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="count_prices">0</em><br>共计<b id="countB"></b>件商品</li>
		<li class="col04"><a id="jiesu" href="" onclick="pay()">去结算</a></li>
<%--		<li class="col04"><input type="button" id="pay-test" onclick="pay()" value="去"></li>--%>
	</ul>

	<div class="footer">

	</div>
	
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/pages/layui.all.js"></script>	
<script type="text/javascript" src="../js/jquery.cookie.js"></script>	
<script type="text/javascript" src="../js/cartList.js"></script>	


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