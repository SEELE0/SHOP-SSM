package com.ssm.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Time {
	
	/**
	 *获取时间
	 * @return
	 */
	public static String getTimes() {
		Date d = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //设置日期格式
		String udata = sf.format(d);  //获取当前时间
		return udata;
	}
	
	/**
	 * 将时间定义为订单
	 * @return
	 */
	public static int getTimeCode() {
		int romd =  (int) ((Math.random()*(99999999-10000000))+10000000);//生成随机数
		
		return 	romd;
	}
	

}
