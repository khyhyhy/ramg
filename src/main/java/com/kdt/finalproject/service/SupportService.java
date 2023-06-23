package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.SupportMapper;
import com.kdt.finalproject.vo.BbsVO;

@Service
public class SupportService {
    @Autowired
    SupportMapper mapper;

    public BbsVO[] notice_all(int begin, int end) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_all(begin, end);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public BbsVO[] notice_user(int begin, int end) {
        BbsVO[] ar = null;

        List<BbsVO> list = mapper.notice_user(begin, end);
        if (list != null && list.size() > 0) {
            ar = new BbsVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int notice_hit(int b_idx) {
        return mapper.notice_hit(b_idx);
    }

    public BbsVO notice_view(int b_idx) {
        return mapper.notice_view(b_idx);
    }

    public int support_notice_count1() {
        return mapper.support_notice_count1();
    }

    public int support_notice_count2() {
        return mapper.support_notice_count2();
    }
}
