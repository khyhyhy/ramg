package com.kdt.finalproject.controller;

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

@Controller
public class MypageController {

    @Autowired
    MypageService service;

    @GetMapping("car_mt")
    public ModelAndView getCar() {
        ModelAndView mv = new ModelAndView("car_mt");
        mv.addObject("car", service.getCar());
        return mv;
    }

    @PostMapping("addCar")
    public ModelAndView addCar(CarVO cvo) {
        ModelAndView mv = new ModelAndView();

        int cnt = service.addCar(cvo);

        mv.addObject("cnt", cnt);
        return mv;
    }

    @PostMapping("addCarWrite")
    public ModelAndView addCarWrite(CwriteVO cwvo) {
        ModelAndView mv = new ModelAndView();

        int cnt = service.addCarWrite(cwvo);

        mv.addObject("cnt", cnt);
        return mv;
    }

    @RequestMapping("updateCar")
    public ModelAndView updateCar(String c_idx) {
        // System.out.println(m_idx);

        Map<String, Object> m = service.getCar();
        ModelAndView mv = new ModelAndView();

        mv.addObject("m", m);
        mv.setViewName("redirect:/car_mt");
        return mv;

    }

    @RequestMapping("updateCarWrite")
    public ModelAndView updateCarWrite(String c_idx, String m_idx) {
        // System.out.println(m_idx);

        Map<String, Object> m = service.getCar();
        ModelAndView mv = new ModelAndView();

        mv.addObject("m", m);
        mv.setViewName("redirect:/car_mt");
        return mv;

    }
}
