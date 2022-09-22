<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>--%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <title>购物商城后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        function login_success() { //取cookie，未登录跳转到登录页面
            console.log($.cookie('admin-users') == null)
            if ($.cookie('admin-users') == null) {
                window.location.href = "/Shop-SSM/admin/login.jsp";
            }
        }
        login_success();
    </script>
</head>
<frameset  rows="64,*"  frameborder="no" border="0" framespacing="0">
    <!--头部-->
    <frame src="./top.jsp" name="top" noresize="noresize" frameborder="0"  scrolling="no" marginwidth="0" marginheight="0" />
    <!--主体部分-->
    <frameset cols="185,*">
        <!--主体左部分-->
        <frame  src="./left.jsp" name="left" noresize="noresize" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" />
        <!--主体右部分-->
        <frame src="./main.jsp" name="main" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" />
</frameset>
</frameset>
</html>