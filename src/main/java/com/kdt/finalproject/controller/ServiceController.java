package com.kdt.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceController {

 @Autowired
 HttpServletRequest request;

 @Autowired
 HttpSession session;

 @RequestMapping("/mypage/serviceadd/")
 public ModelAndView serviceadd() {
  ModelAndView mv = new ModelAndView();
  mv.setViewName("service/serviceadd");
  return mv;
 }

 @RequestMapping("/mypage/service/")
 public ModelAndView init(@Param("addr") String addr) {
  ModelAndView mv = new ModelAndView();
  return mv;
 }
}
