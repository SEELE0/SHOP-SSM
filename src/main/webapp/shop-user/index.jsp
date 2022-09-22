<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/slide.js"></script>
	<script type="text/javascript" src="../js/jquery.cookie.js"></script>
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
					<%--登录--%>
					<a href="loginOut.do">退出</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl" style="margin-right: 60px;"><img src="../images/logo.png" style="width: 200px;"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" id="nAmes" placeholder="搜索商品">
			<input type=button class="input_btn fr" id="sous" value="搜索">
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
		</div>
	</div>

	<div class="center_con clearfix">
		<ul class="subnav fl">
			<li><a href="#model01" class="fruit">索尼PS</a></li>
			<li><a href="#model02" class="seafood">任天堂</a></li>
			<li><a href="#model03" class="meet">Xbox</a></li>
			<li><a href="#model04" class="egg">ubisoft</a></li>
			<li><a href="#model05" class="vegetables">EA</a></li>
			<li><a href="#model06" class="ice">Bandai Namco</a></li>
		</ul>
		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="../images/slide.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="../images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
	</div>

<div id="indexs"></div>

<script type="text/javascript">
var str = "";
		$.ajax({
			 url : "/Shop-SSM/getGoods.do",
	         type : "get",
	         dataType: "json",
	         success : function (m) {  //回调函数m是返回的数据
	        	 console.log(m) //打印返回的数据
	        	Getlists(m)
	        	$('#indexs').append(str)
	         }
		});

		function Getlists(arry) {
			var num = 1;
			var sum = 0;
			for(var i in arry){
				sum++;
				if(sum>6){
					break;
				}
				str+="<div class='list_model'>" //每一个商品类别的div
				str+="<div class='list_title clearfix'>"
				str+="<h3 class='fl' id='model0"+num+"'>"+arry[i]["type_name"]+"</h3>"
				str+="<div class='subtitle fl'>"
				str+="<span>|</span>"

				// str+="<a href='detail.jsp?id="+arry[i]["lists"][0]["id"]+"'>"+arry[i]["lists"][0]["goods_name"]+"</a>" //第一个商品的名称
				// str+="<a href='detail.jsp?id="+arry[i]["lists"][1]["id"]+"'>"+arry[i]["lists"][1]["goods_name"]+"</a>" //第二个商品的名称
				// str+="<a href='detail.jsp?id="+arry[i]["lists"][2]["id"]+"'>"+arry[i]["lists"][2]["goods_name"]+"</a>" //第三个商品的名称

				str+="</div>"
				str+="<a href='list.jsp?id="+arry[i]["id"]+"' class='goods_more fr' id='fruit_more'>查看更多 ></a>"
				str+="</div>"
				str+="<div class='goods_con clearfix'>"
			    str+="<div class='goods_banner fl'><img src='../images/banner0"+(num++)+".jpg'></div>"
			    str+="<ul class='goods_list fl'>"

				// for(var j in arry[i]["lists"]){
			    // 	str+="<li>"
				// str+="<a href='detail.jsp?id="+arry[i]["lists"][j]["id"]+"'>"
				// str+="<img src='../images/goods0"+(num++)+".jpg'>"
				// str+="<p>"+arry[i]["lists"][j]["goods_name"]+"</p>"
				// str+="<p class='price'>￥"+arry[i]["lists"][j]["goods_price"]+"</p>"
			    // 	str+="</a>"
			    // 	str+="</li>"
			    // }

				for(var j=0;j<4;j++){//每个类型下的商品四个
					if (arry[i]["lists"][j]==undefined) { //如果没有商品就跳过
						j++;
					}
					else { //如果有商品就显示
						str += "<li>"
						str += "<h4><a href='detail.jsp?id=" + arry[i]["lists"][j]["id"] + "'>" + arry[i]["lists"][j]["goods_name"] + "</a></h4>"
						str += "<a href='detail.jsp?id=" + arry[i]["lists"][j]["id"] + "'><img src='../images/" + arry[i]["lists"][j]["goods_img"] + "'></a>"
						str += "<div class='prize'>¥ " + arry[i]["lists"][j]["goods_price"] + "</div>"
						str += "</li>"
					}

				}

				// for (var j=0;j<4;j++){
				// 	str+="<li>"
				// 	str+="<a href='detail.jsp?id="+arry[i]["lists"][j]["id"]+"'>"
				// 	str+="<img src='../images/"+arry[i]["lists"][j]["goods_img"]+"'>"
				// 	str+="<p>"+arry[i]["lists"][j]["goods_name"]+"</p>"
				// 	str+="<p class='price'>¥ "+arry[i]["lists"][j]["goods_price"]+"</p>"
				// 	str+="</a>"
				// 	str+="</li>"
				// }
			    str+="</ul>"
				str+="</div></div>"
				
				
			}
			
			
		}
		
function login_success() {
	
	if($.cookie('shop-users')!=null){
		$('#userPs').html("欢迎您：<span style='color: red'>"+eval("(" + $.cookie('shop-users') + ")")['users']+"</span>");
	}
}

login_success();



$('#sous').click(function () {
	location.href="search_List.jsp?name="+$('#nAmes').val()
})

</script>
	<div class="footer">
	</div>
</body>
</html>