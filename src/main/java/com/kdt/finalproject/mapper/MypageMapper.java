package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;

public interface MypageMapper {
    Map<String, Object> getCar();

    int addCar(CarVO cvo);

    int addCarWrite(CwriteVO cwvo);

    int updateCar(CarVO cvo);

    int updateCarWrite(CwriteVO cwvo);
}
