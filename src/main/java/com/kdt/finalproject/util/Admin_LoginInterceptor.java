package com.kdt.finalproject.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Admin_LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 로그인이 안된 상태라면 value에 false를 저장
        // 먼저 로그인 체크를 하기 위해 HttpSession을 얻어야 한다.
        HttpSession session = request.getSession(true);
        // true : 만약 session이 삭제된 상태라면 새로운 session을 생성
        // false : 삭제된 상태라면 session이 null값

        // 로그인 시 저장했던 객체(mvo)를 얻어낸다. 새롭게 생성되었다면 mvo null
        Object obj = session.getAttribute("mvo");
        if (obj == null) { // 로그인 하지않은 경우 - 현재 URL이 /sub/bravo 였고
            response.sendRedirect("/admin/login"); // 이때 login앞에 / 붙여야 한다.
            return false;
        }

        // 로그인 된 상태
        return true;

    }
}
