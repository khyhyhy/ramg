package com.kdt.finalproject.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SwriteVO {
  private String sw_idx, m_idx, s_idx, c_idx, sw_date, sw_status, sw_type,
      sw_val1, sw_val2, sw_val3, sw_val4, sw_val5;

  MemVO mvo;
  ServiceVO svo;
  CarVO cvo;
}
