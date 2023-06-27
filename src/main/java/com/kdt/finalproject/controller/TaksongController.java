package com.kdt.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.TaksongService;
import com.kdt.finalproject.vo.ServiceVO;

@Controller
public class TaksongController {

 @Autowired
 HttpServletRequest request;

 @Autowired
 HttpSession session;

 @Autowired
 TaksongService service;

 String sp = "특별시";
 String wp = "광역시";
 String mp = "자치";
 int lo;

 @RequestMapping("/taksong/")
 public ModelAndView index() {
  ModelAndView mv = new ModelAndView();
  mv.setViewName("taksong/index");

  return mv;
 }

 @RequestMapping("/taksong/local")
 public ModelAndView local(@Param("lat") String lat, @Param("lng") String lng) {
  ModelAndView mv = new ModelAndView();
  System.out.println("lat======" + lat + "lng=====" + lng);
  mv.addObject("lat", lat);
  mv.addObject("lng", lng);
  mv.setViewName("taksong/taksong");
  return mv;
 }

 public int guri(double hlat, double hlng, double plat, double plng) {
  int radius = 0;

  double dLat = Math.toRadians(hlat - plat);
  double dLon = Math.toRadians(hlng - plng);

  double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
    + Math.cos(Math.toRadians(hlat)) * Math.cos(Math.toRadians(plat)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
  double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  double d = 6371 * c * 1000; // Distance in m
  radius = (int) Math.round(d);
  return radius;
 }

 @RequestMapping("/taksong/select/")
 public ModelAndView select(@Param("nowlat") String nowlat, @Param("nowlng") String nowlng,
   @Param("nowstate") String nowstate, @Param("nowcity") String nowcity) {
  ModelAndView mv = new ModelAndView();
  // double lat = 37.48489405082669;
  // double lng = 126.90278513630275;
  double lat2 = Double.parseDouble(nowlat);
  double lng2 = Double.parseDouble(nowlng);
  double dLat = Math.toRadians(Double.parseDouble(nowlat) - lat2);
  double dLon = Math.toRadians(Double.parseDouble(nowlng) - lng2);

  double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
    + Math.cos(Math.toRadians(Double.parseDouble(nowlat))) * Math.cos(Math.toRadians(lat2)) *
      Math.sin(dLon / 2) * Math.sin(dLon / 2);
  double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  double d = 6371 * c * 1000; // Distance in m

  // System.out.println("현재 지점" + nowstate + "과 구로 디지털 단지의 역 거리는 " + d + "m입니다.");
  System.out.println("nowcity ==" + nowcity);

  if (nowstate.contains(sp) || nowstate.contains(mp) || nowstate.contains(wp)) {
   System.out.println("현재 위치는 특별 혹은 광역 혹은 자치 시입니다.");
   ServiceVO[] ar = service.siar(nowstate);

   int idx = 1;

   for (ServiceVO vo : ar) {
    int radius = guri(Double.parseDouble(nowlat), Double.parseDouble(nowlng),
      Double.parseDouble(vo.getS_mapx()), Double.parseDouble(vo.getS_mapy()));

    System.out.println(vo.getS_city() + "의" + idx + "번째 서비스 구역의 커버범위는" + vo.getS_radius() + "m 입니다");

    if (radius < Integer.parseInt(vo.getS_radius())) {
     System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 가능합니다");
     System.out.println();
    } else {
     System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 불가합니다");
     System.out.println();
    }

    ++idx;
   }

  } else {
   ServiceVO[] ar = service.guar(nowcity);

   int idx = 1;

   for (ServiceVO vo : ar) {
    int radius = guri(Double.parseDouble(nowlat), Double.parseDouble(nowlng),
      Double.parseDouble(vo.getS_mapx()), Double.parseDouble(vo.getS_mapy()));
    System.out.println(vo.getS_city() + "의" + idx + "번째 서비스 구역의 커버범위는" + vo.getS_radius() + "m 입니다");

    if (radius < Integer.parseInt(vo.getS_radius())) {
     System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 가능합니다");
     System.out.println();
    } else {
     System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 불가합니다");
     System.out.println();
    }

    ++idx;
   }
  }
  mv.setViewName("taksong/serviceinfo");
  return mv;
 }
}