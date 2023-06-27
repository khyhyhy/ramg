package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;

public interface MypageMapper {
    List<CwriteVO> search_cw_list(String m_idx);

    int addCar(CarVO cvo);

    CarVO get_car(String c_idx);

    int addCarWrite(CwriteVO cwvo);

    int updateCar(CarVO cvo);

    int updateCarWrite(CwriteVO cwvo);

    MemVO getMemberByIdx(String mIdx);

    int updateMember(MemVO mvo);
}
