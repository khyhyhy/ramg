package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.AdminMapper;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

@Service
public class AdminService {

    @Autowired
    AdminMapper mapper;

    // 회원 정보 불러오기
    public MemVO[] member(int begin, int end, String searchType, String searchValue, String m_class) {
        MemVO[] ar = null;

        List<MemVO> list = mapper.member(begin, end, searchType, searchValue, m_class);
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 회원 리스트 카운트
    public int member_count(String searchType, String searchValue, String m_class) {
        return mapper.member_count(searchType, searchValue, m_class);
    }

    public MemVO member_view(String m_idx) {
        return mapper.member_view(m_idx);
    }

    // 공지사항 불러오기
    public BbsVO[] notice_all(int begin, int end, String searchType, String searchValue, String category) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_all(begin, end, searchType, searchValue, category);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 공지사항 페이징
    public int notice_count(String searchType, String searchValue, String category) {
        return mapper.notice_count(searchType, searchValue, category);
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

    // 공지사항 수정
    public int notice_edit(BbsVO vo) {
        return mapper.notice_edit(vo);
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

    // 문의 보기
    public BbsVO[] qna(int begin, int end, String searchType, String searchValue) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.qna(begin, end, searchType, searchValue);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 문의 카운트
    public int qna_count(String searchType, String searchValue) {
        return mapper.qna_count(searchType, searchValue);
    }

    // 문의 상세보기
    public BbsVO qna_view(String b_idx) {
        return mapper.qna_view(b_idx);
    }

    // 문의 댓글달기
    public int qna_comm_write(BbsVO vo) {
        return mapper.qna_comm_write(vo);
    }

    // 문의 댓글달기2
    public int qna_comm_write2(BbslogVO vo) {
        return mapper.qna_comm_write2(vo);
    }

    // 문의 댓글 불러오기
    public BbsVO[] qna_comm(String b_idx) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.qna_comm(b_idx);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int notice_edit2(BbslogVO vo) {
        return mapper.notice_edit2(vo);
    }

    // 문의 댓글 삭제
    public int qna_comm_del(String b_idx) {
        return mapper.qna_comm_del(b_idx);
    }

    // 문의 댓글 삭제 로그
    public int qna_comm_del2(BbslogVO vo) {
        return mapper.qna_comm_del2(vo);
    }

    // 공지 삭제
    public int notice_del(String b_idx) {
        return mapper.notice_del(b_idx);
    }

    public int notice_del2(BbslogVO vo) {
        return mapper.notice_del2(vo);
    }

    // 문의 공개/비공개 변경
    public int qna_change(String b_idx, String b_val1) {
        return mapper.qna_change(b_idx, b_val1);
    }

    public int qna_del(String b_idx) {
        return mapper.qna_del(b_idx);
    }

    public int qna_del2(BbslogVO vo) {
        return mapper.qna_del2(vo);
    }

    public int member_qna_count(String m_idx) {
        return mapper.member_qna_count(m_idx);
    }

    public MemVO admin_login(MemVO vo) {
        return mapper.admin_login(vo);
    }

    public MemVO[] home_mem_count() {
        MemVO[] ar = null;
        List<MemVO> list = mapper.home_mem_count();
        ar = new MemVO[list.size()];
        list.toArray(ar);

        return ar;
    }

    // 리뷰
    public BbsVO[] review(int begin, int end, String searchType, String searchValue) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.review(begin, end, searchType, searchValue);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int review_count(String searchType, String searchValue) {
        return mapper.review_count(searchType, searchValue);
    }

    // 서비스
    public SuseVO[] car(int begin, int end, String searchType, String searchValue, String search_date) {
        SuseVO[] ar = null;

        List<SuseVO> list = mapper.car(begin, end, searchType, searchValue, search_date);
        if (list != null && list.size() > 0) {
            ar = new SuseVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int car_count(String searchType, String searchValue, String search_date) {
        return mapper.car_count(searchType, searchValue, search_date);
    }

    public SuseVO[] service_sales(String search_date) {
        SuseVO[] ar = null;

        List<SuseVO> list = mapper.service_sales(search_date);
        if (list != null && list.size() > 0) {
            ar = new SuseVO[list.size()];
            list.toArray(ar);
        }
        return ar;

    }
}
