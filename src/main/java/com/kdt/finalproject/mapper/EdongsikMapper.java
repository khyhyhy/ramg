package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SwriteVO;

public interface EdongsikMapper {
    MemVO init();

    CwriteVO carList(String m_idx);
}