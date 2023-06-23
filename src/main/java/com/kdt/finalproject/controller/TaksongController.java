package com.kdt.finalproject.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.TaksongService;

@Controller
public class TaksongController {

 @Autowired
 TaksongService service;

 @RequestMapping("/taksong/")
 public ModelAndView init() {
  ModelAndView mv = new ModelAndView();
  int init = service.init().length;

  mv.setViewName("taksong/taksong");
  return mv;
 }

 @RequestMapping("/taksong/select/")
 public ModelAndView select(@Param("nowlat") String nowlat, @Param("nowlng") String nowlng,
   @Param("nowstate") String nowstate, @Param("nowcity") String nowcity) {
  ModelAndView mv = new ModelAndView();
  double lat = 37.48489405082669;
  double lng = 126.90278513630275;
  double lat2 = Double.parseDouble(nowlat);
  double lng2 = Double.parseDouble(nowlng);
  double dLat = Math.toRadians(lat - lat2);
  double dLon = Math.toRadians(lng - lng2);

  double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
    + Math.cos(Math.toRadians(lat)) * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
  double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  double d = 6371 * c * 1000; // Distance in m
  System.out.println("현재 지점" + nowcity + "과 구로 디지털 단지의 역 거리는 " + d + "m입니다.");
  return mv;

 }
}
