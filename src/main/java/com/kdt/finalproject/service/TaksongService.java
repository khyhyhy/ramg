package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.TaksongMapper;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SwriteVO;

@Service
public class TaksongService {
 @Autowired
 TaksongMapper mapper;

 public MemVO selectmem(String m_idx) {
  MemVO mvo = null;

  mvo = mapper.selectmem(m_idx);
  return mvo;
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

 public SwriteVO radiuSwriteVO(String s_idx) {
  SwriteVO vo = null;
  vo = mapper.selectSWVO(s_idx);
  return vo;
 }
}
