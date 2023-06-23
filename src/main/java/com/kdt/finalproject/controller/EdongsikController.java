package com.kdt.finalproject.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.EdongsikService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SwriteVO;

import javax.servlet.http.HttpSession;

@Controller
public class EdongsikController {

    @Autowired
    HttpSession session;

    @Autowired
    EdongsikService service;

    @RequestMapping("/edongsik/")
    public String edongsik() {
        MemVO vo = service.init();

        // String str = vo.getM_idx();
        // System.out.println(str);
        session.setAttribute("evo", vo);

        return "edongsik/edongsik";
    }

    @RequestMapping("/edongsik/map")
    public String edongsi() {

        return "map/map";
    }

    @RequestMapping("/carAddr/")
    public String carAddr(String m_idx) {

        CwriteVO cwvo = service.carList(m_idx);
        List<CarVO> ar = cwvo.getCar_list();

        // System.out.println(ar.);

        return "edongsik/carAddr";
    }

}
