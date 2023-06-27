package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.SupportMapper;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;

@Service
public class SupportService {
    @Autowired
    SupportMapper mapper;

    public BbsVO[] notice_all(int begin, int end, String searchType, String searchValue) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_all(begin, end, searchType, searchValue);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public BbsVO[] notice_user(int begin, int end, String searchType, String searchValue) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_user(begin, end, searchType, searchValue);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int notice_hit(String b_idx) {
        return mapper.notice_hit(b_idx);
    }

    public BbsVO notice_view(String b_idx) {
        return mapper.notice_view(b_idx);
    }

    public int support_notice_count1() {
        return mapper.support_notice_count1();
    }

    public int support_notice_count2() {
        return mapper.support_notice_count2();
    }

    // 자주하는 질문
    public BbsVO[] faq() {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.faq();
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 나의 문의
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
    public int support_qna_count(String searchType, String searchValue) {
        return mapper.support_qna_count(searchType, searchValue);
    }

    public BbsVO qna_view(String b_idx) {
        return mapper.qna_view(b_idx);
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

    // 문의 작성
    public int qna_write_ok(BbsVO vo) {
        return mapper.qna_write_ok(vo);
    }

    public int qna_write_ok2(BbslogVO vo) {
        return mapper.qna_write_ok2(vo);
    }
}
