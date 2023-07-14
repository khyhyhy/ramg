package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ModelVO;
import com.kdt.finalproject.vo.SuseVO;

public interface MypageMapper {
    List<CwriteVO> search_cw_list(String m_idx);

    int addCar(CarVO cvo);

    CarVO get_car(String c_idx);

    List<BbsVO> search_r(String m_idx);

    BbsVO get_bbs(String b_idx);

    int addCarWrite(CwriteVO cwvo);

    int updateCar(CarVO cvo);

    int updateCarWrite(CwriteVO cwvo);

    MemVO getMemberByIdx(String mIdx);

    int updateMember(MemVO mvo);

    List<BbslogVO> search_bl_list(String m_idx);

    List<SuseVO> search_su_list(String c_idx);

    List<SuseVO> use_service_list(String m_idx, String s_idx);

    int deleteCar(String c_idx, String m_idx);

    int deleteReview(String b_idx);

    int updateReview(BbsVO vo);

    int updateReviewlog(BbslogVO blvo);

    List<ModelVO> getModelList();

    List<BbsVO> biz_review_list(String m_idx);

}
