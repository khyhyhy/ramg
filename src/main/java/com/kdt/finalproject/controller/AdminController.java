package com.kdt.finalproject.controller;

import java.io.File;
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
import com.kdt.finalproject.util.Admin_qna_paging;
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
    public ModelAndView member_view(String m_idx, String cPage, String searchType, String searchValue) {
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
    public ModelAndView notice_view(String b_idx, String cPage, String searchType, String searchValue, String bl_date) {
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
        System.out.println(vo.getB_type());

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
    public ModelAndView notice_edit(String b_idx, String cPage, String searchType, String searchValue, String bl_date) {

        ModelAndView mv = new ModelAndView();
        BbsVO vo = service.notice_view(b_idx);

        mv.addObject("vo", vo);
        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("/admin/notice_edit");
        return mv;
    }

    // 공지사항 수정 완료
    @RequestMapping("/admin/notice_edit_ok")
    public ModelAndView notice_edit_ok(BbsVO vo, String cPage, String searchType, String searchValue, String bl_date)
            throws Exception {
        ModelAndView mv = new ModelAndView();

        System.out.println(vo.getB_idx());
        // 파일 첨부 시 파일 저장 경로 설정
        // 넘어온 파일이 있는지 확인
        MultipartFile mf = vo.getFile(); // 파일을 첨부하지 않아도 null이 아님
        System.out.println(vo.getB_type());

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

        mv.addObject("cPage", cPage);
        mv.addObject("searchType", searchType);
        mv.addObject("searchValue", searchValue);
        mv.setViewName("redirect:/admin/notice_view?b_idx=" + vo.getB_idx());

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
    public ModelAndView qna_view(String b_idx, String cPage, String searchType, String searchValue, String bl_date,
            String m_name) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.qna_view(b_idx);
        BbsVO[] ar = service.qna_comm(b_idx);

        mv.addObject("ar", ar);
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
}
