package com.ssm.shiro;

import com.ssm.interceptors.InterceptorCustom;
import org.apache.shiro.SecurityUtils;//
import org.apache.shiro.subject.Subject;//
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@Configuration
public class ActionInterceptor implements HandlerInterceptor {
    /**
     * 前置拦截，用于检查身份与权限
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

//        String url = request.getRequestURI();
//        System.out.println(url);
//        Object user=request.getSession().getAttribute("shop-users");
//        if (user == null) {
//            response.setContentType("text/html;charset=utf-8");
//            response.getWriter().write("<script>alert('请先登录再访问！');location.href='/Shop-SSM/shop-user/login.jsp';</script>");
//            return false;
//        }


        //从传入的handler中检查是否有AuthCheck的声明
        HandlerMethod method = (HandlerMethod) handler;

        //获取方法上的注解,用来使用注解来控制权限实现删除
        PermissionAnnotation clazzAnnotation = method.getMethod().getAnnotation(PermissionAnnotation.class);//获取类上的注解
        //PermissionAnnotation auth = method.getMethodAnnotation(PermissionAnnotation.class);
        //找到了，取出定义的权限属性，结合身份信息进行检查

        if (clazzAnnotation != null) {//如果类上有注解，则检查身份信息是否有权限访问
            //根据type与write，结合session/cookie等身份信息进行检查
            //如果权限检查不通过，可以输出特定信息、进行跳转等操作
            //并且一定要return false，表示被拦截的方法不用继续执行了
            String permissionName = clazzAnnotation.permissionName();//获取注解的值

            Subject subject = SecurityUtils.getSubject(); //获取当前用户身份信息（获取当前主体


            if (subject.isPermitted(permissionName)) {//检查是否有权限
                return true;
            } else {
                //授权失败重定向
                String homeUrl = request.getContextPath();//获取项目名称
//                response.setHeader("REDIRECT","true");
//                response.sendRedirect(request.getContextPath()+"/admin/admin401");
                //设置响应体内容
                response.setStatus(HttpServletResponse.SC_OK);//设置状态码为200，表示成功
                response.setHeader("SESSIONSTATUS", "TIMEOUT");//设置响应头信息，告诉客户端session过期
                response.setHeader("CONTEXTPATH", homeUrl + "/admin/login.jsp");//设置响应头信息，告诉客户端跳转到登录页面
                response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));//
                response.setHeader("Access-Control-Allow-Credentials", "true");//
                response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");//
                response.setHeader("Access-Control-Max-Age", "3600");//
                response.setHeader("Access-Control-Allow-Headers", "x-requested-with");//
                // FORBIDDEN，forbidden。也就是禁止、403

                //返回false，后面的流程也不用执行了，直接中断
                return false;
            }
        }

        //检查通过，返回true，方法会继续执行
        return true;
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
    }//后处理
     
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception) throws Exception {
    }//完成后



}