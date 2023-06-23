package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;

public interface SupportMapper {
    List<BbsVO> notice_all(int begin, int end); // 사업자가 볼 수 있는 공지

    List<BbsVO> notice_user(int begin, int end); // 개인이 볼 수 있는 공지 (조건)

    int support_notice_count1();

    int support_notice_count2();

    BbsVO notice_view(int b_idx); // 공지 상세보기

    int notice_hit(int b_idx); // 공지 조회수
}
