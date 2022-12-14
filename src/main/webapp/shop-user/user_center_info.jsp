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
	<script type="text/javascript" src="../js/updateUser.js"></script>
	<link href="../css/layer.css" rel="stylesheet">
    <script src="../js/layer.js"></script>

</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎</div>
			<div class="fr">
				<div class="login_btn fl" id="userPs">
					<a href="login.jsp">登录</a>
					<span>|</span>
					<a href="register.jsp">注册</a>
				</div>
				<div class="user_link fl" >
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
				<li><a href="user_center_info.jsp" class="active">· 个人信息</a></li>
				<li><a href="user_center_order.jsp">· 全部订单</a></li>
				<li><a href="user_center_site.jsp">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">个人信息</h3>
				<div class="site_con" id="reg_form">
					<form action="" method="post" id="system_form">
						<div class="form_group">
							<label>邮箱：</label>
							<input type="text" name="email" id="email"/>
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<div class="form_group">
							<label>手机号：</label>
							<input type="text" name="iphone" id="iphones"/>
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<div class="form_group">
							<label>联系地址：</label>
							<input type="text" name="address" id="address"/>
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<input type="submit"  value="保存" class="info_submit">
					</form>
				</div>
				
				<h3 class="common_title2">修改密码</h3>
				<div class="site_con">
					<form>
						<div class="form_group">
							<label>原密码：</label>
							<input type="text" name="" id="pwd">
						</div>
						<div class="form_group">
							<label>新密码：</label>
							<input type="text" name="" id="newpwd">
						</div>
						<input type="button" id="updatePwd" value="修改" class="info_submit">
					</form>
				</div>
		</div>
	</div>
	



	<div class="footer">

	</div>
	<script>
function login_success() {
	if($.cookie('shop-users')!=null){
		$('#userPs').html("欢迎您：<span style='color: red'>"+eval("(" + $.cookie('shop-users') + ")")['users']+"</span>");
	}
}
login_success();
$('#email').val(eval("(" + $.cookie('shop-users') + ")")['email'])
$('#iphones').val(eval("(" + $.cookie('shop-users') + ")")['iphone'])
$('#address').val(eval("(" + $.cookie('shop-users') + ")")['address'])


$('#system_form').attr("action","/Shop-SSM/updateMagess.do?id="+eval("(" + $.cookie('shop-users') + ")")['id']);
</script>
</body>
</html>