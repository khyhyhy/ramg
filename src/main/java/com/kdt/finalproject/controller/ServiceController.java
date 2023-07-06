package com.kdt.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.TaksongService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SwriteVO;

@Controller
public class ServiceController {

 @Autowired
 HttpServletRequest request;

 @Autowired
 HttpSession session;

 @Autowired
 TaksongService service;

 @RequestMapping("/mypage/serviceadd/")
 public ModelAndView serviceadd() {
  ModelAndView mv = new ModelAndView();
  MemVO mvo = (MemVO) session.getAttribute("mvo");
  SwriteVO[] swar = service.selectSWVOar(mvo.getM_idx());
  CwriteVO[] cwar = service.cwselect(mvo.getM_idx());
  mv.addObject("swar", swar);
  mv.addObject("cwar", cwar);
  mv.setViewName("service/serviceadd");
  return mv;
 }

 @RequestMapping("/mypage/serviceadd/insert")
 public ModelAndView serviceinsert(String m_idx, String lat, String lng, String s_radius, String s_val1, String c_idx) {
  ModelAndView mv = new ModelAndView();
  if (c_idx != null) {
   CarVO cvo = service.carList(c_idx);
   System.out.println(cvo.getC_name() + "/" + cvo.getC_city());
  }
  return mv;
 }
}
