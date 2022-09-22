package com.ssm.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.TypeReference;
import com.ssm.dao.CartMapper;
import com.ssm.dao.UserMapper;
import com.ssm.po.GoodsCart;
import com.ssm.po.UserP;
import com.ssm.service.inter.CartServiceInter;

public class CartServiceImpl implements CartServiceInter {

    @Autowired
    private CartMapper carts;
    @Autowired
    private UserMapper usersm;

    @Override
    public String addCart(GoodsCart cart) throws Exception {
        Map<String, String> map = new HashMap<String, String>();// 创建map对象
        if (cart != null) {
            GoodsCart cartId = carts.findGetName(cart.getUsers_id(), cart.getGoods_name());
            //List<GoodsCart> lists = carts.findByUserId(cart.getUsers_id());
            if (cartId == null) {// 如果没有该商品，则添加
                int num = carts.addCart(cart);
                if (num > 0) {
                    map.put("state", "1");// 添加成功
                } else {
                    map.put("state", "0");
                }
            } else if (cartId != null) {// 如果有该商品，则修改数量
                cart.setId(cartId.getId());
                cart.setGoods_num(cartId.getGoods_num() + cart.getGoods_num());
                int nums = carts.updateByid(cart);
                if (nums > 0) {
                    map.put("state", "1");
                } else {
                    map.put("state", "0");
                }
            }
        } else {
            System.out.println("");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String findUserIdC(Integer id) throws Exception { //查询用户购物车
        List<GoodsCart> lists = carts.findByUserId(id);
        return JSON.toJSONString(lists);
    }

    @Override
    public String delByid(Integer id) throws Exception {
        Map<String, String> map = new HashMap<>();
        int num = carts.delByid(id);
        if (num > 0) {
            map.put("state", "1");
        } else {
            map.put("state", "0");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String delByIdS(String strs) {
        String[] str = strs.split(",");
        int num = carts.delByIdsArry(str);
        Map<String, String> map = new HashMap<>();
        if (num > 0) {
            map.put("state", "1");
        } else {
            map.put("state", "0");
        }
        return JSON.toJSONString(map);
    }

    @Override
    public String getByIdGoodsCartId(List<Integer> cartIds) {
        List<GoodsCart> lists = new ArrayList<GoodsCart>();
        for (Integer cartId : cartIds) {
            lists.add(carts.getByIdGoodsCartId(cartId));
        }
        return JSON.toJSONString(lists);
    }

    ;

}
