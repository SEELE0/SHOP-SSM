<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/skin.css"/>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- 头部开始 -->
    <tr>
        <td width="17" valign="top" background="../images/Images/mail_left_bg.gif">
            <img src="../images/Images/left_top_right.gif" width="17" height="29"/>
        </td>
        <td valign="top" background="./Images/content_bg.gif">
            <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0"
                   background="../images/Images/content_bg.gif">
                <tr>
                    <td height="31">
                        <div class="title">添加栏目</div>
                    </td>
                </tr>
            </table>
        </td>
        <td width="16" valign="top" background="./Images/mail_right_bg.gif"><img src="../images/Images/nav_right_bg.gif"
                                                                                 width="16" height="29"/></td>
    </tr>
    <!-- 中间部分开始 -->
    <tr>
        <!--第一行左边框-->
        <td valign="middle" background="../images/Images/mail_left_bg.gif">&nbsp;</td>
        <!--第一行中间内容-->
        <td valign="top" bgcolor="#F7F8F9">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <!-- 空白行-->
                <tr>
                    <td colspan="2" valign="top">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table>
                            <tr>
                                <td width="100" align="center"><img src="../images/Images/mime.gif"/></td>
                                <td valign="bottom"><h3 style="letter-spacing:1px;">查看商品类别</h3>
                                    <%--                                            <shiro:user>--%>
                                    <%--                                                欢迎[<shiro:principal/>]登录，<a href="${pageContext.request.contextPath}/logout">退出</a>--%>
                                    <%--                                            </shiro:user>--%>
                                    <shiro:hasPermission name='user:create'><a class='del' rel='"+arry[i]["id"]+"'
                                                                               href='javascript:;'>删除</a></shiro:hasPermission>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- 一条线 -->
                <tr>
                    <td height="40" colspan="4">
                        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- 商品分类开始 -->
                <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="96%">
                        <table width="100%">
                            <tr>
                                <td colspan="2">
                                    <form action="" method="">
                                        <table width="100%" class="cont tr_color" id="typs">
                                            <tr>
                                                <th>排序</th>
                                                <th>类别名称</th>
                                                <th>商品数量</th>
                                                <th>操作</th>
                                            </tr>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="2%">&nbsp;</td>
                </tr>
                <!-- 商品分类结束 -->
                <tr>
                    <td height="40" colspan="4">
                        <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td background="../images/Images/mail_right_bg.gif">&nbsp;</td>
    </tr>
    <!-- 底部部分 -->
    <tr>
        <td valign="bottom" background="../images/Images/mail_left_bg.gif">
            <img src="../images/Images/buttom_left.gif" width="17" height="17"/>
        </td>
        <td background="../images/Images/buttom_bgs.gif">
            <img src="../images/Images/buttom_bgs.gif" width="17" height="17">
        </td>
        <td valign="bottom" background="../images/Images/mail_right_bg.gif">
            <img src="../images/Images/buttom_right.gif" width="16" height="17"/>
        </td>
    </tr>
</table>

<script type="text/javascript" src="../js/pages/layui.all.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script>
    var str = ""
    $.ajax({

        url: "/Shop-SSM/getGoods.do",
        type: "get",
        dataType: "json",
        success: function (m) {
            type_list(m)
            $('#typs').append(str)
            dels();
        }
    });


    function type_list(arry) {
        var num = 1;
        for (var i in arry) {
            str += "<tr align='center' class='d'>"
            str += "<td>" + (num++) + "</td>"
            str += "<td>" + arry[i]["type_name"] + "</td>"
            str += "<td>" + arry[i]["lists"].length + "</td>"
            str += " <td><a id='cc' href='update_type.jsp?id=" + arry[i]["id"] + "'>编辑</a>"

            var l2 = "<shiro:hasPermission name='delete'>&nbsp;&nbsp;&nbsp;&nbsp;<a class='del' rel='" + arry[i]["id"] + "' href='javascript:;'>删除</a></shiro:hasPermission>";
            str = str + l2 + "</td></tr>";
        }
    }


    function dels() {
        $(".del").click(function () {
            var ids = $(this).attr("rel");
            layer.open({
                icon: 3,
                content: "确认删除 ID 为：" + $(this).attr("rel") + " 的信息吗？",
                title: "确认删除",
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    $.ajax({
                        url: "/Shop-SSM/del_types.do",
                        type: "post",
                        data: {
                            "id": ids,
                            "shiro_id": eval("(" + $.cookie('admin-users') + ")")['admin_shiro']
                        },
                        dataType: "json",
                        complete: function (XMLHttpRequest) {  //请求完成后最终执行参数
                            console.log(XMLHttpRequest) //输出 XMLHttpRequest 对象
                            var redirect = XMLHttpRequest.getResponseHeader("SESSIONSTATUS");  //获取响应头中的跳转地址
                            if(redirect === "TIMEOUT"){
                                window.location.href = "/Shop-SSM/admin/goods_sort.jsp";
                            }
                        },
                        success: function (m) {
                            console.log(m)
                            if (m.state == -1) {
                                layer.msg("您的权限不足，无法删除", {
                                    icon: 5, time: 3000
                                });
                            }
                            // else if (m.state == 0) {
                            //     layer.msg("删除失败，该分类下有商品，请先转移", {
                            //         icon: 5, time: 3000
                            //     });
                            // }
                            // else if (m.state == 1) {
                            //     layer.msg("删除成功", {
                            //         icon: 1, time: 2000
                            //     });
                            //     setTimeout("location.href='goods_sort.jsp'", 1500);
                            //
                            // }
                            else if (m.state === 0||1) {
                                layer.msg("删除成功", {
                                    icon: 1, time: 2000
                                });
                                setTimeout("location.href='goods_sort.jsp'", 1500);

                            }
                            else {
                                layer.msg("删除失败", {
                                    icon: 5, time: 3000
                                });
                            }
                        }
                    });

                }
                , btn2: function (index, layero) {
                    layer.msg("已取消", {
                        icon: 2, time: 1000
                    });
                }
            });
            return false;
        });
    }


</script>
</body>
</html>