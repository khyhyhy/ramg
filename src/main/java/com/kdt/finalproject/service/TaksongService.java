package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.TaksongMapper;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;

@Service
public class TaksongService {
 @Autowired
 TaksongMapper mapper;

 public MemVO[] init() {
  MemVO[] ar = null;

  List<MemVO> list = mapper.init();
  if (list != null && list.size() > 0) {
   ar = new MemVO[list.size()];
   list.toArray(ar);
  }
  return ar;
 }

 public ServiceVO[] guar(String gu) {
  ServiceVO[] ar = null;
  List<ServiceVO> list = mapper.guservice(gu);
  if (list != null && list.size() > 0) {
   ar = new ServiceVO[list.size()];
   list.toArray(ar);
  }
  return ar;
 }

 public ServiceVO[] siar(String si) {
  ServiceVO[] ar = null;
  List<ServiceVO> list = mapper.siservice(si);
  if (list != null && list.size() > 0) {
   ar = new ServiceVO[list.size()];
   list.toArray(ar);
  }
  return ar;
 }
}
