package com.kdt.finalproject.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ServiceVO {
  private String s_idx, s_type, s_radius, s_status, s_mapx, s_mapy,
      s_code, s_state, s_city, s_addr1, s_val1, s_val2, s_val3, s_val4, s_val5;

  private List<SuseVO> su_list;
}
