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
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;
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
 public ModelAndView serviceinsert(String m_idx, String lat, String lng, String s_radius, String s_val1, String c_idx,
   String s_city, String s_state) {
  ModelAndView mv = new ModelAndView();
  if (c_idx != null) {
   System.out.println("리동식등록으로 왔시치~");
   CarVO cvo = service.carList(c_idx);
   System.out.println(cvo.getC_name() + "/" + cvo.getC_city());
   System.out.println("m_idx::" + m_idx);
   System.out.println("lng::" + lng);
   System.out.println("lat::" + lat);
   System.out.println("s_val1::" + s_val1);
   System.out.println("s_radius::" + s_radius);
   System.out.println("s_state::" + s_state);
   System.out.println("s_city::" + s_city);
   ServiceVO svo = new ServiceVO();
   svo.setS_type("1");
   svo.setS_radius(s_radius);
   svo.setS_status("0");
   svo.setS_mapx(lat);
   svo.setS_mapy(lng);
   svo.setS_state(s_state);
   svo.setS_city(s_city);
   svo.setS_val1(s_val1);
   SwriteVO swvo = new SwriteVO();
   swvo.setC_idx(c_idx);
   swvo.setM_idx(m_idx);
   service.servicevoin(svo, swvo);
  } else {
   System.out.println("탁송등록이지롱");
   System.out.println("m_idx::" + m_idx);
   System.out.println("lng::" + lng);
   System.out.println("lat::" + lat);
   System.out.println("s_val1::" + s_val1);
   System.out.println("s_radius::" + s_radius);
   System.out.println("s_state::" + s_state);
   System.out.println("s_city::" + s_city);
   ServiceVO svo = new ServiceVO();
   svo.setS_type("0");
   svo.setS_radius(s_radius);
   svo.setS_status("0");
   svo.setS_mapx(lat);
   svo.setS_mapy(lng);
   svo.setS_state(s_state);
   svo.setS_city(s_city);
   svo.setS_val1(s_val1);
   SwriteVO swvo = new SwriteVO();
   swvo.setM_idx(m_idx);
   service.servicevoin(svo, swvo);
  }
  mv.setViewName("redirect:/mypage/serviceadd/");
  return mv;
 }
}