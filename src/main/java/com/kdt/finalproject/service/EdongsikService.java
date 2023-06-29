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

    public List<CwriteVO> carList(String m_idx) {
        List<CwriteVO> vo = mapper.carList(m_idx);

        return vo;
    }

    public ServiceVO[] getEdongsik(String state) {
        ServiceVO[] ar = mapper.getEdongsik(state);

        return ar;
    }

    public SwriteVO radiusInfo(String s_idx) {
        SwriteVO vo = mapper.radiusInfo(s_idx);

        return vo;
    }

    public CarVO carList3(String c_idx) {
        CarVO vo = mapper.carList3(c_idx);

        return vo;
    }

}
