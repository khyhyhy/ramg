package com.kdt.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class LoginController {

    @Autowired
    private LoginService ls;

    @Autowired
    private HttpSession session;

    @GetMapping("login")
    public String login() {
        return "/login/login";
    }

    @PostMapping("login")
    public ModelAndView login(String m_email, String m_pw, String m_class) {
        ModelAndView mv = new ModelAndView();

        System.out.println(m_email + "m_email");
        System.out.println(m_pw + "m_pw");
        System.out.println(m_class + "m_class");

        MemVO vo = ls.login(m_email, m_pw, m_class);

        // 로그인이 되었다면 vo가 null이 아니므로 세션에 저장!!
        if (vo != null) {
            session.setAttribute("mvo", vo);
            mv.setViewName("redirect:/main/");
        } else
            mv.setViewName("/login/login");
        return mv;
    }

    @RequestMapping("logout")
    public ModelAndView logout() {
        ModelAndView mv = new ModelAndView();
        session.removeAttribute("mvo");
        mv.setViewName("redirect:/main/");
        return mv;
    }

    @RequestMapping("sign")
    public ModelAndView sign(String m_class) {
        ModelAndView mv = new ModelAndView();

        if (m_class == "0" || m_class == "2")
            mv.setViewName("redirect:/car_mt");

        else
            mv.setViewName("redirect:login");

        return mv;
    }
}
