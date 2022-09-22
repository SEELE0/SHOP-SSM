<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
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
                <span>|</span>
                <a href="loginOut.do">退出</a>
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
    <a href="javascript:;">商品详情</a>
</div>

<div class="goods_detail_con clearfix" id="goods">

</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>随机推荐</h3>
            <ul id="ulu">

            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active">商品介绍</li>
        </ul>

        <div class="tab_content">
            <dl id="pres">

            </dl>
        </div>

    </div>
</div>

<div class="footer">
</div>

<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
    var carts = 1;
    var str = "";
    var pre = "";
    var rod = "";

    $.ajax({
        url: "/Shop-SSM/roundGoods.do",
        type: "get",
        dataType: "json",
        success: function (m) {
            console.log(m)
            suiji(m)
            $('#ulu').append(rod)//添加到ul中
        }

    })


    function suiji(arry) { //随机推荐
        for (var i in arry) {
            rod += "<li>"
            rod += "<a href='detail.jsp?id=" + arry[i]["id"] + "'><img src='../images/" + arry[i]["goods_img"] + "'></a>" //商品图片
            rod += "<h4><a href='detail.jsp?id=" + arry[i]["id"] + "'>" + arry[i]["goods_name"] + "</a></h4>" //商品名称
            rod += "<div class='prize'>￥" + arry[i]["goods_price"] + "</div></li>" //商品价格
        }
    }

    $.ajax({
        url: "/Shop-SSM/getIdGoods.do",
        type: "post",
        data: {
            "id": GetQueryString("id")
        },
        dataType: "json",
        success: function (m) {
            lists(m)
            listsXq(m)
            $('#goods').append(str)
            $('#pres').append(pre)
            jiajian();
            addcart_(m);
            lijiPay_();

        }

    })


    function lists(arry) {
        str += "<div class='goods_detail_pic fl'><img  id='goods_img' src='../images/" + arry["goods_img"] + "' style=\"width: 300px;\"></div>"
        str += "<div class='goods_detail_list fr'>"
        str += "<h3 id='goodname'>" + arry["goods_name"] + "</h3>"
        str += "<br><br>"
        str += "<div class='prize_bar'>"
        str += "<span class='show_pirze'>¥<em id='show_peices'>" + arry["goods_price"] + "</em></span>"
        str += "<span class='show_unit' id='show_unit'>发行商：<em id='showun'>" + arry["goods_unit"] + "</em></span>"
        str += "<input id='price' style='display:none' value='" + arry["goods_price"] + "'/>"
        str += "<span class='show_unit'>库存：" + arry["goods_stock"] + "</span>"
        str += "</div>"
        str += "<div class='goods_num clearfix'>"
        str += "<div class='num_name fl'>数 量：</div>"
        str += "<div class='num_add fl'>"
        str += "<input type='text' disabled='disabled' id='snum' class='num_show fl' value='1'>"
        str += "<a href='javascript:;' id='jia' class='add fr'>+</a>"
        str += "<a href='javascript:;' id='jian' class='minus fr'>-</a></div></div>"
        str += "<div class='total'>总价：<em id='counts'>" + arry["goods_price"] + "元</em></div>"
        str += "<div class='operate_btn'>"
        str += "<a href='place_order_user.jsp?id=" + arry["id"] + "&num=' id='liji_' class='buy_btn'>立即购买</a>"
        str += "<a href='javascript:;' class='add_cart' id='add_cart'>加入购物车</a></div></div>"
    }

    function listsXq(arry) {
        pre += "<dt>商品详情：</dt>"
        pre += "<dd>" + arry["goods_present"] + "</dd>"
    }


    function jiajian() {
        $('#jia').click(function () {
            if ($('#snum').val().trim() != 10) {
                var aa = $('#snum').val().trim();
                $('#snum').val(Number(aa) + carts);
                var cc = $('#price').val();
                $('#counts').html(((Number($('#snum').val()) * Number(cc))).toFixed(2) + "元")
            } else {
                alert("最多只能买十件")
            }
        })

        $('#jian').click(function () {
            if ($('#snum').val().trim() != 1) {
                var aa = $('#snum').val().trim();
                $('#snum').val(Number(aa) - carts);
                $('#counts').html((Number($('#snum').val()) * Number($('#price').val())).toFixed(2) + "元")

            }
        })

    }


    function addcart_(array) {

            $('#add_cart').click(function () {//加入购物车
                var num = $('#snum').val();
                if ((array["goods_stock"] - num) < 0) {
                    layer.msg('库存不足', {icon: 5, time: 1000});
                } else {
                $.ajax({
                    url: "/Shop-SSM/addCrat.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        "goods_name": $('#goodname').html(),
                        "goods_unit": $('#showun').html(),
                        "goods_price": $('#show_peices').html(),
                        "goods_num": $('#snum').val(),
                        "users_id": eval("(" + $.cookie('shop-users') + ")")['id'],
                        //改动取得图片名阶段../images/
                        "goods_img": $('#goods_img').attr("src").substring(10),
                        "goods_id": GetQueryString("id")

                    },
                    success: function (m) {
                        if (m.state == 1) {
                            layer.msg('加入成功', {icon: 1, time: 1300});
                        } else {
                            layer.msg('加入失败', {icon: 5, time: 1000});
                        }
                    }

                });}
            });

    }


    function lijiPay_() {
        $('#liji_').click(function () {
            var url = $('#liji_').attr("href");
            var urls = url + $('#snum').val();
            var url = $('#liji_').attr("href", urls);
        })


    }


    function login_success() {
        if ($.cookie('shop-users') != null) {
            $('#userPs').html("欢迎您：<span style='color: red'>" + eval("(" + $.cookie('shop-users') + ")")['users'] + "</span>");
        }
    }

    login_success();


</script>

</body>
</html>