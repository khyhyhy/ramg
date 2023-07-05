package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.MemVO;

public interface AdminMapper {
    List<MemVO> member(int begin, int end, String searchType, String searchValue, String m_class);

    int member_count(String searchType, String searchValue, String m_class);

    MemVO member_view(String m_idx);

    List<BbsVO> notice_all(int begin, int end, String searchType, String searchValue, String category);

    int notice_count(String searchType, String searchValue, String category);

    BbsVO notice_view(String b_idx); // 공지 상세보기

    int notice_write_ok(BbsVO vo);

    int notice_write_ok2(BbslogVO vo);

    int notice_edit(BbsVO vo); // 공지 수정

    int notice_changeStatus1(String b_idx);

    int notice_changeStatus0(String b_idx);

    int member_out(String m_idx);

    List<BbsVO> qna(int begin, int end, String searchType, String searchValue);

    int qna_count(String searchType, String searchValue);

    int qna_comm_write(BbsVO vo);

    int qna_comm_write2(BbslogVO vo);

    List<BbsVO> qna_comm(String b_idx);

    int notice_edit2(BbslogVO vo);

    BbsVO qna_view(String b_idx);

    int qna_comm_del(String b_idx);

    int qna_comm_del2(BbslogVO vo);

    int notice_del(String b_idx);

    int notice_del2(BbslogVO vo);

    int qna_change(String b_idx, String b_val1);

    int qna_del(String b_idx);

    int qna_del2(BbslogVO vo);

    int member_qna_count(String m_idx);

    MemVO admin_login(MemVO vo);
}
