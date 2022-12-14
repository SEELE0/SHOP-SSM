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
		<link href="../css/layer.css" rel="stylesheet">
    <script src="../js/layer.js"></script>
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
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>

	</div>

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_info.jsp">· 个人信息</a></li>
				<li><a href="user_center_order.jsp">· 全部订单</a></li>
				<li><a href="user_center_site.jsp" class="active">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">收货地址</h3>
				<div class="site_con" id="addres">

				</div>


				<h3 class="common_title2">编辑地址</h3>
				<div class="site_con">
					<form>
						<div class="form_group">
							<label>收件人：</label>
							<input type="text" id="ren" value="">
						</div>
						<div class="form_group form_group2">
							<label>详细地址：</label>
							<textarea class="site_area" id="ads"></textarea>
						</div>
						<div class="form_group">
							<label>邮编：</label>
							<input type="text" value="" id="codes">
						</div>
						<div class="form_group">
							<label>手机：</label>
							<input type="text" value="" id="iphone">
						</div>
						<input type="button" id="btn"  value="提交" class="info_submit">
					</form>
				</div>
		</div>
	</div>



	<div class="footer">

	</div>

</body>
	<script>
	var str ="";

	$.ajax({
		 url : "/Shop-SSM/getByIdaddress.do",
         type : "post",
         data:{
        	 "id" : eval("(" + $.cookie('shop-users') + ")")['id']
         },
         dataType: "json",
         success : function (m) {
        	 Getlists(m)
        	$('#addres').append(str)
         }

	})


	function Getlists(arry) {
			str +="<dl>"
			str +="<dt>当前地址：</dt>"
			str +="<input id='ids' style='display:none' value='"+arry["id"]+"'/>"
			str +="<dd>"+arry["address"]+"&nbsp;（"+arry["recename"] +" 收）"+ arry["iphone"]+"</dd>"
			str +="</dl>"
	}



function login_success() {
	if($.cookie('shop-users')!=null){
		$('#userPs').html("欢迎您：<span style='color: red'>"+eval("(" + $.cookie('shop-users') + ")")['users']+"</span>");
	}
}
login_success();


$('#btn').click(function() {
	var rens = $('#ren').val().trim().length;
	var ads = $('#ads').val().trim().length;
	var codes = $('#codes').val().trim().length;
	var iphone = $('#iphone').val().trim().length;

	if(rens==0&&ads==0&&codes==0&&iphone==0){
		 layer.msg('你貌似还没做任何修改', {icon: 5,time: 800});
	}else{
	$.ajax({
			url  : "/Shop-SSM/updateAddress.do",
			type : "post",
			data : {
				"id" : $('#ids').val(),
				"recename" : $('#ren').val(),
				"address"  : $('#ads').val().trim(),
				"zipcode"   : $('#codes').val().trim(),
				"iphone" : $('#iphone').val().trim()
			},
			 dataType: "json",
	         success : function (m) {
	        	 console.log(m)
	        	 if(m.state == 1){
	        		 layer.msg('地址修改成功');
	        		 setTimeout("location.href='user_center_site.jsp'",1000);
	        	 }else{
	        		 layer.msg('修改失败', {icon: 5,time: 1000});
	        	 }
	         }

		})
	}


})



</script>
</html>