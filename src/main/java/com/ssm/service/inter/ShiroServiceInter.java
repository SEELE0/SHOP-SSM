package com.ssm.service.inter;

import com.ssm.po.AdminShiroS;

public interface ShiroServiceInter {
	
	/**
	 *
	 * @return
	 * @throws Exception
	 */
	String GetsShiros() throws Exception;
	/**
	 *
	 * @param shiroId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	boolean AdminUpdateShi(Integer shiroId,Integer userId) throws Exception;

    String getAdminShiroById(String user);
}
