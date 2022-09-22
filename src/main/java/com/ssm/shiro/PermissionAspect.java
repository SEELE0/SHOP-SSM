//package com.ssm.shiro;
//
//@Aspect
//@Component
//public class PermissionAspect {
//
//  @Pointcut("@annotation(com.shyroke.daydayzhuan.util.PermissionAnnotation)")
//  private void permisson() {}
//
//  /**
//   * 给添加PermissionAnnotation注解的方法校验权限，而不必每个方法内都判断权限
//   *
//   * @param joinPoint
//   * @param permissionAnnotation
//   * @return
//   * @throws Throwable
//   */
//  @Around("permisson()&&@annotation(permissionAnnotation)")
//  public Object advice(ProceedingJoinPoint joinPoint, PermissionAnnotation permissionAnnotation)
//      throws Throwable {
//
//    R r = null;
//
//    r = (R) joinPoint.proceed();
//
//    String permissionName = permissionAnnotation.permissionName();
//
//    if (StringUtils.isEmpty(permissionName)) {
//      r.setFlag(false);
//      r.setMessage("权限名称不能为空");
//      return r;
//    }
//
//    // 校验当前登录用户是否有该权限
//    boolean isPermission = UserUtils.isPermission(permissionName);
//
//    if (!isPermission) {
//      r.setFlag(false);
//      r.setMessage("没有此操作权限！");
//    }
//
//    return r;
//  }
//}
