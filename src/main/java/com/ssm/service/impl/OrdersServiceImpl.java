package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssm.po.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ssm.dao.OrdersMapper;
import com.ssm.enums.Shiros;
import com.ssm.po.GoodsOrders;
import com.ssm.service.inter.OrdersServiceInter;
import com.ssm.util.Time;

public class OrdersServiceImpl implements OrdersServiceInter {
	
	@Autowired
	private OrdersMapper orderMapper;//订单dao

	@Override
	public String getCounts(Integer num) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("state", orderMapper.getCount(num));
		return JSON.toJSONString(map);
	}

	@Override
	public String FenyeList(Integer page,Integer shiro_id) throws Exception {
		List<GoodsOrders> lists = orderMapper.FenyeList(page, shiro_id);
		return JSON.toJSONString(lists);
	}

	@Override
	public String delByidOrders(Integer id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int num = orderMapper.deleteByidOrders(id);
		if(num>0) {
			map.put("state", "1");
		}else {
			map.put("state", "-1");
		}
		return JSON.toJSONString(map);
	}

	@Override
	public String PayOrders(Integer id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int num = orderMapper.PayOrders(id);
		if(num>0) {
			map.put("state", "1");
		}else {
			map.put("state", "-1");
		}
		return JSON.toJSONString(map);
	}

	@Override
	public String addOrders(String lists) throws Exception {
		Map<String, String> map = new HashMap<String, String>();//返回结果
		 String jsonSubStr = lists.substring(6, lists.length());  //去掉前面的json字符串
		 int sum = 1;
		 JSONArray array = JSONArray.parseArray(jsonSubStr);//转化为json数组

		 for(int i=0;i<array.size();i++) {//遍历json数组
			 JSONObject userJson = JSONObject.parseObject(array.getString(i));//获取每一个json对象   placeOrder.js orderslist函数创建的json对象
			 GoodsOrders goodsOrders = JSON.toJavaObject(userJson,GoodsOrders.class);//将json对象转换为实体类对象
			 System.out.println(goodsOrders);
//			GoodsOrders.getGoods_id();//获取每一个json对象的属性值
//			 Goods goods = new Goods();//根据商品id查询商品信息
//			 goods.setGoods_stock(String.valueOf(Integer.parseInt(goods.getGoods_stock())-goodsOrders.getGoods_num()));//库存减少
//			 goodsOrders.getGoods_num();//获取商品数量
			 goodsOrders.setOrder_date(Time.getTimes());//设置订单日期
			 goodsOrders.setOrder_code(Time.getTimeCode());//设置订单编号
			 goodsOrders.setOrder_state("未发货");//默认未发货
//			 Goods Orders = Orders.getGoods_stock();//查询商品库存
			 System.out.println(goodsOrders.getGoods_num());
			 System.out.println(goodsOrders.getGoods_id());

			 orderMapper.setStockByID(goodsOrders.getGoods_id(),goodsOrders.getGoods_num());//库存减少
			 orderMapper.delCart(goodsOrders.getOrder_userid(),goodsOrders.getGoods_id());//删除购物车

			  int num = orderMapper.addOrdersMappers(goodsOrders);//添加订单信息
			  sum = 1*num;
		 }
		
		if(sum>0) {
			map.put("state", "1");
		}else {
			map.put("state", "-1");
		}
		return JSON.toJSONString(map);
	}

	@Override
	public String adminDaipays(Integer status) throws Exception {
		List<GoodsOrders> lists = orderMapper.adminDaiOrWaitPay(status);
		return JSON.toJSONString(lists);
	}

	@Override
	public String adminDelsOrders(Integer id, Integer shiro_id) throws Exception {
		
		Map<String, String> map = new HashMap<String,String>();
		if(shiro_id!=Shiros.SuperAdmin.getCode()) {
			map.put("state", "-1");//权限不够
		}else {
			int num = orderMapper.deleteByidOrders(id);
			if(num>0) {
				map.put("state", "1");//删除成功
			}
		}
		return JSON.toJSONString(map);
	}

	@Override
	public String adminLogistics(String status) throws Exception {
		List<GoodsOrders> lists = orderMapper.adminlogisticsWait(status);
		return JSON.toJSONString(lists);
	}

	@Override
	public boolean adminFaOrdes(Integer id) throws Exception {
		boolean bol = false;
		if(id==null) {
			bol = false;
		}else {
			int num = orderMapper.adminFahuoOrders(id);
			if(num>0) {
				 bol = true;
			}else {
				bol = false;
			}
		}
		return bol;
	}

	@Override
	public String adminGetords(Integer id) throws Exception {
		List<GoodsOrders> lists = orderMapper.adminGetByorder_id(id);
		return JSON.toJSONString(lists);
	}

}
