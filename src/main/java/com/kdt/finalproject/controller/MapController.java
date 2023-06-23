package com.kdt.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MapService;

@Controller
public class MapController {

 @Autowired
 MapService service;

 @RequestMapping("/map/")
 public ModelAndView init() {
  ModelAndView mv = new ModelAndView();
  int init = service.init().length;
  System.out.println(init);
  mv.setViewName("admin/admin");
  return mv;
 }
}
