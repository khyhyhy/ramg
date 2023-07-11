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
public class CarVO {
    private String c_idx, c_num, c_name,
            c_state, c_city, c_addr1,
            c_val1, c_val2, c_val3, c_val4, c_val5, c_type, c_chargetype_ac, c_chargetype_dc;

    private List<SuseVO> su_list;
}
