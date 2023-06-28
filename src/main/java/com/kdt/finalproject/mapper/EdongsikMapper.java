package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SwriteVO;

public interface EdongsikMapper {
    MemVO init();

    List<CwriteVO> carList(String m_idx);

    ServiceVO[] getEdongsik(String state);

    SwriteVO radiusInfo(String s_idx);

    MemVO mvo(String m_idx);

    ServiceVO svo(String s_idx);

    CarVO cvo(String c_idx);

}
