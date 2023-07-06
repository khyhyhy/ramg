package com.kdt.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.TaksongService;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;

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
  CwriteVO[] cwar = service.cwselect(mvo.getM_idx());
  mv.addObject("cwar", cwar);
  mv.setViewName("service/serviceadd");
  return mv;
 }

 @RequestMapping("/mypage/service/")
 public ModelAndView init() {
  ModelAndView mv = new ModelAndView();
  return mv;
 }
}
