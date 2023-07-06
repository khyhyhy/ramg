package com.kdt.finalproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kdt.finalproject.util.Admin_LoginInterceptor;

@Configuration
public class Admin_WebConfig implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new Admin_LoginInterceptor())
        .order(1) // 적용할 순서 설정(첫번째)
        .addPathPatterns("/admin/*") // 적용할 패턴
        .excludePathPatterns("/admin/login"); // 제외할 패턴
  }

}
