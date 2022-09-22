package com.ssm.service.inter;

import com.ssm.po.GoodsType;

public interface TypeServiceInter {
	
	/**
	 *
	 * @return
	 * @throws Exception
	 */
	String goodsIndex() throws Exception;  //商品首页
	/**
	 *
	 * @param id
	 * @param shiro_id
	 * @return
	 * @throws Exception
	 */
	String admin_delType(Integer id,Integer shiro_id) throws Exception;
	/**
	 *
	 * @param name
	 * @return
	 * @throws Exception
	 */
	boolean AdminAddType(GoodsType type) throws Exception;
	
	/**
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	String AdminGetIdType(Integer id) throws Exception;
	
	/**
	 *
	 * @param type
	 * @return
	 * @throws Exception
	 */
	boolean AdminUpdateTypes(GoodsType type) throws Exception;

//	/**
//	 *
//	 * @return
//	 * @throws Exception
//	 */
//	String goodsget() throws Exception;
}
