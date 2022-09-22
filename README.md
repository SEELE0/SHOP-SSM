SSM+shiro框架编写的线上游戏商城小项目，具有简单的权限控制 前端页面框架结构参考了项目https://github.com/Snykta/Shop-SSM

# Shop-SSM

tomcat版本：9.0.52

前台地址：`http://localhost:8080/Shop-SSM/shop-user/`

后台地址：`http://localhost:8080/Shop-SSM/admin`

##主要功能
* ##### 前台
   ###### 1. 登录(对输入的数据进行md5加密后和数据库内容比对)有时间可以改写成插盐的加密模式
    ###### 2. 注册(注册过程用md5加密后存储在数据库)
    ###### 3. 商品显示
    ###### 4. 商品详情
    ###### 5. 购物车(改进点实现对购物车商品进行选择来结算价格而不是结算购物车中全部商品)
    ###### 6. 支付订单
    ###### 7. 我的订单
    ###### 8. 个人用户信息修改
* ##### 后台
   ###### 1. 登录
    ###### 2. 用户管理
    ###### 3. 商品管理
    ###### 4. 订单管理 
    ###### 5. 类别管理
    ###### 6. shiro权限控制，对不同权限管理员设置不同权限不具备相应权限的管理员不显示删除按钮



## 后台删除操作相关html有
*路径都在webapp/admin目录下*


* goods_list.html（商品管理）
* goods_sort.html（商品类别管理）
* （订单管理）
````
  orders_yifa.html，(已发货订单)
  orders_weifa.html，(未发货订单)
  orders_dai.html，(待付款订单)
  orders_yi.html.(已付款订单)
````
* （用户管理）
  user_list.html
* (会员订单)
  user_ordes_xi.html


[//]: # (## 访问控制js代码)

[//]: # (相关js代码都定义成dels（）方法。)

[//]: # (相关js文件在webapp/js/Js目录下)

[//]: # ()
[//]: # (**（也有一部分dels&#40;&#41;方法直接定义在上述html中）**)

[//]: # ()
[//]: # ()
[//]: # (```js)

[//]: # (        function dels&#40;&#41; {)

[//]: # (    $&#40;".del"&#41;.click&#40;function&#40;&#41;{)

[//]: # (        var ids = $&#40;this&#41;.attr&#40;"rel"&#41;;)

[//]: # (        layer.open&#40;{)

[//]: # (            icon:3,)

[//]: # (            content:"确认删除 ID 为："+$&#40;this&#41;.attr&#40;"rel"&#41;+" 的信息吗？",)

[//]: # (            title:"确认删除",)

[//]: # (            btn: ['确定', '取消'],)

[//]: # (            yes: function&#40;index, layero&#41;{)

[//]: # (                $.ajax&#40;{)

[//]: # (                    url : "/Shop-SSM/del_types.do",)

[//]: # (                    type : "post",)

[//]: # (                    data:{)

[//]: # (                        "id" : ids,)

[//]: # (                        "shiro_id" : eval&#40;"&#40;" + $.cookie&#40;'admin-users'&#41; + "&#41;"&#41;['admin_shiro'])

[//]: # (                    },)

[//]: # (                    dataType : "json",)

[//]: # (                    success : function &#40;m&#41; {)

[//]: # (                        console.log&#40;m&#41;)

[//]: # (                        if&#40;m.state==-1&#41;{)

[//]: # (                            layer.msg&#40;"您的权限不足，无法删除",{)

[//]: # (                                icon:5,time:3000)

[//]: # (                            }&#41;;)

[//]: # (                        }else if&#40;m.state==0&#41;{)

[//]: # (                            layer.msg&#40;"删除失败，该分类下有商品，请先转移",{)

[//]: # (                                icon:5,time:3000)

[//]: # (                            }&#41;;)

[//]: # (                        }else if&#40;m.state==1&#41;{)

[//]: # (                            layer.msg&#40;"删除成功",{)

[//]: # (                                icon:1,time:2000)

[//]: # (                            }&#41;;)

[//]: # (                            setTimeout&#40;"location.href='goods_sort.html'",1500&#41;;)

[//]: # ()
[//]: # (                        }else{)

[//]: # (                            layer.msg&#40;"删除失败",{)

[//]: # (                                icon:5,time:3000)

[//]: # (                            }&#41;;)

[//]: # (                        })

[//]: # (                    })

[//]: # (                }&#41;;)

[//]: # ()
[//]: # (            })

[//]: # (            ,btn2: function&#40;index, layero&#41;{)

[//]: # (                layer.msg&#40;"已取消",{)

[//]: # (                    icon:2,time:1000)

[//]: # (                }&#41;;)

[//]: # (            })

[//]: # (        }&#41;;)

[//]: # (        return false;)

[//]: # (    }&#41;;)

[//]: # (})


[//]: # (```)
## 权限控制相关的类
````
ActionInterceptor：   拦截器，用于控制权限
AdminFilter：         管理员过滤器，用于控制管理员权限
MyRealm：             自定义的认证类，用于认证用户
PermissionAnnotation：权限注解，用于控制权限
````
[//]: # (````)

[//]: # (* ShiroHandler.java&#40;在controller/admin目录下&#41;)

[//]: # (* 数据库相关操作AdminShiro.java)

[//]: # (* shiros.jaba&#40;在enums目录下&#41;)

[//]: # (* AdminShiroS.java&#40;在po目录下&#41;)

[//]: # ()
[//]: # (具体函数方法在各个实现接口类中以Admindel开头)

[//]: # (例如GoodsServiceImpl类中的AdmindelGoods&#40;&#41;方法)

[//]: # (````)


<!-- ## shiro md5加密
```java
new Md5Hash().toString(); //进行加密
```

[//]: # (# 存在问题)

[//]: # (````)

[//]: # (下单时没有对库存进行更改&#40;place_order.jsp&#41;)

[//]: # ()
[//]: # (````)

# 改进点
````
商品购物车结算功能可以根据自己选中的商品进行结算(通过设置页面缓存来维持数据到下一页)
添加shiro框架
```` -->
