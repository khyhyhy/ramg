package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.AdminService;
import com.kdt.finalproject.service.SupportService;
import com.kdt.finalproject.util.Support_noitce_paging;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.ChargeVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class MainController {

    @Autowired
    SupportService service;

    @RequestMapping("/infoma/")
    public String intro() {

        return "/main/infoma";
    }

    @RequestMapping("/main2/")
    public String intro1() {

        return "/main/test2";
    }

    // 메인페이지에 위치를 받아서 정보를뿌려줌
    @RequestMapping("/main/")
    public ModelAndView searchCharger2(String city) throws Exception {
        System.out.println("////////////////////////////111");
        ModelAndView mv = new ModelAndView();

        // 공지사항
        BbsVO[] b_ar = service.notice_user(1, 5, null, null);

        mv.addObject("b_ar", b_ar);

        mv.setViewName("/main/test");

        return mv;
    }

}
