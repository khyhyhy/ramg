package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.TaksongMapper;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;
import com.kdt.finalproject.vo.SwriteVO;

@Service
public class TaksongService {
    @Autowired
    TaksongMapper mapper;

    public MemVO selectmem(String m_idx) {
        MemVO mvo = null;

        mvo = mapper.selectmem(m_idx);
        return mvo;
    }

    public ServiceVO[] guar(String gu) {
        ServiceVO[] ar = null;
        List<ServiceVO> list = mapper.guservice(gu);
        if (list != null && list.size() > 0) {
            ar = new ServiceVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public ServiceVO[] siar(String si) {
        ServiceVO[] ar = null;
        List<ServiceVO> list = mapper.siservice(si);
        if (list != null && list.size() > 0) {
            ar = new ServiceVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public SwriteVO radiuSwriteVO(String s_idx) {
        SwriteVO vo = null;
        vo = mapper.selectSWVO(s_idx);
        return vo;
    }

    public CarVO carList(String c_idx) {
        CarVO vo = mapper.carList(c_idx);

        return vo;
    }

    public ServiceVO[] getService(String state) {
        ServiceVO[] ar = mapper.getService(state);

        return ar;
    }

    public CwriteVO[] cwselect(String m_idx) {
        CwriteVO[] ar = null;
        List<CwriteVO> list = mapper.cwselect(m_idx);
        if (list != null && list.size() > 0) {
            ar = new CwriteVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    public boolean suseVOin(SuseVO suvo) {
        boolean chk = false;
        int cnt = mapper.susein(suvo);
        if (cnt == 1) {
            chk = !chk;
        }
        return chk;
    }

    public SwriteVO[] selectSWVOar(String m_idx) {
        SwriteVO[] swar = null;
        List<SwriteVO> list = mapper.selectSWVOar(m_idx);
        if (list != null && list.size() > 0) {
            swar = new SwriteVO[list.size()];
            list.toArray(swar);
        }
        return swar;
    }

    public SwriteVO seSwriteVO(String sw_idx) {
        SwriteVO swvo = null;
        swvo = mapper.seSwriteVO(sw_idx);
        return swvo;
    }

    public ServiceVO svosel(String s_idx) {
        ServiceVO svo = mapper.svo(s_idx);
        return svo;
    }

    public int servicevoin(ServiceVO svo, SwriteVO swvo) {
        int cnt;
        cnt = mapper.servicevoin(svo);
        if (cnt == 1) {
            String s_idx = svo.getS_idx();
            System.out.println("s_idx회수 성공" + s_idx);

            swvo.setS_idx(s_idx);
            int cnt2 = mapper.swritevoin(swvo);
            if (cnt2 == 1) {
                System.out.println("서비스 등록 성공");
            }
        }

        return cnt;
    }

    public int serviceupdate(ServiceVO svo, SwriteVO SwriteVO, String sw_idx) {
        int cnt = 0;
        cnt = mapper.serviceupdate(svo);
        if (cnt == 1) {
            mapper.swritevoup(SwriteVO);
            swriteupdate(sw_idx);
        }
        return cnt;
    }

    public int swriteupdate(String sw_idx) {
        int cnt = 0;
        System.out.println("sw_idx3:" + sw_idx);
        cnt = mapper.swriteupdate(sw_idx);
        return cnt;
    }

    ////////////// 영석///////////////////
    public SuseVO[] getSuse(String m_idx) {
        SuseVO[] suar = null;
        List<SuseVO> list = mapper.getSuse(m_idx);
        if (list != null && list.size() > 0) {
            suar = new SuseVO[list.size()];
            list.toArray(suar);
        }
        return suar;
    }

    public ServiceVO[] sType(String m_idx) {
        ServiceVO[] sar = null;
        List<ServiceVO> list = mapper.sType(m_idx);
        if (list != null && list.size() > 0) {
            sar = new ServiceVO[list.size()];
            list.toArray(sar);
        }
        return sar;
    }
}
