package com.kdt.finalproject.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kdt.finalproject.util.Admin_LoginInterceptor;

public class Admin_WebConfig implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new Admin_LoginInterceptor())
        .order(1) // 적용할 순서 설정(첫번째)
        .addPathPatterns("/admin/*") // 적용할 패턴
        .excludePathPatterns("/test/*"); // 제외할 패턴
  }

}
