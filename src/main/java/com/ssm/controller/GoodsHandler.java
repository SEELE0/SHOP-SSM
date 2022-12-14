package com.ssm.controller;

import java.io.File;
import javax.servlet.http.HttpServletResponse;
import com.ssm.shiro.PermissionAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.po.Goods;
import com.ssm.service.inter.GoodsServiceInter;

@Controller
public class GoodsHandler {
	
	@Autowired
	private GoodsServiceInter goods;

	@RequestMapping(value="adminDelgoods.do")
	@ResponseBody
	@PermissionAnnotation(permissionName="delete")
	public String adminDelgoods(Integer id,Integer shiro_id) throws Exception {
		return goods.AdmindelGoods(id, shiro_id);
	}

	@RequestMapping(value="getIdGoods.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String getIdGoods(Integer id) throws Exception {
		String gods = goods.getIdGoods(id);
		return gods;
	}
	
	@RequestMapping(value="roundGoods.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String roundGoods() throws Exception {
		return goods.roundGoods();
	}
	
	@RequestMapping(value="getTypeIdlist.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String getTypeIdlist(Integer id) throws Exception {
		String lists = goods.getTypeIdList(id);
		return lists;
	}
	
	
	@RequestMapping(value="getByNames.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String getByNames(String name) throws Exception {
		return goods.secahByBanmes(name);
	}
	
	
	@RequestMapping(value="AdminGetCounts.do")
	@ResponseBody
	public String AdminGetCounts() throws Exception {
		return goods.AdminCounts();
	}
	
	@RequestMapping(value="adminListPage.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String adminListPage(Integer num) throws Exception {
		return goods.AdminManyToOne(num);
	}
	
	
	@RequestMapping(value="admindelsGood.do")
	@ResponseBody
	public String admindelsGood(String ids,Integer shiro_id) throws Exception {
		return goods.AdminDels(ids, shiro_id);
	}
	
	@RequestMapping("/adminUpdateGoods.do")
	public void adminUpdateGoods(Goods good,HttpServletResponse response) throws Exception{
		boolean falg = goods.AdminupdaGoods(good);
		if(falg) {
			response.sendRedirect("/Shop-SSM/admin/goods_list.jsp");
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("<script>alert('???????????????');location.href='/Shop-SSM/admin/goods_list.jsp';</script>");
		}
		
	}
	
	//???????????????????????????
	@RequestMapping("/AdminaddGoods.do")
	public void AdminaddGoods(Goods good,HttpServletResponse response,MultipartFile imgs) throws Exception{
		String oldImg  = imgs.getOriginalFilename();//????????????????????????
		if(imgs!=null && oldImg!=null && oldImg.length()>0) {//????????????????????????
//			String newImg = System.currentTimeMillis()+oldImg;//???????????????
//			String path = "D:/upload/";//????????????
//			File file = new File(path+newImg);//?????????
//			imgs.transferTo(file);//????????????
//			good.setImg(newImg);//??????????????????

//			String path = "D:\\apache-tomcat-9.0.52\\webapps\\test\\";  //??????
//			String path = "D:\\apache-tomcat-9.0.52\\webapps\\Shop-SSM\\images\\";  //??????
			String path = "D:\\apache-tomcat-9.0.52\\webapps\\Shop-SSM\\images\\";  //??????
//			String path = "D:\\upload";  //??????
			File file = new File(path+oldImg);
			imgs.transferTo(file);//????????????
			good.setGoods_img(oldImg);//?????????????????????????????????????????????????????????
		}
		boolean falg = goods.AdminAddGood(good); //????????????
		if(falg) {
			response.sendRedirect("/Shop-SSM/admin/goods_list.jsp"); //???????????????????????????
		}else {
			response.setContentType("text/html;charset=utf-8"); //??????????????????
			response.getWriter().println("<script>alert('???????????????');location.href='/Shop-SSM/admin/goods_list.jsp';</script>"); //??????????????????
		}
		
	}
	
	
	@RequestMapping("/adminGoodsBytype.do")
	public void adminGoodsBytype(Goods god,HttpServletResponse response) throws Exception {
		boolean falg = goods.adminUpdateByTypes(god);
		if(falg) {
			response.sendRedirect("/Shop-SSM/admin/goods_type_update.jsp");
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("<script>alert('???????????????');location.href='/Shop-SSM/admin/goods_list.jsp';</script>");
		}
		
	}
	
	
	

}
