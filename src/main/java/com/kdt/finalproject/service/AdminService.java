package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.AdminMapper;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.MemVO;

@Service
public class AdminService {

    @Autowired
    AdminMapper mapper;

    // 회원 정보 불러오기
    public MemVO[] member(int begin, int end) {
        MemVO[] ar = null;

        List<MemVO> list = mapper.member(begin, end);
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 회원 리스트 카운트
    public int admin_member_count() {
        return mapper.admin_member_count();
    }

    public MemVO member_view(String m_idx) {
        return mapper.member_view(m_idx);
    }

    // 공지사항 불러오기
    public BbsVO[] notice_all(int begin, int end) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_all(begin, end);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 공지사항 페이징
    public int admin_notice_count() {
        return mapper.admin_notice_count();
    }

    // 공지사항 상세정보
    public BbsVO notice_view(String b_idx) {
        return mapper.notice_view(b_idx);
    }

    // 공지사항 글쓰기1
    public int notice_write_ok(BbsVO vo) {
        return mapper.notice_write_ok(vo);
    }

    // 공지사항 글쓰기2
    public int notice_write_ok2(BbslogVO vo) {
        return mapper.notice_write_ok2(vo);
    }

    // 공지사항 비공개 변경
    public int notice_chageStatus1(String b_idx) {
        return mapper.notice_changeStatus1(b_idx);
    }

    // 공지사항 공개 변경
    public int notice_chageStatus0(String b_idx) {
        return mapper.notice_changeStatus0(b_idx);
    }

    // 회원 탈퇴
    public int member_out(String m_idx) {
        return mapper.member_out(m_idx);
    }
}
