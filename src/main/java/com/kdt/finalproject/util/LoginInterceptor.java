package com.kdt.finalproject.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
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
