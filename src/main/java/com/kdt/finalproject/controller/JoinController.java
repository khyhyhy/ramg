package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.CarVO;
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
    @ResponseBody // 이 어노테이션은 응답을 JSON 형식으로 반환시킨다.

    public Map<String, Object> add_mem(MemVO mvo) {

        Map<String, Object> response = new HashMap<>();

        System.out.println(mvo.getM_email() + "M_EMAIL");
        // mvo.setM_phone(mPhone); // 추가

        int cnt = ls.add_mem(mvo);

        if (cnt > 0) {
            response.put("success", true);
            response.put("message", "회원가입을 축하합니다. 로그인 해주세요.");
        } else {
            response.put("success", false);
            response.put("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
        }

        return response;
    }

    // public ModelAndView add_mem(MemVO vo) {
    // ModelAndView mv = new ModelAndView();

    // int cnt = ls.add_mem(vo);

    // //System.out.println(vo.getM_class() + ": m_class");
    // //System.out.println(vo.getM_idx() + ": m_idx");

    // mv.addObject("mvo", vo);

    // //System.out.println("cnt: " + cnt);

    // if (cnt > 0) {
    // mv.addObject("message", "회원가입을 축하합니다. 로그인 해주세요.");
    // mv.setViewName("login/login");
    // } else {
    // mv.addObject("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
    // mv.setViewName("join");
    // }
    // return mv;
    // }

    // 일단 주석
    // @PostMapping("checkEmail")
    // @ResponseBody
    // public Map<String, String> check_email(@RequestParam String m_email) {
    // Map<String, String> map = new HashMap<>();

    // // System.out.println(m_email + "m_email");
    // MemVO mvo = ls.check_email(m_email);
    // // // System.out.println(mvo + "MVO");

    // // // mvo가 null이면 아이디를 사용가능!, null아니면 사용불가
    // if (mvo == null)
    // map.put("msg", "<span class='success'>사용가능</span>");
    // else
    // map.put("msg", "<span class='fail'>사용불가</span>");

    // return map;
    // }

    @PostMapping("checkEmail")
    @ResponseBody
    public Map<String, String> check_email(@RequestParam String m_email) {
        Map<String, String> map = new HashMap<>();

        // 이메일 형식이 올바르지 않은 경우
        if (!isValidEmailFormat(m_email)) {
            map.put("msg", "<span class='fail'>사용불가</span>");
        } else {
            MemVO mvo = ls.check_email(m_email);
            // mvo가 null이면 아이디를 사용가능!, null이 아니면 사용불가
            if (mvo == null) {
                map.put("msg", "<span class='success'>사용가능</span>");
            } else {
                map.put("msg", "<span class='fail'>사용불가</span>");
            }
        }

        return map;
    }

    // 이메일 형식 유효성 검사 메소드
    private boolean isValidEmailFormat(String email) {
        // 이메일 형식을 정규표현식을 사용하여 검사합니다.
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email.matches(emailRegex);
    }

    @PostMapping("checkPhone")
    @ResponseBody
    public Map<String, String> check_phone(MemVO vo) {

        // System.out.println(vo.getM_phone() + "M_PHONE");

        Map<String, String> map = new HashMap<>();

        MemVO mvo = ls.check_phone(vo.getM_phone());

        if (mvo == null)
            map.put("str", "<span class='success'>사용 가능한 번호입니다</span>");

        else
            map.put("str", "<span class='fail'>이미 등록된 번호입니다</span>");

        return map;

    }

}
