package com.ssm.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.AdminUser;
import com.ssm.service.inter.admin.AdminUserServiceInter;

@Controller
@RequestMapping("/admin")
public class AdminUserHandler {
	
	@Autowired
	private AdminUserServiceInter adminInter;

	@GetMapping
	public String loginAdmin(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/login.jsp";
	}

	@GetMapping("admin401")
	public String admin401(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/401.jsp";
	}

	@RequestMapping(value="/adminLogin.do")
	public void adminLogin(AdminUser adminUser,HttpServletResponse response) throws Exception {
		boolean falg = adminInter.adminLogin(adminUser);

		if(falg) {
			//获取shiro的主体
			Subject subject = SecurityUtils.getSubject();
			//传入令牌对象
			UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(adminUser.getAdmin_user(), adminUser.getAdmin_pwd());
			subject.login(usernamePasswordToken);//跳转到shiro中登录配置的realm中的认证方法
			subject.hasRole(adminUser.getAdmin_user());//传输用户信息，获取权限角色
			subject.isAuthenticated();//判断是否认证通过,返回bool值
			response.sendRedirect("/Shop-SSM/admin/index.jsp");
		}else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().println("<script>alert('登录失败');location.href='/Shop-SSM/admin/login.jsp';</script>");
		}
	}
	
	
	@RequestMapping("/LoginOut.do")
	public String LoginOut(HttpServletRequest request,HttpServletResponse response) throws Exception {
//		adminInter.LoginOut(request, response);
		return "redirect:/admin/login.jsp";

	}
	
	@RequestMapping(value="/adminGets.do",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String adminGets() throws Exception{
		return adminInter.GetAdmins();
	}

}
