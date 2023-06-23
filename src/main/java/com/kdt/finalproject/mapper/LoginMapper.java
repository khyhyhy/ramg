package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.MemVO;

public interface LoginMapper {

    List<MemVO> getList();

    MemVO login(Map<String, String> map);

    int add_mem(MemVO vo);

    // MemVO check_id(String id);
    MemVO search_email(String m_email);

}
