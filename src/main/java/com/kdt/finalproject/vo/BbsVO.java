package com.kdt.finalproject.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BbsVO {
    private String b_idx, b_title, b_content, b_score, b_target, b_type,
            b_status, b_to, b_hit, b_ip, b_oriname, b_filename, b_val1, b_val2, b_val3, b_val4, b_val5;

    private BbslogVO bbslog;

    private MultipartFile file;

}
