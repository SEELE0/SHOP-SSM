<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>商品列表</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../js/urlsqit.js"></script>
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
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl" style="margin-right: 60px;"><img src="../images/logo.png" style="width: 200px;"></a>

	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">索尼PS</a></li>
					<li><a href="#" class="seafood">任天堂</a></li>
					<li><a href="#" class="meet">Xbox</a></li>
					<li><a href="#" class="egg">ubisoft</a></li>
					<li><a href="#" class="vegetables">EA</a></li>
					<li><a href="#" class="ice">Bandai Namco</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="index.jsp">全部分类</a>
		<span>></span>
		<a href="javascript:;">索尼PS</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>随机推荐</h3>
				<ul id="suiji">

				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
			
			</div>

			<ul class="goods_type_list clearfix" id="list_li">

				
				
			</ul>

		</div>
	</div>
	<div class="footer">

	</div>

<script>
var str = "";
 function getList() {
	$.ajax({
		url : "/Shop-SSM/getByNames.do",
		type : "post",
		data : {
			"name" :GetQueryString("name")
		},
		dataType : "json",
		success : function(m) {
			list_goods(m)
			console.log(m[0])
			$('#list_li').append(str)

		}
		
	})
}


function list_goods(arry) {
	
	for(var i in arry){
	 str+="<li>";
	 str+="<a href='detail.jsp?id="+arry[i]["id"]+"'><img src='../images/"+arry[i]["goods_img"]+"'></a>"
	str+="<h4><a href='detail.jsp?id="+arry[i]["id"]+"'>"+arry[i]["goods_name"]+"</a></h4>"
	str+="<div class='operate'>"
	str+="<span class='priz'>￥"+arry[i]["goods_price"]+"</span>"
	str+="<span class='unit'>"+arry[i]["goods_price"]+"/"+arry[i]["goods_unit"]+"</span>"
	str+="</div></li>"
	}
	
}


getList();



function login_success() {
	if($.cookie('shop-users')!=null){
		$('#userPs').html("欢迎您：<span style='color: red'>"+eval("(" + $.cookie('shop-users') + ")")['users']+"</span>");
	}
}
login_success();
</script>
</body>
	<script type="text/javascript" src="../js/goodsList.js"></script>
	
	
</html>