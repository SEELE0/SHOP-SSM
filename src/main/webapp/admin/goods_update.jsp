<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/skin.css" />
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <!-- 头部开始 -->
            <tr>
                <td width="17" valign="top" background="./Images/mail_left_bg.gif">
                    <img src="./Images/left_top_right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="./Images/content_bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="././Images/content_bg.gif">
                        <tr><td height="31"><div class="title">添加栏目</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="./Images/mail_right_bg.gif"><img src="./Images/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="./Images/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <tr>
                            <td colspan="4">
                                <table>
                                    <tr>
                                        <td width="100" align="center"><img src="./Images/mime.gif" /></td>
                                        <td valign="bottom"><h3 style="letter-spacing:1px;">修改商品</h3></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <!-- 添加产品开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <form id="forms" action="" method="post">
                                                <table width="100%"class="cont">
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td width="15%">商品名称：</td>
                                                        <td width="35%"><input class="text" id="goods_name" type="text" name="goods_name" value="" required="required"/></td>
                                                        <td>设置商品名称</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>商品单位：</td>
                                                        <td width="20%"><input class="text" id="goods_unit" type="text" name="goods_unit" value="" required="required"/></td>
                                                        <td>设置商品单位</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                            <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>商品库存：</td>
                                                        <td width="20%"><input class="text" id="goods_stock" type="text" name="goods_stock" value="" required="required"/></td>
                                                        <td>设置商品库存</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    </tr>
                                                            <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>商品单价：</td>
                                                        <td width="20%"><input class="text" id="goods_price" type="text" name="goods_price" value="" required="required"/></td>
                                                        <td>设置商品单价</td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>商品简介：</td>
                                                        <td width="40%"><textarea rows="3" id="goods_present" style="font-size: 12px" name="goods_present" cols="20" required="required"></textarea></td>
                                                        <td>填写商品简介</td>
                                                        <td width="3%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <!-- 添加产品结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!-- 底部部分 -->
               <tr>
                <td valign="bottom" background="../images/Images/mail_left_bg.gif">
                    <img src="../images/Images/buttom_left.gif" width="17" height="17" />
                </td>
                <td background="../images/Images/buttom_bgs.gif">
                    <img src="../images/Images/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="../images/Images/mail_right_bg.gif">
                    <img src="../images/Images/buttom_right.gif" width="16" height="17" />
                </td>           
            </tr>
        </table>
        <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="../js/urlsqit.js"></script>
        <script>
        $('#forms').attr("action","/Shop-SSM/adminUpdateGoods.do?id="+GetQueryString("id"))
        
        $.ajax({

        	url : "/Shop-SSM/getIdGoods.do",
        	type : "post",
        	data : {
        		"id" : GetQueryString("id")
        	},
        	dataType : "json",
        	success : function (m) {
				$('#goods_name').val(m["goods_name"])
				$('#goods_unit').val(m["goods_unit"])
				$('#goods_stock').val(m["goods_stock"])
				$('#goods_price').val(m["goods_price"])
				$('#goods_present').html(m["goods_present"])
			}

        })
        
        </script>
    </body>
</html>