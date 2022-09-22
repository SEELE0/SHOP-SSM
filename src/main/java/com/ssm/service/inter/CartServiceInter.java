package com.ssm.service.inter;

import com.ssm.po.GoodsCart;
import java.util.List;

public interface CartServiceInter {
	
	String addCart(GoodsCart cart) throws Exception; 
	
	String findUserIdC(Integer id) throws Exception;
	
	String delByid(Integer id)  throws Exception;
	
	String delByIdS(String str);

	String getByIdGoodsCartId(List<Integer> cartIds);

}
