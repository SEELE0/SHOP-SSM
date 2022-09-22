<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../js/Js/prototype.lite.js" type="text/javascript"></script>
    <script src="../js/Js/moo.fx.js" type="text/javascript"></script>
    <script src="../js/Js/moo.fx.pack.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../css/skin.css" />
    
    <script type="text/javascript">
        window.onload = function () { //页面加载完毕后执行
            var contents = document.getElementsByClassName('content'); //获取所有class为content的元素
            var toggles = document.getElementsByClassName('type'); //获取所有class为type的元素

            var myAccordion = new fx.Accordion( //
            toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);//默认展开第一个
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                    dl_a.onfocus=function(){
                        this.blur();
                    }
            }
        }
    </script>
</head>

<body>
    <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
        <tr>
            <td width="182" valign="top">
                <div id="container">
                    <h1 class="type"><a href="javascript:void(0)">类别管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="../images/Images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="./goods_sort.jsp" target="main">商品类别</a></li>
                            <li><a href="./add_type.jsp" target="main">添加类别</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">商品管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="../images/Images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="./goods_list.jsp" target="main">全部商品</a></li>
                            <li><a href="./goods_add.jsp" target="main">添加商品</a></li>
                            <li><a href="./goods_type_update.jsp" target="main">转移商品类别</a></li>
                            
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">订单管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="../images/Images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="./orders_dai.jsp" target="main">待支付订单</a></li>
                            <li><a href="./orders_yi.jsp" target="main">已支付订单</a></li>
                            <li><a href="./orders_weifa.jsp" target="main">未发货订单</a></li>
                            <li><a href="./orders_yifa.jsp" target="main">已发货订单</a></li>
                        </ul>
                    </div>
                    <!-- *********** -->
                    <h1 class="type"><a href="javascript:void(0)">会员管理</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="../images/Images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="./user_list.jsp" target="main">会员管理</a></li>
                            <li><a href="./user_orders.jsp" target="main">会员订单</a></li>
                        </ul>
                    </div>
                    <h1 class="type"><a href="javascript:void(0)">系统设置</a></h1>
                    <div class="content">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><img src="../images/Images/menu-top-line.gif" width="182" height="5" /></td>
                            </tr>
                        </table>
                        <ul class="RM">
                            <li><a href="./AdminUserList.jsp" target="main">管理员</a></li>
                              <li><a href="./AdminUserShiro.jsp" target="main">权限设置</a></li>
                        </ul>
                    </div>
                    <!-- *********** -->

                    <!-- *********** -->
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
