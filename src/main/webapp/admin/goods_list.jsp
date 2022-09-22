<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="../css/skin.css" />
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="../js/pages/css/layui.css">
    <link rel="stylesheet" href="../css/layer.css">

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
                                        <td valign="bottom"><h3 style="letter-spacing:1px;font-size: 14px">全部商品展示</h3></td>
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
                        
                        <!-- 产品列表开始 -->
                        <tr>
                            <td width="2%">&nbsp;</td>
                            <td width="96%">
                             <input id="checks" style="margin-left: 35px;position: relative;top: -10px;cursor:pointer;" type="checkbox" value="" />
                             <input id="ckdel" style="margin-left: 30px;position: relative;top: -10px;font-size: 12px;border-radius: 10%;cursor:pointer;" type="button" value="删除"/>
                                <table width="100%">
                               
                                    <tr>
                                        <td colspan="2">
                                            <form action="" method="">
                                            
                                                <table width="100%"   class="cont tr_color" id="goods">
                                                    <tr>
                                                        <th>选中</th>
                                                        <th>排序</th>
                                                        <th>商品名称</th>
                                                        <th>商品价格</th>
                                                        <th>商品分类</th>
                                                        <th>商品库存</th>
                                                        <th>商品单位</th>
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
                        <!-- 产品列表结束 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                          <td width="2%">&nbsp;</td>
                            <td width="51%" class="left_txt">
                            <div id="page"></div>
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
         <script type="text/javascript" src="../js/pages/layui.js"></script>
         <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<%--          <script type="text/javascript" src="../js/Js/GoodsList.js"></script>--%>
          <script type="text/javascript" src="../js/layer.js"></script>
          <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    </body>

<script>

    $(function() {

        var str = ""
        var counts = 0

        $.ajax({
            url : "/Shop-SSM/AdminGetCounts.do",
            type : "get",
            dataType : "json",
            success : function(m) {
                counts = m.count
                pages_();//防止每次刷新时，值不能及时赋值进去

            }
        });

        goodsPage(0)


        function goodsPage(n) {
            $.ajax({
                url : "/Shop-SSM/adminListPage.do",
                type : "post",
                data : {
                    "num" : n
                },
                dataType : "json",
                success : function(m) {
                    console.log(m)
                    lists_(m)
                    $('#goods').append(str)
                    dels()
                }

            })

        }



        function lists_(arry) {
            var num=1
            for(var i in arry){
                str+="<tr align='center' class='d godlist'>"
                str+="<td><input class='ck' type='checkbox' value='"+arry[i]["id"]+"' /></td>"
                str+="<td>"+(num++)+"</td>"
                str+="<td>"+arry[i]["goods_name"]+"</td>"
                str+="<td>"+arry[i]["goods_price"]+"</td>"
                str+="<td>"+arry[i]["goodsType"]["type_name"]+"</td>"
                str+="<td>"+arry[i]["goods_stock"]+"/件</td>"
                str+="<td>"+arry[i]["goods_unit"]+"</td>"
                str+="<td><a href='goods_update.jsp?id="+arry[i]["id"]+"'>修改</a>";
                var l2 = "<shiro:hasPermission name='delete'>&nbsp;&nbsp;&nbsp;&nbsp;<a class='del' rel='" + arry[i]["id"] + "' href='javascript:;'>删除</a></shiro:hasPermission>";
                str+=l2;
                str+="</td></tr>"
            }

        }

        function pages_() {
            layui.use('laypage', function(){
                var laypage = layui.laypage;
                //执行一个laypage实例
                laypage.render({
                    elem: 'page' //注意，这里的 page 是 ID，不用加 # 号
                    ,count: counts //数据总数，从服务端得到
                    ,limit :8//每页显示的条数
                    ,groups :3//显示的按钮数量
                    ,jump: function(obj, first){//触发分页后的回调
                        if(!first){//点击跳页触发函数自身，并传递当前页：obj.curr
                            $('.godlist').text('');
                            str = "";
                            goodsPage((obj.curr-1)*8);//obj.curr是当前页，从1开始计数
                        }
                    }
                });
            });
        }

        function dels() {
            $(".del").click(function(){
                var ids = $(this).attr("rel");
                layer.open({
                    icon:3,
                    content:"确认删除 ID 为："+$(this).attr("rel")+" 的信息吗？",
                    title:"确认删除",
                    btn: ['确定', '取消'],
                    yes: function(index, layero){
                        $.ajax({
                            url : "/Shop-SSM/adminDelgoods.do",
                            type : "post",
                            data:{
                                "id" : ids,
                                "shiro_id" : eval("(" + $.cookie('admin-users') + ")")['admin_shiro']
                            },
                            dataType : "json",

                            complete: function (XMLHttpRequest) {
                                console.log(XMLHttpRequest)
                                var redirect = XMLHttpRequest.getResponseHeader("SESSIONSTATUS");  //获取响应头中的跳转地址
                                if(redirect === "TIMEOUT"){
                                    window.location.href = "/Shop-SSM/admin/goods_list.jsp";
                                }
                            },

                            success : function (m) {
                                console.log(m)
                                if(m.state==-1){
                                    layer.msg("您的权限不足，无法删除",{
                                        icon:5,time:3000
                                    });
                                }else if(m.state==1){
                                    layer.msg("删除成功",{
                                        icon:1,time:2000
                                    });
                                    setTimeout("location.href='goods_list.jsp'",1500);
                                }else{
                                    layer.msg("删除失败",{
                                        icon:5,time:3000
                                    });
                                }
                            }
                        });

                    }
                    ,btn2: function(index, layero){
                        layer.msg("已取消",{
                            icon:2,time:1000
                        });
                    }
                });
                return false;
            });
        }

        $('#checks').click(function() {//全选/反选
            $('.ck').each(function(index,element) {
                if($('#checks').is(':checked')){
                    $('.ck').get(index).checked=true;
                }else{
                    $('.ck').get(index).checked=false;
                }
            })
        })

        var sum = 0;
        $('#ckdel').click(function() {
            var num ="";
            $('.ck').each(function(index,element) {
                if($('.ck').get(index).checked){
                    sum++;
                    num+=$(this).val()+","
                }
            })
            if(sum==0){
                layer.msg('请先选中数据', {icon: 5,time: 800});
                return false;
            }else{
                layer.open({
                    icon:3,
                    content:"确认删除该"+sum+"条信息吗？",
                    title:"确认删除",
                    btn: ['确定', '取消'],
                    yes: function(index, layero){
                        $.ajax({
                            url : "/Shop-SSM/admindelsGood.do",
                            type : "post",
                            data:{
                                "ids" : num,
                                "shiro_id" : eval("(" + $.cookie('admin-users') + ")")['admin_shiro']
                            },
                            dataType : "json",
                            success : function (m) {

                                if(m.state==-1){
                                    layer.msg("您的权限不足，无法删除",{
                                        icon:5,time:3000})
                                }else if(m.state==1){
                                    layer.msg("删除成功",{
                                        icon:1,time:2000
                                    });
                                    setTimeout("location.href='goods_list.jsp'",1500);
                                }else{
                                    layer.msg("删除失败",{
                                        icon:5,time:3000
                                    });
                                }
                            }
                        });

                    }
                    ,btn2: function(index, layero){
                        sum = 0;
                        num = "";
                        layer.msg("已取消",{
                            icon:2,time:1000
                        });
                    }
                });
            }
        })

    })

</script>
</html>