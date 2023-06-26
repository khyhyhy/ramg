package com.kdt.finalproject.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.AdminService;
import com.kdt.finalproject.util.Admin_member_paging;
import com.kdt.finalproject.util.Admin_notice_paging;
import com.kdt.finalproject.util.FileRenameUtil;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.ImgVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class AdminController {

    @Autowired
    AdminService service;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ServletContext application; // 파일첨부 시 경로를 절대경로화 시키기 위해 필요

    private String bbs_upload = "/bbs_upload";
    private String editor_path = "/editor_upload";

    // 회원 목록
    @RequestMapping("/admin/member")
    public ModelAndView member(String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        // ---------paging------------
        int nowPage = 1;
        int totalRecord = service.member_count(searchType, searchValue);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_member_paging page = new Admin_member_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        // ---------paging------------

        MemVO[] ar = service.member(page.getBegin(), page.getEnd(), searchType, searchValue);

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
    public ModelAndView member_view(String m_idx) {
        ModelAndView mv = new ModelAndView();

        MemVO vo = service.member_view(m_idx);

        mv.addObject("vo", vo);
        mv.setViewName("/admin/member_view");

        return mv;
    }

    // 공지사항
    @RequestMapping("/admin/notice")
    public ModelAndView notice(String cPage, String searchType, String searchValue) { // 공지사항 표시
        ModelAndView mv = new ModelAndView();

        // ---------------------paging------------------------------
        int nowPage = 1;
        int totalRecord = service.notice_count(searchType, searchValue);

        if (cPage != null)
            nowPage = Integer.parseInt(cPage);

        Admin_notice_paging page = new Admin_notice_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        // ---------------------paging------------------------------

        BbsVO[] ar = service.notice_all(page.getBegin(), page.getEnd(), searchType, searchValue);

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
    public ModelAndView notice_view(String b_idx, String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.notice_view(b_idx);

        mv.addObject("vo", vo);
        mv.setViewName("/admin/notice_view");
        return mv;
    }

    // 공지사항 글쓰기 버튼 눌렀을 때 이동
    @RequestMapping("/admin/notice_write")
    public ModelAndView notice_write(String cPage) {
        ModelAndView mv = new ModelAndView();

        System.out.println(cPage);

        mv.addObject("cPage", cPage);
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

    // 공지사항 공개/비공개 전환
    @RequestMapping("/admin/notice_changeStatus1")
    @ResponseBody
    public Map<String, Integer> notice_chageStatus1(String b_idx, String cPage, String searchType, String searchValue)
            throws Exception {
        int cnt = service.notice_chageStatus1(b_idx);
        /*
         * System.out.println(b_idx);
         * System.out.println(cPage);
         * System.out.println(searchType);
         * System.out.println(searchValue);
         * 
         * return "redirect:/admin/notice_view?b_idx=" + b_idx + "&cPage=" + cPage +
         * "&searchType=" + searchType
         * + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
         */
        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    @RequestMapping("/admin/notice_changeStatus0")
    @ResponseBody
    public Map<String, Integer> notice_chageStatus0(String b_idx, String cPage, String searchType, String searchValue)
            throws Exception {
        int cnt = service.notice_chageStatus0(b_idx);
        /*
         * System.out.println(b_idx);
         * System.out.println(cPage);
         * System.out.println(searchType);
         * System.out.println(searchValue);
         * 
         * return "redirect:/admin/notice_view?b_idx=" + b_idx + "&cPage=" + cPage +
         * "&searchType=" + searchType
         * + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
         */
        Map<String, Integer> map = new HashMap<>();
        map.put("res", cnt);

        return map;
    }

    // 회원 탈퇴
    @RequestMapping("/admin/member_out")
    public String member_out(String m_idx, String cPage, String searchType, String searchValue) {
        service.member_out(m_idx);
        return "redirect:/admin/member_view?m_idx=" + m_idx;
    }

}
