package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BbslogVO {
    private String bl_idx, m_idx, b_idx, bl_date, bl_type,
            bl_val1, bl_val2, bl_val3, bl_val4, bl_val5;
    private MemVO mvo;
    private BbsVO bvo;
}
