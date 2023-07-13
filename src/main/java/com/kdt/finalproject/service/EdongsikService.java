package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.EdongsikMapper;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ModelVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;
import com.kdt.finalproject.vo.SwriteVO;

@Service
public class EdongsikService {
    @Autowired
    EdongsikMapper mapper;

    public List<CwriteVO> carList(String m_idx) {
        List<CwriteVO> vo = mapper.carList(m_idx);

        return vo;
    }

    public ServiceVO[] getEdongsik(String state) {
        ServiceVO[] ar = mapper.getEdongsik(state);

        return ar;
    }

    public SwriteVO radiusInfo(String s_idx) {
        SwriteVO vo = mapper.radiusInfo(s_idx);

        return vo;
    }

    public CarVO carList3(String c_idx) {
        CarVO vo = mapper.carList3(c_idx);

        return vo;
    }

    public SuseVO getOrder(String su_idx) {
        SuseVO vo = mapper.getOrder(su_idx);

        return vo;
    }

    public List<CwriteVO> getOrderList(String m_idx) {
        List<CwriteVO> ar = mapper.getOrderList(m_idx);

        return ar;
    }

    public SuseVO[] getMyOderList(int begin, int end, String m_idx) {
        SuseVO[] ar = null;
        Map<String, Object> map = new HashMap<>();
        map.put("m_idx", m_idx);
        map.put("begin", begin);
        map.put("end", end);

        List<SuseVO> list = mapper.getMyOderList(map);
        if (list != null && list.size() > 0) {
            ar = new SuseVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public int getTotalCount(String m_idx) {
        int cnt = 0;
        if (m_idx == null)
            cnt = mapper.totalCount();
        else
            cnt = mapper.totalCountByM_idx(m_idx);
        return cnt;
    }

    public boolean addReview(String su_idx, String reviewContent, String selectedValue) {
        boolean chk = false;

        Map<String, Object> map = new HashMap<>();
        map.put("su_idx", su_idx);
        map.put("reviewContent", reviewContent);
        map.put("selectedValue", selectedValue);

        int cnt = mapper.addReview(map);
        if (cnt == 1) {
            chk = !chk;
        }
        return chk;
    }

    public boolean addReviewLog(String m_idx, String b_idx) {
        boolean chk = false;

        Map<String, Object> map = new HashMap<>();
        map.put("m_idx", m_idx);
        map.put("b_idx", b_idx);

        int cnt = mapper.addReviewLog(map);
        if (cnt == 1) {
            chk = !chk;
        }
        return chk;
    }

    public BbsVO getBidx(String su_idx) {
        BbsVO vo = mapper.getBidx(su_idx);

        return vo;
    }

    public ModelVO getModel(String mo_idx) {

        ModelVO vo = mapper.getModel(mo_idx);

        return vo;
    }

}
