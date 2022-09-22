package com.ssm.controller;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.GoodsCart;
import com.ssm.service.inter.CartServiceInter;

@Controller
public class CartHandler {
	
	@Autowired
	private CartServiceInter cartInter;
	
	
	@RequestMapping("/addCrat.do")
	@ResponseBody
	public String addCrat(GoodsCart cart) throws Exception {
//		System.out.println(cart);
		return cartInter.addCart(cart);
	}
	
	@RequestMapping(value="/getUserIdC.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String getUserIdC(Integer id) throws Exception {
		
		return cartInter.findUserIdC(id);
	}
	
	@RequestMapping(value="/delByid.do")
	@ResponseBody
	public String delByid(Integer id) throws Exception {
		return cartInter.delByid(id);
	}
	
	@RequestMapping(value="/delByIdsA.do")
	@ResponseBody
	public String delByIdsA(String ids) throws Exception {
		return cartInter.delByIdS(ids);
	}

	@RequestMapping(value="/getByIdGoodsCartId.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String getByIdGoodsCartId(String cartIds) throws Exception {
		System.out.println(cartIds);
		List<Integer> cartIdList = Arrays.stream(cartIds.split(",")).map(Integer::parseInt).collect(java.util.stream.Collectors.toList());//将字符串转换为数组
		return cartInter.getByIdGoodsCartId(cartIdList);
	}

}
