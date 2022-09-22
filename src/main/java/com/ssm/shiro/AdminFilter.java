package com.ssm.shiro;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminFilter implements Filter {
  @Override
  public void init(FilterConfig filterConfig) throws ServletException {}

  /***
   * @Description: doFilter方法专门用于拦截请求（可以做权限检查），过滤响应。
   * @Param:  [servletRequest, servletResponse, filterChain]
   * @return: void
   */
  @Override
  public void doFilter(  //前台过滤(配置文件在web.xml)
      ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
      throws IOException, ServletException {

    HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
    HttpServletResponse response = (HttpServletResponse) servletResponse;
    String url = httpServletRequest.getRequestURI();
    HttpSession session = httpServletRequest.getSession();
    Object user = session.getAttribute("shop-users");
    System.out.println(url);
    if (user == null) {
      response.setContentType("text/html;charset=utf-8");
      response
          .getWriter()
          .write(
              "<script>alert('请先登录再访问！');location.href='/Shop-SSM/shop-user/login.jsp';</script>");
      return;
    } else {
      // 让 程 序 继 续 往 下 访 问 用 户 的 目 标 资 源
      filterChain.doFilter(servletRequest, servletResponse);
    }
  }

  @Override
  public void destroy() {}
}
