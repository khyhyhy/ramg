package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.MemVO;

public interface AdminMapper {
    List<MemVO> member(int begin, int end, String searchType, String searchValue);

    int member_count(String searchType, String searchValue);

    MemVO member_view(String m_idx);

    List<BbsVO> notice_all(int begin, int end, String searchType, String searchValue);

    int notice_count(String searchType, String searchValue);

    BbsVO notice_view(String b_idx); // 공지 상세보기

    int notice_write_ok(BbsVO vo);

    int notice_write_ok2(BbslogVO vo);

    int notice_changeStatus1(String b_idx);

    int notice_changeStatus0(String b_idx);

    int member_out(String m_idx);

}