package com.kdt.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MypageService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class MypageController {

    @Autowired
    MypageService service;

    @GetMapping("car_mt")
    public ModelAndView search_cw_list(String m_idx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("car", service.search_cw_list(m_idx));
        mv.setViewName("mypage/car_mt");
        return mv;
    }

    @GetMapping("my_question")
    public ModelAndView search_bl_list(String m_idx) {
        ModelAndView mv = new ModelAndView();
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

    @GetMapping("service_use")
    public ModelAndView search_su_list(String c_idx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("su", service.search_su_list(c_idx));
        mv.setViewName("mypage/service_use");
        return mv;
    }

    @PostMapping("addCar")
    public ModelAndView addCar(CarVO cvo) {
        ModelAndView mv = new ModelAndView();

        System.out.println("CVO cnum" + cvo.getC_num());

        int cnt = service.addCar(cvo);

        mv.addObject("cnt", cnt);

        if (cnt > 0)
            mv.setViewName("login/login"); // 차량등록 완료후 로그인페이지로 이동

        else
            mv.setViewName("join");

        return mv;
    }

    @PostMapping("addCarWrite")
    public ModelAndView addCarWrite(CwriteVO cwvo) {
        ModelAndView mv = new ModelAndView();

        int cnt = service.addCarWrite(cwvo);

        mv.addObject("cnt", cnt);
        mv.setViewName("redirect:/car_mt");
        return mv;
    }

    @RequestMapping("updateCar")
    public ModelAndView updateCar(String c_idx) {
        // System.out.println(m_idx);

        CarVO cvo = service.get_Car(c_idx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("cvo", cvo);
        mv.setViewName("redirect:/car_mt");
        return mv;

    }

    @RequestMapping("updateCarWrite")
    public ModelAndView updateCarWrite(String c_idx, String m_idx) {
        // System.out.println(m_idx);

        List<CwriteVO> cw_list = service.search_cw_list(m_idx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("cw_list", cw_list);
        mv.setViewName("redirect:/car_mt");
        return mv;

    }

    @GetMapping("mypage")
    public ModelAndView getMemberByIdx(String mIdx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("member", service.getMemberByIdx(mIdx));
        mv.setViewName("mypage/mypage");
        return mv;
    }

    @RequestMapping("updateMember")
    public ModelAndView updateMember(String mIdx) {
        // System.out.println(m_idx);

        MemVO mvo = service.getMemberByIdx(mIdx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("mvo", mvo);
        mv.setViewName("redirect:/mypage");
        return mv;

    }
}
