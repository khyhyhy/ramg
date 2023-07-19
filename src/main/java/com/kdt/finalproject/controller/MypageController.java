package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.service.MypageService;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ModelVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class MypageController {

    @Autowired
    MypageService service;

    @Autowired
    private LoginService ls;

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
    public ModelAndView search_r(String m_idx, String s_idx, String s_type) {
        ModelAndView mv = new ModelAndView();
        if (m_idx == null) {
            // 로그인한 회원의 m_idx를 얻어내자
            Object obj = session.getAttribute("mvo");

            if (obj != null) {
                MemVO mvo = (MemVO) obj;
                m_idx = mvo.getM_idx();
                List<BbsVO> ar = null;
                if (s_idx == null)
                    ar = service.biz_review_list(m_idx);
                else
                    ar = service.member_review_list(m_idx, s_idx);

                mv.addObject("ar", ar);
            }
        }
        mv.addObject("mr", service.search_r(m_idx));
        mv.addObject("s_type", s_type);
        mv.setViewName("mypage/my_review");
        return mv;
    }

    private String key = "devU01TX0FVVEgyMDIzMDcwNjExNDQzMzExMzkwNjY=";

    /*
     * @RequestMapping("juso") // 브라우저에서 smog라고 호출하면 무조건 현재 메서드 호출하여 수행한다.
     * public ModelAndView juso(String city) throws Exception {
     * // String str =
     * //
     * "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName=서울&pageNo=1&numOfRows=100&returnType=xml&serviceKey=FDp2a3vCnN%2BVvgfwp%2BneIQPvN3zTM7aLpEznSGbkyDN47qXAmtPene0L3A8mgUsbO%2F7pzLR3EX7rdD0%2B6wZe3Q%3D%3D&ver=1.0";
     * StringBuffer sb = new StringBuffer();
     * ModelAndView mv = new ModelAndView();
     * sb.append("http://business.juso.go.kr/addrlink/addrLinkApi.do?");
     * // sb.append("sidoName=%EC%84%9C%EC%9A%B8&");
     * sb.append("keyword=" + URLEncoder.encode(city, "utf-8"));
     * sb.append("&currentPage=1");
     * sb.append("&countPerPage=10");
     * sb.append("&returnType=xml");
     * sb.append("&confmKey=" + key);
     * 
     * // 웹상의 경로를 객체화 시킨다.
     * URL url = new URL(sb.toString());
     * 
     * // 웹상의 경로(URL)와 연결하는 객체
     * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     * conn.connect(); // 연결!!!! (요청을 보냈다.)
     * 
     * // 요청(연결)한 곳으로부터 응답을 받아 처리하는 부분
     * // 응답이 xml로 받게 되어 있으므로 JDOM을 통해 파싱을 해야 함!
     * SAXBuilder builder = new SAXBuilder();
     * 
     * // SAXBuilder를 통해 응답인 XML을 문서객체(Document)로 얻어낸다.
     * Document doc = builder.build(conn.getInputStream());
     * 
     * // 문서객체의 루트요소(Element)를 알아내야 한다.
     * Element root = doc.getRootElement(); // <response> ... </response>
     * System.out.println(root.getName());
     * // 루트요소 안에 있는 body요소를 얻어내자
     * Element body = root.getChild("body"); // <body> ... </body>
     * 
     * // body안에 있는 items요소 얻어내자!
     * Element items = body.getChild("items");
     * 
     * // items안에 있는 모든 item들을 얻어내야 한다. 이때
     * // 여러 개가 있다면 반드시 List로 받아야 한다.
     * List<Element> item_list = items.getChildren("item");
     * 
     * // System.out.println("item_list.size():"+item_list.size()); // 40
     * // List가 넘어온 것을 확인했으니
     * // JSP에서 표현하기 위해 보다 편하게 List에 있는 Element들을
     * // VO의 배열로 변환하자!
     * 
     * JusoVO[] ar = new JusoVO[item_list.size()];
     * int i = 0;
     * for (Element item : item_list) {
     * // 필요한 항목들을 모두 가져온다.
     * String siNm = item.getChildText("siNm"); // 시도
     * String sggNm = item.getChildText("sggNm"); // 시군구
     * String rn = item.getChildText("rn"); // 도로명
     * String roadAddr = item.getChildText("roadAddr"); // 전체 도로명 주소
     * String roadAddrPart1 = item.getChildText("roadAddrPart1"); // 도로명 주소(참고항목제외)
     * String roadAddrPart2 = item.getChildText("roadAddrPart2"); // 도로명 주소 참고항목
     * 
     * JusoVO vo = new JusoVO(siNm, sggNm, rn, roadAddr, roadAddrPart1,
     * roadAddrPart2);
     * ar[i++] = vo;
     * // ++i;
     * }
     * mv.addObject("ar", ar);
     * mv.setViewName("/mypage/addCar");
     * 
     * return mv;
     * }
     */

    @GetMapping("addCar")
    public String addCar(Model model) {
        List<ModelVO> modelList = service.getModelList();
        model.addAttribute("modelList", modelList);
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
        List<ModelVO> modelList = service.getModelList();
        mv.addObject("modelList", modelList);
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

    @PostMapping("changePw")
    public ModelAndView changePw(String pwd) {
        ModelAndView mv = new ModelAndView();
        System.out.println("DDDDDDD" + pwd);
        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            MemVO vo = (MemVO) obj;
            if (ls.check_current_pwd(vo, pwd)) {
                mv.setViewName("mypage/editPw");
                return mv;
            }
        }

        mv.setViewName("mypage/updateMember");
        return mv;
    }

    @PostMapping("changePWD")
    @ResponseBody
    public Map<String, Integer> changePWD(String pwd) {
        ModelAndView mv = new ModelAndView();
        int cnt = 0;
        Object obj = session.getAttribute("mvo");
        if (obj != null) {
            MemVO vo = (MemVO) obj;

            cnt = service.changePwd(vo.getM_idx(), pwd);
        }

        Map<String, Integer> map2 = new HashMap<>();
        map2.put("res", cnt);

        return map2;
    }

}
