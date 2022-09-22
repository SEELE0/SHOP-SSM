<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>登录</title>
	 <script src="../js/jquery-3.3.1.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	 <link href="../css/layer.css" rel="stylesheet">
    <script src="../js/layer.js"></script>
    <script src="../js/login.js"></script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="index.jsp" class="login_logo" style="margin-right: 60px;"><img src="../images/logo02.png" style="width: 200px;"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="register.jsp">立即注册</a>
				</div>
				<div class="form_input">
					<form>
						<input type="text" id="users" class="name_input" placeholder="请输入用户名">
						
						<input type="password" id="password" class="pass_input" placeholder="请输入密码">


						<input type="button" id="logins" value="登录" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>


	
</body>
</html>