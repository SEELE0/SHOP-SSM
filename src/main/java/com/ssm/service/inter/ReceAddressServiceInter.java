package com.ssm.service.inter;

import com.ssm.po.ReceAddress;

public interface ReceAddressServiceInter {
	
	/**
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	String getByIdAddress(Integer id) throws Exception;
	/**
	 *
	 * @param address
	 * @return
	 * @throws Exception
	 */
	String updateAddress(ReceAddress address) throws Exception; 

}
