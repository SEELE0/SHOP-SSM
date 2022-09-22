package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssm.shiro.PermissionAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.UserP;
import com.ssm.service.inter.UserServiceInter;

@Controller
public class PlainUserHandler {
	@Autowired
	private UserServiceInter serviceInter;
	
	@RequestMapping("/login.do")
	@ResponseBody
	public String loginUsers(String users,String password) throws Exception {
		String states = serviceInter.login(users, password);
		return states;
	}
	@RequestMapping("/updateMagess.do")
	public String updateMagess(UserP userP) throws Exception {
		serviceInter.updateUsers(userP);
		return "redirect:/shop-user/user_center_info.jsp";
		
	}

	@RequestMapping("/update.do")
	public String update(UserP userP,HttpServletResponse response) throws Exception {
		serviceInter.updateUsers(userP);

//		response.sendRedirect("/Shop-SSM/admin/user_list.jsp");
		return "redirect:/admin/user_list.jsp";

	}

//	@RequestMapping("/match.do")
//	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
//		String username = (String)token.getPrincipal();
//		//retry count + 1
//		Element element = passwordRetryCache.get(username);
//		if(element == null) {
//			element = new Element(username , new AtomicInteger(0));
//			passwordRetryCache.put(element);
//		}
//		AtomicInteger retryCount = (AtomicInteger)element.getObjectValue();
//		if(retryCount.incrementAndGet() > 5) {
//			//if retry count > 5 throw
//			throw new ExcessiveAttemptsException();
//		}
//
//		boolean matches = super.doCredentialsMatch(token, info);
//		if(matches) {
//			//clear retry count
//			passwordRetryCache.remove(username);
//		}
//		return matches;
//	}如果密码输入正确清除cache中的记录；否则cache中的重试次数+1，如果超出5次那么抛出异常表示超出重试次数了。


	@RequestMapping("/updatePwds.do")
	@ResponseBody//返回json数据
	public String updatePwds(UserP userP,String oldPwd) throws Exception{
		String state = serviceInter.updatePwds(userP,oldPwd);
		return state;
	}
	
	
	@RequestMapping("/shop-user/loginOut.do")
	public String loginOut(HttpServletRequest request,HttpServletResponse response) {
    System.out.println("loginOut");
		//serviceInter.longOut(request, response);
		return "redirect:/shop-user/login.jsp";
	}
	
	
	@RequestMapping("/adminByidGetUser.do")
	@ResponseBody
	public String adminByidGetUser(Integer id) throws Exception{
		return serviceInter.AdminByIdPUser(id);
	}
	
	@RequestMapping(value="/adminGetByUsers.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String adminGetByUsers() throws Exception{
		return serviceInter.AdmingetByuser();
	}
	
	@RequestMapping(value="/adminDelsUsers.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	@PermissionAnnotation(permissionName="delete")
	public String adminDelsUsers(Integer id,Integer shiro_id)throws Exception{
		if(id==null||shiro_id==null) {
			return "<script>alert('非法请求！');location.href='/Shop-SSM/admin/index.jsp';</script>";
		}else {
			return serviceInter.AdminDleuser(id, shiro_id);
		}
		
	}
	
	
	@RequestMapping(value="adminOneByManyOrder.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String adminOneByManyOrder() throws Exception {
		return serviceInter.adminOnToMantyode();
	}
	
	
	@RequestMapping(value="/addPlainUsers.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String addPlainUsers(UserP userP) throws Exception{
		if(userP.getUsers()==null||userP==null) {//判断是否为空
			return "<script>alert('非法请求！');location.href='/Shop-SSM/shop-user/register.jsp';</script>";
		}else {
			boolean falg = serviceInter.addPlusers(userP);
			if(falg) {
				return "<script>alert('注册成功');location.href='/Shop-SSM/shop-user/login.jsp';</script>";
			}else {
				return "<script>alert('注册失败');location.href='/Shop-SSM/shop-user/register.jsp';</script>";
			}
		}
	}
	

}
