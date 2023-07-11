package com.kdt.finalproject.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.AdminService;
import com.kdt.finalproject.util.Admin_car_paging;
import com.kdt.finalproject.util.Admin_member_paging;
import com.kdt.finalproject.util.Admin_notice_paging;
import com.kdt.finalproject.util.Admin_qna_paging;
import com.kdt.finalproject.util.Admin_review_paging;
import com.kdt.finalproject.util.FileRenameUtil;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.ImgVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class AdminController {

    @Autowired
    AdminService service;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ServletContext application; // 파일첨부 시 경로를 절대경로화 시키기 위해 필요

    @Autowired
    HttpSession session;

    private String bbs_upload = "/bbs_upload";
    private String editor_path = "/editor_upload";

    // 회원 목록
    @RequestMapping("/admin/member")
    public ModelAndView member(String cPage, String searchType, String searchValue, String m_class) {
        ModelAndView mv = new ModelAndView();

        if (m_class != null && m_class.trim().length() == 0)
            m_class = null;

        // ---------paging------------
        int nowPage = 1;
        int totalRecord = service.member_count(searchType, searchValue, m_class);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_member_paging page = new Admin_member_paging(nowPage, totalRecord, 10, 5, searchType, searchValue,
                m_class);
        String pageCode = page.getSb().toString();

        // ---------paging------------

        MemVO[] ar = service.member(page.getBegin(), page.getEnd(), searchType, searchValue, m_class);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/admin/member");

        return mv;
    }

    // 회원 정보 상세보기
    @RequestMapping("/admin/member_view")
    public ModelAndView member_view(String m_idx, String cPage, String searchType, String searchValue, String m_class) {
        ModelAndView mv = new ModelAndView();

        MemVO vo = service.member_view(m_idx);

        mv.addObject("vo", vo);
        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("/admin/member_view");

        return mv;
    }

    // 공지사항
    @RequestMapping("/admin/notice")
    public ModelAndView notice(String cPage, String searchType, String searchValue, String category) { // 공지사항 표시
        ModelAndView mv = new ModelAndView();

        if (category != null && category.trim().length() == 0)
            category = null;

        // ---------------------paging------------------------------
        int nowPage = 1;
        int totalRecord = service.notice_count(searchType, searchValue, category);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_notice_paging page = new Admin_notice_paging(nowPage, totalRecord, 10, 5, searchType, searchValue,
                category);
        String pageCode = page.getSb().toString();

        // ---------------------paging------------------------------

        BbsVO[] ar = service.notice_all(page.getBegin(), page.getEnd(), searchType, searchValue, category);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/admin/notice");

        return mv;
    }

    // 공지사항 상세보기
    @RequestMapping("/admin/notice_view")
    public ModelAndView notice_view(String b_idx, String cPage, String searchType, String searchValue,
            String category) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.notice_view(b_idx);

        mv.addObject("vo", vo);
        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("/admin/notice_view");
        return mv;
    }

    // 공지사항 글쓰기 버튼 눌렀을 때 이동
    @RequestMapping("/admin/notice_write")
    public ModelAndView notice_write(String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("/admin/notice_write");

        return mv;
    }

    // 공지사항 글 작성
    @RequestMapping("/admin/notice_write_ok")
    public ModelAndView notice_write_ok(BbsVO vo, BbslogVO vo2, String m_idx) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 파일 첨부 시 파일 저장 경로 설정
        // 넘어온 파일이 있는지 확인
        MultipartFile mf = vo.getFile(); // 파일을 첨부하지 않아도 null이 아님

        if (mf.getSize() > 0) { // 파일을 첨부한 경우

            // 파일을 저장할 곳 (bbs_upload)을 절대경로화 시킨다.
            String realPath = application.getRealPath(bbs_upload);

            // 파일명 얻기
            String oname = mf.getOriginalFilename();

            // 이미 같은 이름의 파일이 존재할 수도 있다. 만약 있다면 파일명 뒤에 숫자를 붙여준다. - 객체를 하나 정의
            String fname = FileRenameUtil.checkFileName(oname, realPath);

            mf.transferTo(new File(realPath, fname));

            // 첨부된 파일명을 DB에 저장하기 위해 vo안에 file_name에 이름을 저장
            vo.setB_filename(fname);
            vo.setB_oriname(oname);
        }

        vo.setB_ip(request.getRemoteAddr());

        service.notice_write_ok(vo);
        vo2.setB_idx(vo.getB_idx());
        vo2.setM_idx(m_idx);
        service.notice_write_ok2(vo2);

        mv.setViewName("redirect:/admin/notice");

        return mv;
    }

    @PostMapping("/saveImg.inc")
    @ResponseBody
    public Map<String, String> saveImg(ImgVO vo) {
        Map<String, String> map = new HashMap<String, String>();

        // 넘어온 파일 검증
        String fname = null;

        MultipartFile s_file = vo.getS_file();

        if (s_file.getSize() > 0) {
            // 첨부파일 저장할 위치 - 절대경로화
            String realPath = application.getRealPath(editor_path);

            String oname = s_file.getOriginalFilename();

            // 첨부파일이 이미 저장된 파일과 이름이 동일한 경우 이름을 변경해야 한다.
            fname = FileRenameUtil.checkFileName(oname, realPath);

            try {
                s_file.transferTo(new File(realPath, fname)); // 파일 업로드
            } catch (Exception e) {
                e.printStackTrace();
            }
            // DB작업은 하지 않지만 경로를 반환해야 하므로 현재 서버의 경로를 알아내야 한다.
            String path = request.getContextPath();

            // json으로 반환하기 위해 Map구조에 저장
            map.put("path", path + editor_path); // 서버 경로
            map.put("fname", fname); // 저장된 파일명
        }

        return map;
    }

    // 공지사항 수정 페이지 이동
    @RequestMapping("/admin/notice_edit")
    public ModelAndView notice_edit(String b_idx, String cPage, String searchType, String searchValue) {

        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.notice_view(b_idx);

        mv.addObject("vo", vo);
        mv.setViewName("/admin/notice_edit");
        return mv;
    }

    // 공지사항 수정 완료
    @RequestMapping("/admin/notice_edit_ok")
    public ModelAndView notice_edit_ok(BbsVO vo, String cPage, String searchType, String searchValue, String m_idx)
            throws Exception {
        ModelAndView mv = new ModelAndView();

        // 파일 첨부 시 파일 저장 경로 설정
        // 넘어온 파일이 있는지 확인
        MultipartFile mf = vo.getFile(); // 파일을 첨부하지 않아도 null이 아님

        if (mf.getSize() > 0) { // 파일을 첨부한 경우

            // 파일을 저장할 곳 (bbs_upload)을 절대경로화 시킨다.
            String realPath = application.getRealPath(bbs_upload);

            // 파일명 얻기
            String oname = mf.getOriginalFilename();

            // 이미 같은 이름의 파일이 존재할 수도 있다. 만약 있다면 파일명 뒤에 숫자를 붙여준다. - 객체를 하나 정의
            String fname = FileRenameUtil.checkFileName(oname, realPath);

            mf.transferTo(new File(realPath, fname));

            // 첨부된 파일명을 DB에 저장하기 위해 vo안에 file_name에 이름을 저장
            vo.setB_filename(fname);
            vo.setB_oriname(oname);
        }

        vo.setB_ip(request.getRemoteAddr());

        service.notice_edit(vo);

        BbslogVO lvo = new BbslogVO();
        lvo.setB_idx(vo.getB_idx());
        lvo.setM_idx(m_idx);
        service.notice_edit2(lvo);

        BbsVO bvo = service.notice_view(vo.getB_idx());

        mv.addObject("vo", bvo);
        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("admin/notice_view");

        return mv;
    }

    // 공지사항 공개/비공개 전환
    @RequestMapping("/admin/notice_changeStatus1")
    @ResponseBody
    public Map<String, Integer> notice_chageStatus1(String b_idx)
            throws Exception {
        int cnt = service.notice_chageStatus1(b_idx);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    @RequestMapping("/admin/notice_changeStatus0")
    @ResponseBody
    public Map<String, Integer> notice_chageStatus0(String b_idx)
            throws Exception {
        int cnt = service.notice_chageStatus0(b_idx);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    // 회원 탈퇴
    @RequestMapping("/admin/member_out")
    @ResponseBody
    public Map<String, Integer> member_out(String m_idx) {
        int cnt = service.member_out(m_idx);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    // 문의사항 불러오기
    @RequestMapping("/admin/qna")
    public ModelAndView qna(String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        int nowPage = 1;
        int totalRecord = service.qna_count(searchType, searchValue);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_qna_paging page = new Admin_qna_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        BbsVO[] ar = service.qna(page.getBegin(), page.getEnd(), searchType, searchValue);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/admin/qna");

        return mv;
    }

    // qna 상세보기
    @RequestMapping("/admin/qna_view")
    public ModelAndView qna_view(String b_idx, String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.qna_view(b_idx);
        BbsVO[] car = service.qna_comm(b_idx);

        mv.addObject("car", car);
        mv.addObject("vo", vo);
        mv.setViewName("/admin/qna_view");

        return mv;
    }

    // qna 댓글쓰기 (비동기식)
    @RequestMapping("/admin/qna_comm_write")
    @ResponseBody
    public Map<String, Integer> qna_comm_write(String b_content, String m_idx, String target) {

        BbsVO vo = new BbsVO();
        BbslogVO vo2 = new BbslogVO();

        vo.setB_content(b_content);
        vo.setB_target(target);
        vo.setB_ip(request.getRemoteAddr());

        int cnt = service.qna_comm_write(vo);
        vo2.setB_idx(vo.getB_idx());
        vo2.setM_idx(m_idx);
        int cnt2 = service.qna_comm_write2(vo2);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);
        map.put("res2", cnt2);

        return map;
    }

    // qna 댓글 삭제 (비동기식)
    @RequestMapping("/admin/qna_comm_del")
    @ResponseBody
    public Map<String, Integer> qna_comm_del(String b_idx, String m_idx) {

        BbslogVO vo = new BbslogVO();

        int cnt = service.qna_comm_del(b_idx);
        vo.setB_idx(b_idx);
        vo.setM_idx(m_idx);
        int cnt2 = service.qna_comm_del2(vo);

        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);
        map.put("res2", cnt2);

        return map;
    }

    @RequestMapping("/admin/notice_del")
    public ModelAndView notice_del(String b_idx, String m_idx) {
        ModelAndView mv = new ModelAndView();

        BbslogVO lvo = new BbslogVO();

        service.notice_del(b_idx);
        lvo.setB_idx(b_idx);
        lvo.setM_idx(m_idx);
        service.notice_del2(lvo);

        mv.setViewName("redirect:/admin/notice");
        return mv;
    }

    // qna 공개 비공개 변경
    @RequestMapping("/admin/qna_change")
    @ResponseBody
    public Map<String, Integer> qna_change(String b_idx, String b_val1) {
        Map<String, Integer> map = new HashMap<>();

        int cnt = service.qna_change(b_idx, b_val1);
        map.put("res", cnt);

        return map;
    }

    // qna 삭제
    @RequestMapping("/admin/qna_del")
    public ModelAndView qna_del(String b_idx, String m_idx) {
        ModelAndView mv = new ModelAndView();

        BbslogVO lvo = new BbslogVO();

        service.qna_del(b_idx);
        lvo.setB_idx(b_idx);
        lvo.setM_idx(m_idx);
        service.qna_del2(lvo);

        mv.setViewName("redirect:/admin/qna");
        return mv;
    }

    @GetMapping("/admin/login")
    public String login() {
        return "/admin/login";
    }

    @PostMapping("/admin/login")
    public ModelAndView login(MemVO vo) {
        ModelAndView mv = new ModelAndView();

        String path;

        MemVO mvo = service.admin_login(vo);
        if (mvo != null) {
            session.setAttribute("mvo", mvo);
            path = "redirect:/admin/home";
        } else {
            path = "/admin/login";
            mv.addObject("msg", "아이디와 비밀번호를 확인해주세요");
        }

        mv.setViewName(path);
        return mv;
    }

    @RequestMapping("/admin/logout")
    public String admin_logout() {

        session.removeAttribute("mvo");

        return "/admin/login";
    }

    @RequestMapping("/admin/car")
    public ModelAndView car(String cPage, String searchType, String searchValue, String search_date) {
        ModelAndView mv = new ModelAndView();

        int nowPage = 1;
        int totalRecord = service.car_count(searchType, searchValue, search_date);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_car_paging page = new Admin_car_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        SuseVO[] ar = service.car(page.getBegin(), page.getEnd(), searchType, searchValue, search_date);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/admin/car");

        return mv;
    }

    @RequestMapping("/admin/car_view")
    public ModelAndView car_view(String su_idx, String cPage, String searchType, String searhValue) {
        ModelAndView mv = new ModelAndView();

        SuseVO vo = service.car_view(su_idx);

        mv.addObject("vo", vo);
        mv.setViewName("/admin/car_view");

        return mv;
    }

    @RequestMapping("/admin/home")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();

        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        MemVO[] mem_count = service.home_mem_count();
        BbsVO[] b_ar = service.notice_all(1, 5, null, null, null);
        BbsVO[] q_ar = service.qna(1, 5, null, null);
        BbsVO[] r_ar = service.review(1, 5, null, null);
        SuseVO[] su_ar = service.car(1, 5, null, null, null);

        int pr = 0;
        int bz = 0;
        int ad = 0;
        int tod = 0;

        for (int i = 0; i < mem_count.length; i++) {
            if (mem_count[i].getM_class().equals("0")) {
                pr++;
            } else if (mem_count[i].getM_class().equals("1")) {
                bz++;
            } else if (mem_count[i].getM_class().equals("2")) {
                ad++;
            }
            if (mem_count[i].getM_date().substring(0, 10).equals(today)) {
                tod++;
            }
        }

        SuseVO[] today_sales = service.service_sales(today);
        SuseVO[] month_sales = service.service_sales(today.substring(0, 7));

        mv.addObject("today_sales", today_sales);
        mv.addObject("month_sales", month_sales);
        mv.addObject("today", today);
        mv.addObject("b_ar", b_ar);
        mv.addObject("q_ar", q_ar);
        mv.addObject("r_ar", r_ar);
        mv.addObject("su_ar", su_ar);
        mv.addObject("pr", pr);
        mv.addObject("bz", bz);
        mv.addObject("ad", ad);
        mv.addObject("tod", tod);

        mv.setViewName("/admin/home");
        return mv;
    }

    // 리뷰
    @RequestMapping("/admin/review")
    public ModelAndView review(String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();
        int nowPage = 1;
        int totalRecord = service.review_count(searchType, searchValue);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_review_paging page = new Admin_review_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        BbsVO[] ar = service.review(page.getBegin(), page.getEnd(), searchType, searchValue);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());

        mv.setViewName("/admin/review");
        return mv;
    }

    @RequestMapping("/admin/sales")
    public ModelAndView sales(String search_date) {
        ModelAndView mv = new ModelAndView();

        SuseVO[] search_sales = null;
        SuseVO[] search_month_sales = null;

        String today_date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        SuseVO[] total_sales = service.service_sales("");

        if (search_date != null) {
            search_sales = service.service_sales(search_date);
            search_month_sales = service.service_sales(search_date.substring(0, 7));
        } else {
            search_sales = service.service_sales(today_date);
            search_month_sales = service.service_sales(today_date.substring(0, 7));
        }

        mv.addObject("today_date", today_date);
        mv.addObject("total_sales", total_sales);
        mv.addObject("search_sales", search_sales);
        mv.addObject("search_month_sales", search_month_sales);
        mv.setViewName("/admin/sales");

        return mv;
    }

    @RequestMapping("/admin/car_status")
    @ResponseBody
    public Map<String, Integer> car_status(String su_idx, String su_status) {
        Map<String, Integer> map = new HashMap<>();

        int cnt = service.car_status(su_idx, su_status);
        map.put("res", cnt);

        return map;
    }

}
