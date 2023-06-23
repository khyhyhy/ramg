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

    public Map<String, Object> getCar() {
        return mapper.getCar();
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
