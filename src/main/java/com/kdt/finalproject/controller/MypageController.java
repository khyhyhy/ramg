package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MypageService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class MypageController {

    @Autowired
    MypageService service;

    @Autowired
    HttpSession session;

    @GetMapping("car_list")
    public ModelAndView search_cw_list(String m_idx) {
        ModelAndView mv = new ModelAndView();

        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }

        List<CwriteVO> list = service.search_cw_list(m_idx);
        mv.addObject("car", list);
        mv.setViewName("mypage/car_list");

        return mv;
    }

    @GetMapping("my_question")
    public ModelAndView search_bl_list(String m_idx) {
        ModelAndView mv = new ModelAndView();
        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }
        mv.addObject("mq", service.search_bl_list(m_idx));
        mv.setViewName("mypage/my_question");
        return mv;
    }

    @GetMapping("my_review")
    public ModelAndView search_bl_list2(String m_idx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("mr", service.search_bl_list2(m_idx));
        mv.setViewName("mypage/my_review");
        return mv;
    }

    @GetMapping("addCar")
    public ModelAndView addCar(CarVO cvo) {
        ModelAndView mv = new ModelAndView();

        System.out.println("CVO cnum" + cvo.getC_num());

        int cnt = service.addCar(cvo);

        mv.addObject("cnt", cnt);

        mv.setViewName("mypage/car_list");

        return mv;
    }

    @PostMapping("addCarWrite")
    public ModelAndView addCarWrite(CwriteVO cwvo) {
        ModelAndView mv = new ModelAndView();

        int cnt = service.addCarWrite(cwvo);

        mv.addObject("cnt", cnt);
        mv.setViewName("redirect:/car_list");
        return mv;
    }

    @RequestMapping("updateCar")
    public ModelAndView updateCar(String c_idx) {
        // System.out.println(m_idx);

        CarVO cvo = service.get_Car(c_idx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("cvo", cvo);
        mv.setViewName("redirect:/car_list");
        return mv;

    }

    @RequestMapping("updateCarWrite")
    public ModelAndView updateCarWrite(String c_idx, String m_idx) {
        // System.out.println(m_idx);

        List<CwriteVO> cw_list = service.search_cw_list(m_idx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("cw_list", cw_list);
        mv.setViewName("redirect:/car_list");
        return mv;

    }

    @GetMapping("mypage")
    public ModelAndView getMemberByIdx(String mIdx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("member", service.getMemberByIdx(mIdx));
        mv.setViewName("mypage/mypage");
        return mv;
    }

    @GetMapping("updateMember")
    public ModelAndView updateMember(String mIdx) {
        // System.out.println(m_idx);

        MemVO mvo = service.getMemberByIdx(mIdx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("mvo", mvo);
        mv.setViewName("mypage/updateMember");
        return mv;

    }

    @PostMapping("/updateMember")
    @ResponseBody
    public Map<String, Integer> updateMember(MemVO vo) {
        Map<String, Integer> map = new HashMap<>();

        // 로그인한 회원의 m_idx를 얻어내자
        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            vo.setM_idx(mvo.getM_idx());

            int cnt = service.updateMember(vo);
            map.put("res", cnt);

            if (cnt == 1) {
                // 세션의 정보도 변경해야 함!
                mvo = service.getMemberByIdx(vo.getM_idx());
                session.setAttribute("mvo", mvo);
            }
        }

        return map; // 호출한 updateMember.jsp의 비동기식 통신의 done영역으로 json으로 전달됨!

    }

    @GetMapping("use_service_list")
    public ModelAndView use_service_list(String m_idx) {
        ModelAndView mv = new ModelAndView();

        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }

        List<SuseVO> list = service.use_service_list(m_idx);
        mv.addObject("s_list", list);
        mv.setViewName("mypage/service_use");

        return mv;
    }
}
