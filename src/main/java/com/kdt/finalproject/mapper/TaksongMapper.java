package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;
import com.kdt.finalproject.vo.SwriteVO;

public interface TaksongMapper {
    MemVO selectmem(String m_idx);

    List<ServiceVO> guservice(String gu);

    List<ServiceVO> siservice(String si);

    SwriteVO selectSWVO(String s_idx);

    SwriteVO seSwriteVO(String sw_idx);

    List<SwriteVO> selectSWVOar(String m_idx);

    MemVO mvo(String m_idx);

    ServiceVO svo(String s_idx);

    CarVO cvo(String c_idx);

    List<CwriteVO> cwselect(String m_idx);

    CarVO carList(String c_idx);

    ServiceVO[] getService(String state);

    int susein(SuseVO suvo);

    int servicevoin(ServiceVO svo);

    int swritevoin(SwriteVO swvo);

    int serviceupdate(ServiceVO svo);

    int swritevoup(SwriteVO swvo);

    int swriteupdate(String sw_idx);

    ////////////// 영석///////////////////
    List<SuseVO> getSuse(String m_idx);

}
