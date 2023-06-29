package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;

public interface SupportMapper {
    List<BbsVO> notice_all(int begin, int end, String searchType, String searchValue); // 사업자가 볼 수 있는 공지

    List<BbsVO> notice_user(int begin, int end, String searchType, String searchValue); // 개인이 볼 수 있는 공지 (조건)

    int support_notice_count1(String searchType, String searchValue);

    int support_notice_count2(String searchType, String searchValue);

    BbsVO notice_view(String b_idx); // 공지 상세보기

    int notice_hit(String b_idx); // 공지 조회수

    List<BbsVO> faq(); // 자주하는 질문

    List<BbsVO> qna(int begin, int end, String searchType, String searchValue);

    int support_qna_count(String searchType, String searchValue);

    BbsVO qna_view(String b_idx); // 문의 보기

    List<BbsVO> qna_comm(String b_idx);

    int qna_write_ok(BbsVO vo);

    int qna_write_ok2(BbslogVO vo);

    int qna_hit(String b_idx);

    int qna_edit(BbsVO vo);

    int qna_comm_write(BbsVO vo);

    int qna_comm_write2(BbslogVO vo);
}
