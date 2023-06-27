package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;

public interface TaksongMapper {
 List<MemVO> init();

 List<ServiceVO> guservice(String gu);

 List<ServiceVO> siservice(String si);
}
