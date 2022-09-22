package com.ssm.shiro;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ShiroLoginFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletResponse rep= (HttpServletResponse) response;
        rep.setCharacterEncoding("UTF-8");
        rep.setContentType("application/json");
//        ResultObj resultObj=new ResultObj("用户未登录");
        PrintWriter out = rep.getWriter();
        out.write("用户未登录");
        out.flush();
        out.close();
        return false;
    }
}

