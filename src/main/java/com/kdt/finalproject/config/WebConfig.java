package com.kdt.finalproject.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kdt.finalproject.util.LoginInterceptor;

public class WebConfig implements WebMvcConfigurer {

 @Override
 public void addInterceptors(InterceptorRegistry registry) {
  registry.addInterceptor(new LoginInterceptor())
    .order(1)
    .addPathPatterns("/info/reviewwrite");
 }

}
