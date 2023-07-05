package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.MypageService;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class MypageController {

    @Autowired
    MypageService service;

    @Autowired
    HttpSession session;

    @GetMapping("car_list")
    public ModelAndView search_cw_list(String m_idx) {
        ModelAndView mv = new ModelAndView();

        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }

        List<CwriteVO> list = service.search_cw_list(m_idx);
        mv.addObject("car", list);
        mv.setViewName("mypage/car_list");

        return mv;
    }

    @GetMapping("my_question")
    public ModelAndView search_bl_list(String m_idx) {
        ModelAndView mv = new ModelAndView();
        if (m_idx == null) {
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }
        mv.addObject("mq", service.search_bl_list(m_idx));
        mv.setViewName("mypage/my_question");
        return mv;
    }

    @GetMapping("my_review")
    public ModelAndView search_r(String m_idx) {
        ModelAndView mv = new ModelAndView();
        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }
        mv.addObject("mr", service.search_r(m_idx));
        mv.setViewName("mypage/my_review");
        return mv;
    }

    @GetMapping("addCar")
    public String addCar() {
        return "mypage/addCar";
    }

    @PostMapping("/addCar")
    public ModelAndView addCar(CarVO cvo) {
        ModelAndView mv = new ModelAndView();

        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            int cnt = service.addCar(cvo);

            mv.addObject("cnt", cnt);
            if (cnt > 0) {
                CwriteVO cwvo = new CwriteVO();
                cwvo.setM_idx(mvo.getM_idx());
                cwvo.setC_idx(cvo.getC_idx());

                service.addCarWrite(cwvo);
                mv.setViewName("redirect:/car_list");
            } else
                mv.setViewName("redirect:/addCar");
        }
        return mv;
    }

    @PostMapping("addCarWrite")
    public ModelAndView addCarWrite(CwriteVO cwvo) {
        ModelAndView mv = new ModelAndView();

        int cnt = service.addCarWrite(cwvo);

        mv.addObject("cnt", cnt);
        mv.setViewName("redirect:/car_list");
        return mv;
    }

    @GetMapping("updateCar")
    public ModelAndView updateCar(String c_idx) {
        CarVO cvo = service.get_Car(c_idx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("cvo", cvo);
        mv.setViewName("mypage/updateCar");
        return mv;
    }

    @PostMapping("/updateCar")
    @ResponseBody
    public Map<String, Integer> updateCar(CarVO vo) {
        Map<String, Integer> map = new HashMap<>();

        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            int cnt = service.updateCar(vo);
            map.put("res", cnt);

            if (cnt > 0) {
                CwriteVO cwvo = new CwriteVO();
                cwvo.setM_idx(mvo.getM_idx());
                cwvo.setC_idx(vo.getC_idx());
                cwvo.setCw_state("0");

                service.updateCarWrite(cwvo);
            }
        }
        return map; // 호출한 updateMember.jsp의 비동기식 통신의 done영역으로 json으로 전달됨!

    }

    @RequestMapping("updateCarWrite")
    public ModelAndView updateCarWrite(CwriteVO cwvo) {
        // System.out.println(m_idx);

        ModelAndView mv = new ModelAndView();
        int cnt = service.updateCarWrite(cwvo);

        mv.addObject("cnt", cnt);
        mv.setViewName("redirect:/car_list");
        return mv;

    }

    @GetMapping("mypage")
    public ModelAndView getMemberByIdx(String mIdx) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("member", service.getMemberByIdx(mIdx));
        mv.setViewName("mypage/mypage");
        return mv;
    }

    @GetMapping("updateMember")
    public ModelAndView updateMember(String mIdx) {
        // System.out.println(m_idx);

        MemVO mvo = service.getMemberByIdx(mIdx);
        ModelAndView mv = new ModelAndView();

        mv.addObject("mvo", mvo);
        mv.setViewName("mypage/updateMember");
        return mv;

    }

    @PostMapping("/updateMember")
    @ResponseBody
    public Map<String, Integer> updateMember(MemVO vo) {
        Map<String, Integer> map = new HashMap<>();

        // 로그인한 회원의 m_idx를 얻어내자
        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            vo.setM_idx(mvo.getM_idx());

            int cnt = service.updateMember(vo);
            map.put("res", cnt);

            if (cnt == 1) {
                // 세션의 정보도 변경해야 함!
                mvo = service.getMemberByIdx(vo.getM_idx());
                session.setAttribute("mvo", mvo);
            }
        }

        return map; // 호출한 updateMember.jsp의 비동기식 통신의 done영역으로 json으로 전달됨!

    }

    @GetMapping("updateReview")
    public ModelAndView updateReview(String b_idx) {

        ModelAndView mv = new ModelAndView();
        BbsVO bvo = service.get_bbs(b_idx);

        mv.addObject("bvo", bvo);
        mv.setViewName("mypage/updateReview");

        return mv;

    }

    // @GetMapping("updateReview")
    // public String updateReview(String b_idx) {

    // return "mypage/updateReview";
    // }

    @PostMapping("/updateReview")
    @ResponseBody
    public Map<String, Integer> updateReview(BbsVO bvo) {
        Map<String, Integer> map = new HashMap<>();

        Object obj = session.getAttribute("mvo");

        if (obj != null) {
            MemVO mvo = (MemVO) obj;
            int cnt = service.updateReview(bvo);
            map.put("res", cnt);

            if (cnt > 0) {
                BbslogVO blvo = new BbslogVO();
                blvo.setM_idx(mvo.getM_idx());
                blvo.setB_idx(bvo.getB_idx());

                service.updateReviewlog(blvo);
            }
        }
        return map; // 호출한 updateMember.jsp의 비동기식 통신의 done영역으로 json으로 전달됨!

    }

    @RequestMapping("updateBbslog")
    public ModelAndView updateBbslog(BbslogVO blvo) {
        // System.out.println(m_idx);

        ModelAndView mv = new ModelAndView();
        int cnt = service.updateReviewlog(blvo);

        mv.addObject("cnt", cnt);
        mv.setViewName("redirect:/my_review");
        return mv;

    }

    @GetMapping("use_service_list")
    public ModelAndView use_service_list(String m_idx, String s_idx) {
        ModelAndView mv = new ModelAndView();
        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
            }
        }

        if (s_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("svo");

            if (obj != null) {
                ServiceVO svo = (ServiceVO) obj;
                s_idx = svo.getS_idx();
            }
        }
        List<SuseVO> list = service.use_service_list(m_idx, s_idx);
        mv.addObject("s_list", list);
        mv.setViewName("mypage/use_service_list");

        return mv;
    }

    @RequestMapping("/deleteCar")
    @ResponseBody
    public Map<String, Integer> deleteCar(String c_idx, String m_idx) {

        CwriteVO cwvo = new CwriteVO();
        cwvo.setM_idx(m_idx);
        cwvo.setC_idx(c_idx);
        cwvo.setCw_state("1");

        int cnt = service.updateCarWrite(cwvo);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    @RequestMapping("/deleteReview")
    @ResponseBody
    public Map<String, Integer> deleteReview(String b_idx) {

        int cnt = service.deleteReview(b_idx);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

}
