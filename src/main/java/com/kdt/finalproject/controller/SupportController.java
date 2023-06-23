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
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.SupportService;
import com.kdt.finalproject.util.Admin_notice_paging;
import com.kdt.finalproject.util.Support_noitce_paging;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.MemVO;

import javax.servlet.ServletContext;

@Controller
public class SupportController {

    @Autowired
    SupportService service;

    @Autowired
    private ServletContext application; // 파일첨부 시 경로를 절대경로화 시키기 위해 필요

    @Autowired
    ResourceLoader resourceLoader;

    private String bbs_upload = "/bbs_upload"; // webapp에 있는 폴더를 의미

    @RequestMapping("/support/notice")
    public ModelAndView notice(MemVO mvo, String cPage) { // 공지사항 표시
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

            page = new Support_noitce_paging(nowPage, totalRecord, 10, 5);
            pageCode = page.getSb().toString();

            ar = service.notice_all(page.getBegin(), page.getEnd());

        } else { // 로그인 정보가 없거나 개인이라면 부분 공지 표시
            totalRecord = service.support_notice_count2();

            if (cPage != null)
                nowPage = Integer.parseInt(cPage);

            page = new Support_noitce_paging(nowPage, totalRecord, 10, 5);
            pageCode = page.getSb().toString();

            ar = service.notice_user(page.getBegin(), page.getEnd());
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
    public ModelAndView notice_view(int b_idx) {
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

}
