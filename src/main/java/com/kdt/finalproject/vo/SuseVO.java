package com.kdt.finalproject.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SuseVO {
    private String su_idx, s_idx, c_idx, su_date, su_status, su_type,
            su_val1, su_val2, su_val3, su_val4, su_val5;
    private ServiceVO svo;
    private CarVO cvo;
}
