<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/skin.css" />
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    
    <script type="text/javascript">
        function logout() {
            if(window.confirm('您确定要退出吗？')) {
                top.location = '/Shop-SSM/admin/LoginOut.do';
            }
        }       
    </script>
</head>
    <body>
        <table cellpadding="0" width="100%" height="64" background="../images/Images/top_top_bg.gif">
            <tr valign="top">
                <td width="50%"><a href="javascript:void(0)"></a></td>
                <td width="30%" style="padding-top:13px;font:15px Arial,SimSun,sans-serif;color:#FFF">管理员：<b id="names" style="color:red"></b> 您好，感谢登陆使用！</td>
                <td style="padding-top:10px;" align="center"><a id="indexs" href="javascript:void(0)"><img style="border:none" src="../images/Images/index.gif" /></a></td>
                <td style="padding-top:10px;" align="center"><a href="javascript:void(0)"><img style="border:none" src="../images/Images/out.gif" onclick="logout();" /></td>
            </tr>
        </table>
        <script type="text/javascript" src="../js/jquery.cookie.js"></script>
        <script>
        $('#indexs').click(function () {
        	 parent.location.reload();
		})
        $('#names').html(eval("(" + $.cookie('admin-users') + ")")["admin_name"])
        </script>
    </body>
</html>