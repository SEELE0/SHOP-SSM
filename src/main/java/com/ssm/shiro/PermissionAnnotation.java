package com.ssm.shiro;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME) //运行时可以获取
@Target(ElementType.METHOD) //方法上
public @interface PermissionAnnotation {  // 权限注解
 
    String permissionName();

}