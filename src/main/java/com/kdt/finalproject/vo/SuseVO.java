package com.kdt.finalproject.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SuseVO {
  private String su_idx, s_idx, c_idx, su_date, su_status, su_type, su_percent, su_payment, su_payinfo, su_sprice,
      su_cprice, su_val1, su_val2, su_val3, su_val4, su_val5;
  private String s_type;
  private ServiceVO svo;
  private CarVO cvo;
  SwriteVO swvo;
  private MemVO mvo;
  private CwriteVO cwvo;
  private BbsVO bvo;
}
