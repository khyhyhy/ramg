package com.kdt.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.MypageMapper;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;

@Service
public class MypageService {
    @Autowired
    MypageMapper mapper;

    public List<CwriteVO> search_cw_list(String m_idx) {
        return mapper.search_cw_list(m_idx);
    }

    public CarVO get_Car(String c_idx) {
        return mapper.get_car(c_idx);
    }

    public int addCar(CarVO cvo) {
        return mapper.addCar(cvo);
    }

    public int addCarWrite(CwriteVO cwvo) {
        return mapper.addCarWrite(cwvo);
    }

    public int updateCar(CarVO cvo) {
        return mapper.updateCar(cvo);
    }

    public int updateCarWrite(CwriteVO cwvo) {
        return mapper.updateCarWrite(cwvo);
    }
}
