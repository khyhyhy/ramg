package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class JoinController {
    @Autowired
    private LoginService ls;

    @Autowired
    private HttpSession session;

    @GetMapping("join")
    public String join() {
        return "login/join";
    }

    @PostMapping("join")
    public ModelAndView add_mem(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        int cnt = ls.add_mem(vo);
        System.out.println(vo.getM_class() + "m_class");
        mv.addObject("mvo", vo);

        if (cnt > 0) {
            if (vo.getM_class() == "0" || vo.getM_class() == "2")
                mv.setViewName("mypage/car_mt");

            else
                mv.setViewName("login/login");
        } else
            mv.setViewName("join");
        return mv;
    }

    @PostMapping("checkEmail")
    @ResponseBody
    public Map<String, String> check_email(@RequestParam String m_email) {
        Map<String, String> map = new HashMap<>();
        MemVO mvo = ls.check_email(m_email);

        // mvo가 null이면 아이디를 사용가능!, null아니면 사용불가
        if (mvo == null)
            map.put("msg", "<span class='success'>사용가능</span>");
        else
            map.put("msg", "<span class='fail'>사용불가</span>");

        return map;
    }

}
