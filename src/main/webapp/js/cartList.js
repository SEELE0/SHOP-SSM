$(function () {
    var str = "";
    var cc = 0;
    var checkID = new Array();
    $.ajax({
        url: "/Shop-SSM/getUserIdC.do",
        type: "post",
        data: {
            "id": eval("(" + $.cookie('shop-users') + ")")['id']
        },
        dataType: "json",
        success: function (m) {//后端返回GoodsCart对象的集合
            console.log(m)
            $('#ems').html(m.length)
            $('#countB').html(m.length)
            lists(m);
            $('#cart_lists').append(str)
            $('#count_prices').html(cc)
            dd();
        }

    })

  pay =  function () {
        console.log("1111111111111111:",checkID);
        localStorage.setItem("GoodsCartIds",checkID.toString());//将购物车id存入本地存储（缓存）
        console.log(localStorage.getItem("GoodsCartIds"));

      $('#jiesu').attr('href','place_order.jsp?id='+eval("(" + $.cookie('shop-users') + ")")['id'])//跳转到结算页面
    }

    flushIdsP = function () {
        $("input[name='goodsCartId']").change(function(){ //绑定change事件
            cc=0;
            checkID = [];
            $("input[name='goodsCartId']:checked").each(function (i) {//把所有被选中的复选框的值存入数组

            checkID[i] = $(this).val(); // id数组

        });

        $(".idsp").each(function (index, domEle) {
            if (checkID.includes($(this).attr("alt"))) {  //如果数组中有该商品的id，则计算总价
                console.log($(this).attr("alt"))
                cc = cc + Number($(this).text());
            }
        })
        $('#count_prices').text(cc)

        })//
    }

    function lists(arry) {
        for (var i in arry) {
            str += "<ul class='cart_list_td clearfix'>"
            str += "<li class='col01'><input type='checkbox' value='" + arry[i]["id"] + "' name='goodsCartId' onclick='flushIdsP()'></li>"

            str += "<li class='col02'><img  src='../images/" + arry[i]["goods_img"] + "'></li>"

            str += "<li class='col03' >" + arry[i]["goods_name"]  + "</li>"
            // str += "<li class='col03'>" + arry[i]["goods_name"] + "<br><em>" + arry[i]["goods_price"] + "/" + arry[i]["goods_unit"] + "</em></li>"
            str += "<li class='col04'>" + arry[i]["goods_unit"] + "</li>"
            str += "<li class='col05'>" + arry[i]["goods_price"] + "元</li>"
            str += "<li class='col06'>" + arry[i]["goods_num"] + "</li>"
            str += "<li class='col07'><a class='idsp' alt='" + arry[i]["id"] + "'>" + ((Number(arry[i]["goods_price"])) * (Number(arry[i]["goods_num"]))).toFixed(2) + "</a>元</li>"
            var l2 = "<shiro:hasPermission name='delete'>&nbsp;&nbsp;&nbsp;&nbsp;<a class='cart_del' rel='" + arry[i]["id"] + "' href='javascript:;'  style='color:red'>删除</a></shiro:hasPermission>";
            str += "<li class='col08 '>" + l2 + "</li>"
            str += "</ul>"
        }
    }

    function dd() {//删除
        $(".cart_del").click(function () {
            var ids = $(this).attr("rel");
            layer.open({
                icon: 3,
                content: "确认删除 ID 为：" + $(this).attr("rel") + " 的信息吗？",
                title: "确认删除",
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    $.ajax({
                        url: "/Shop-SSM/delByid.do",
                        type: "post",
                        data: {
                            "id": ids,
                        },
                        dataType: "json",
                        success: function (m) {
                            if (m.state == 1) {
                                layer.msg("删除成功", {
                                    icon: 1, time: 2000
                                });
                                setTimeout("location.href='cart.jsp'", 1000);
                            } else {
                                layer.msg('删除失败', {icon: 5, time: 800});
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


    $('#btn_check').click(function () {//全选/反选
        var $listc = $('#cart_lists input:checkbox');
        $listc.each(function (index, element) {
            if ($('#btn_check').prop('checked')) {
                $listc.get(index).checked = true;
            } else {
                $listc.get(index).checked = false;
            }
        });
    });


    var num = 0;
    $('#btn').click(function () {
        var arr = "";
        var $listc = $('#cart_lists input:checkbox');
        $listc.each(function (index, element) {
            if ($listc.get(index).checked) {
                num++;
                arr += $(this).val() + ",";//拼接值
            }
        });

        if (num == 0) {
            layer.msg('请先选中数据', {icon: 5, time: 800});
            return false;
        } else {
            layer.open({
                icon: 3,
                content: "确认删除该" + num + "条信息吗？",
                title: "确认删除",
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                    $.ajax({
                        url: "/Shop-SSM/delByIdsA.do",
                        type: "post",
                        data: {
                            "ids": arr
                        },
                        dataType: "json",
                        success: function (m) {
                            if (m.state == 1) {
                                layer.msg("删除成功", {
                                    icon: 1, time: 2000
                                });
                                setTimeout("location.href='cart.jsp'", 1000);
                            } else {
                                layer.msg('删除失败', {icon: 5, time: 800});
                            }
                        }
                    });

                }
                , btn2: function (index, layero) {
                    num = 0;
                    arr = "";
                    layer.msg("已取消", {
                        icon: 2, time: 1000
                    });
                }
            });
        }
    })

})


