package com.kdt.finalproject.util;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
  HttpSession session = request.getSession(true); // true의 의미는 세션이 삭제된 경우일 경우 새로운

  Object obj = session.getAttribute("mvo");
  if (obj == null) {
   System.out.println("인터셉터 obj가 널임");
   response.sendRedirect("/login");
   return false;
  }

  return true;
 }
}
