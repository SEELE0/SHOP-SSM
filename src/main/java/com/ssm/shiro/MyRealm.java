package com.ssm.shiro;

import com.ssm.po.AdminShiroS;
import com.ssm.po.AdminUser;
import com.ssm.service.inter.ShiroServiceInter;
import com.ssm.service.inter.admin.AdminUserServiceInter;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;
import java.util.ArrayList;

public class MyRealm extends AuthorizingRealm {//继承AuthorizingRealm类

  @Resource private AdminUserServiceInter adminUserServiceInter;
  @Resource // 角色
  private ShiroServiceInter permissionService;

  /**
   * 授权
   *
   * @param principals
   * @return
   */
  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    // 获取认证后的用户信息（登录adminlogin.do里传输的用户信息）
    String user = (String) principals.getPrimaryPrincipal();

    // 根据用户id查询对应的权限
    String adminShiroById = permissionService.getAdminShiroById(user);//从数据库数据库表获取权限信息
    SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();  //默认权限
    ArrayList stringList = new ArrayList();
    stringList.add("add");
    stringList.add("update");
    if ("1".equals(adminShiroById)) {// 超级管理员
      stringList.add("delete");//具有删除权限，在前端jsp使用shiro注解来显示删除按钮<shiro:hasPermission name='delete'>
    }
    info.addStringPermissions(stringList);//添加权限
    return info;  // 返回授权信息
  }

  /**
   * 认证功能
   *
   * @param token
   * @return
   * @throws AuthenticationException
   */
  //    @Override
  //    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws
  // AuthenticationException {
  //        //获取账号
  //        String username = token.getPrincipal().toString();
  //        //调用根据用户名查询用户信息的方法
  //        AdminUser adminUser = new AdminUser();
  //                //adminUserServiceInter.GetAdminsByUsername(username);
  //        if (adminUser !=null){
  //            ByteSource salt = ByteSource.Util.bytes("");
  //            SimpleAuthenticationInfo info = new
  // SimpleAuthenticationInfo(adminUser.getAdmin_user(), adminUser.getAdmin_pwd(),salt ,
  // this.getName());
  //            return info;
  //        }
  //        return null;
  //    }
  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
      throws AuthenticationException {//身份认证器
    // 获取用户令牌
    UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;
    // 用户名
    String inputUserName = usernamePasswordToken.getUsername();
    // 密码
    String inputPassword = new String(usernamePasswordToken.getPassword());
    // 创建User对象
    AdminUser user = new AdminUser();
    user.setAdmin_user(inputUserName);
    user.setAdmin_pwd(inputPassword);
    //        //认证成功
    //        if (userList!=null && userList.size()>0){
    //            User outUser=userList.get(0);
    //            String userId="";
    SimpleAuthenticationInfo simpleAuthenticationInfo =
        new SimpleAuthenticationInfo(
            String.valueOf(user.getAdmin_user()), user.getAdmin_pwd(), "MyRealm");
    return simpleAuthenticationInfo;
    //        }else {
    //            throw new AuthenticationException("认证失败");
    //
    //        }
  }
}
