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
public class MemVO {
    private String m_idx, m_email, m_pw, m_name, m_phone, m_address, m_class, m_status, m_atoken,
            m_rtoken, m_payment, m_date, m_val2, m_val3, m_val4, m_val5;

    private List<CwriteVO> cw_list;

    private List<BbslogVO> bl_list;
}
