package com.kdt.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.MypageMapper;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ModelVO;
import com.kdt.finalproject.vo.SuseVO;

@Service
public class MypageService {
    @Autowired
    MypageMapper mapper;

    public List<CwriteVO> search_cw_list(String m_idx) {
        return mapper.search_cw_list(m_idx);
    }

    public List<BbslogVO> search_bl_list(String m_idx) {
        return mapper.search_bl_list(m_idx);
    }

    public List<SuseVO> search_su_list(String c_idx) {
        return mapper.search_su_list(c_idx);
    }

    public CarVO get_Car(String c_idx) {
        return mapper.get_car(c_idx);
    }

    public List<BbsVO> search_r(String m_idx) {
        return mapper.search_r(m_idx);
    }

    public BbsVO get_bbs(String b_idx) {
        return mapper.get_bbs(b_idx);
    }

    public int addCar(CarVO cvo) {
        return mapper.addCar(cvo);
    }

    public int addCarWrite(CwriteVO cwvo) {
        return mapper.addCarWrite(cwvo);
    }

    public int updateCar(CarVO cvo) {
        return mapper.updateCar(cvo);
    }

    public int updateCarWrite(CwriteVO cwvo) {
        return mapper.updateCarWrite(cwvo);
    }

    public MemVO getMemberByIdx(String mIdx) {
        return mapper.getMemberByIdx(mIdx);
    }

    public int updateMember(MemVO mvo) {
        return mapper.updateMember(mvo);
    }

    public List<SuseVO> use_service_list(String m_idx, String s_idx) {
        return mapper.use_service_list(m_idx, s_idx);
    }

    public int deleteCar(String c_idx, String m_idx) {
        return mapper.deleteCar(c_idx, m_idx);
    }

    public int deleteReview(String b_idx) {
        return mapper.deleteReview(b_idx);
    }

    public int updateReview(BbsVO vo) {
        return mapper.updateReview(vo);
    }

    public int updateReviewlog(BbslogVO blvo) {
        return mapper.updateReviewlog(blvo);
    }

    public List<ModelVO> getModelList() {
        return mapper.getModelList();
    }

    public List<BbsVO> biz_review_list(String m_idx) {
        return mapper.biz_review_list(m_idx);
    }
}
