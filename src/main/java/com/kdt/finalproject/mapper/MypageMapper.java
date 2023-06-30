package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

public interface MypageMapper {
    List<CwriteVO> search_cw_list(String m_idx);

    int addCar(CarVO cvo);

    CarVO get_car(String c_idx);

    int addCarWrite(CwriteVO cwvo);

    int updateCar(String c_idx);

    int updateCarWrite(CwriteVO cwvo);

    MemVO getMemberByIdx(String mIdx);

    int updateMember(MemVO mvo);

    List<BbslogVO> search_bl_list(String m_idx);

    List<BbslogVO> search_bl_list2(String m_idx);

    List<SuseVO> search_su_list(String c_idx);

    List<SuseVO> use_service_list(String m_idx);

    int deleteCar(String c_idx, String m_idx);

}
