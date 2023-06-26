package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.EdongsikMapper;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SwriteVO;

@Service
public class EdongsikService {
    @Autowired
    EdongsikMapper mapper;

    public MemVO init() {
        MemVO vo = mapper.init();

        return vo;
    }

    public CwriteVO carList(String m_idx) {
        CwriteVO vo = mapper.carList(m_idx);

        return vo;
    }

    public ServiceVO[] getEdongsik() {
        ServiceVO[] ar = mapper.getEdongsik();

        return ar;
    }

}
