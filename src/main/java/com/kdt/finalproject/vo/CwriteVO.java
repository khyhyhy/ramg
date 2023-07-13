package com.kdt.finalproject.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CwriteVO {
  private String cw_idx, cw_type, m_idx, c_idx, cw_date, cw_state,
      cw_val1, cw_val2, cw_val3, cw_val4, cw_val5;

  List<CarVO> car_list;
  MemVO mvo;
  private CarVO cvo;
  private List<SuseVO> suvo;
}
