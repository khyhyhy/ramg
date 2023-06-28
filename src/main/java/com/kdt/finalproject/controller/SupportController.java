package com.kdt.finalproject.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.SupportService;
import com.kdt.finalproject.util.FileRenameUtil;
import com.kdt.finalproject.util.Support_noitce_paging;
import com.kdt.finalproject.util.Support_qna_paging;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.BbslogVO;
import com.kdt.finalproject.vo.MemVO;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
public class SupportController {

    @Autowired
    SupportService service;

    @Autowired
    private ServletContext application; // 파일첨부 시 경로를 절대경로화 시키기 위해 필요

    @Autowired
    ResourceLoader resourceLoader;

    private String bbs_upload = "/bbs_upload"; // webapp에 있는 폴더를 의미

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/support/notice")
    public ModelAndView notice(MemVO mvo, String cPage, String searchType, String searchValue) { // 공지사항 표시
        ModelAndView mv = new ModelAndView();

        BbsVO[] ar = null;
        Support_noitce_paging page = null;
        String pageCode = null;
        int nowPage = 1;
        int totalRecord;

        if (mvo.getM_class() == "1" || mvo.getM_class() == "2") { // 로그인 정보가 사업자거나 관리자라면 전체 공지 표시
            totalRecord = service.support_notice_count1();

            if (cPage != null)
                nowPage = Integer.parseInt(cPage);

            page = new Support_noitce_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
            pageCode = page.getSb().toString();

            ar = service.notice_all(page.getBegin(), page.getEnd(), searchType, searchValue);

        } else { // 로그인 정보가 없거나 개인이라면 부분 공지 표시
            totalRecord = service.support_notice_count2();

            if (cPage != null)
                nowPage = Integer.parseInt(cPage);

            page = new Support_noitce_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
            pageCode = page.getSb().toString();

            ar = service.notice_user(page.getBegin(), page.getEnd(), searchType, searchValue);
        }

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/support/notice");

        return mv;
    }

    @RequestMapping("/support/notice_view")
    public ModelAndView notice_view(String b_idx, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.notice_view(b_idx);
        service.notice_hit(b_idx);

        mv.setViewName("/support/notice_view");
        mv.addObject("vo", vo);
        return mv;
    }

    @RequestMapping("/download")
    public ResponseEntity<Resource> down(String fname) {

        String realPath = application.getRealPath(bbs_upload + "/" + fname); // 절대 경로

        try {
            Resource res = resourceLoader.getResource("file:" + realPath); // 반드시 앞에 file 의미 부여 해야함
            File f = res.getFile();

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + f.getName())
                    .header(HttpHeaders.CONTENT_LENGTH, String.valueOf(f.length()))
                    .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString()).body(res);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.badRequest().body(null);

    }

    @RequestMapping("/support/faq")
    public ModelAndView faq() {
        ModelAndView mv = new ModelAndView();

        BbsVO[] ar = service.faq();

        mv.addObject("ar", ar);
        mv.setViewName("/support/faq");

        return mv;
    }

    @RequestMapping("/support/qna")
    public ModelAndView qna(BbsVO vo, String cPage, String searchType, String searchValue) {
        ModelAndView mv = new ModelAndView();

        int nowPage = 1;
        int totalRecord = service.support_qna_count(searchType, searchValue);

        Support_qna_paging page = new Support_qna_paging(nowPage, totalRecord, 10, 5, searchType, searchValue);
        String pageCode = page.getSb().toString();

        BbsVO[] ar = service.qna(page.getBegin(), page.getEnd(), searchType, searchValue);

        mv.addObject("ar", ar);
        mv.addObject("page", page);
        mv.addObject("pageCode", pageCode);
        mv.addObject("totalRecord", totalRecord);
        mv.addObject("nowPage", nowPage);
        mv.addObject("blockList", page.getNumPerPage());
        mv.setViewName("/support/qna");

        return mv;
    }

    @RequestMapping("/support/qna_view")
    public ModelAndView qna_view(String b_idx, String cPage, String searchType, String searchValue, String bl_date,
            String m_name) {
        ModelAndView mv = new ModelAndView();

        BbsVO vo = service.qna_view(b_idx);
        BbsVO[] ar = service.qna_comm(b_idx);

        mv.addObject("vo", vo);
        mv.addObject("ar", ar);

        return mv;
    }

    // 문의 쓰기 화면 이동
    @RequestMapping("/support/qna_write")
    public String qna_wirte(String cPage, String searchType, String searchValue) {
        return "/support/qna_write";
    }

    // 문의 작성
    @RequestMapping("/support/qna_write_ok")
    public ModelAndView qna_write_ok(BbsVO vo, BbslogVO vo2, String m_idx) throws Exception {
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

        service.qna_write_ok(vo);
        vo2.setB_idx(vo.getB_idx());
        vo2.setM_idx(m_idx);
        service.qna_write_ok2(vo2);

        mv.setViewName("redirect:/support/qna");

        return mv;
    }
}
