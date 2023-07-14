package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.AdminService;
import com.kdt.finalproject.service.SupportService;
import com.kdt.finalproject.util.Support_noitce_paging;
import com.kdt.finalproject.vo.BbsVO;
import com.kdt.finalproject.vo.ChargeVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.SuseVO;

@Controller
public class MainController {

    @Autowired
    SupportService service;

    private String key = "bJ6oLO1YEYJbMWFVcv7pnkobUWW2bUmlGcVWx51o2%2FlRzzNbNqBpgrnzy0DR2yBMEwybwKRo1LYNbEUZJGHF6A%3D%3D";

    // loading2에서 접속한 사람의 위치를 구하기 위해서
    @RequestMapping("/main/")
    public String edongsi() {

        return "/main/loading2";
    }

    @RequestMapping("/infoma/")
    public String intro() {

        return "/main/infoma";
    }

    // 메인페이지에 위치를 받아서 정보를뿌려줌
    @RequestMapping("/main2/")
    public ModelAndView searchCharger2(String city) throws Exception {
        System.out.println("////////////////////////////111");
        ModelAndView mv = new ModelAndView();

        // 한전공공api :
        // http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=bJ6oLO1YEYJbMWFVcv7pnkobUWW2bUmlGcVWx51o2%2FlRzzNbNqBpgrnzy0DR2yBMEwybwKRo1LYNbEUZJGHF6A%3D%3D&pageNo=1&numOfRows=10&addr=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C
        // 한전 에너지센터 : https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do
        System.out.println(city);
        String two = city.substring(0, 2);
        if (two.equals("충남") || two.equals("충북")) {
            two = "충청";
        } else if (two.equals("전남") || two.equals("전북")) {
            two = "전라";
        } else if (two.equals("경남") || two.equals("경북")) {
            two = "경상";
        }
        StringBuffer sb = new StringBuffer();
        sb.append("http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList");
        sb.append("?serviceKey=" + key);
        sb.append("&pageNo=1");
        sb.append("&numOfRows=800");
        sb.append("&addr=" + URLEncoder.encode(two, "UTF-8"));

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.connect();

        SAXBuilder builder = new SAXBuilder();
        Document doc = builder.build(conn.getInputStream());
        Element root = doc.getRootElement();
        Element body = root.getChild("body");
        Element items = body.getChild("items");
        List<Element> list = items.getChildren("item");

        ChargeVO[] ar = new ChargeVO[list.size()];

        int i = 0;
        for (Element e : list) {

            String addr = e.getChildText("addr"); // 충전소
            String chargeTp = e.getChildText("chargeTp"); // 충전기 타입
            String cpId = e.getChildText("cpId"); // 충전기 id
            String cpNm = e.getChildText("cpNm"); // 충전기 명칭
            String cpStat = e.getChildText("cpStat"); // 충전기 상태코드
            String csNm = e.getChildText("csNm"); // 충전소 명칭
            String lat = e.getChildText("lat"); // 위도
            String longi = e.getChildText("longi"); // 경도
            String cpTp = e.getChildText("cpTp"); // 충전방식
            String csId = e.getChildText("csId"); // 충전소 id
            String statUpdateDatetime = e.getChildText("statUpdateDatetime"); // 충전기 상태 갱신 시각 id

            ChargeVO vo = new ChargeVO(addr, chargeTp, cpId, cpNm, cpStat, cpTp, csId, csNm, lat, longi,
                    statUpdateDatetime);

            ar[i++] = vo;

        }

        Arrays.sort(ar, new Comparator<ChargeVO>() {
            @Override
            public int compare(ChargeVO c1, ChargeVO c2) {
                return Integer.compare(Integer.parseInt(c1.getCsId()), Integer.parseInt(c2.getCsId()));
            }

        });

        for (int x = 0; x < ar.length; x++) {
            for (int y = 0; y < ar.length; y++) {
                if (ar[x].getCsId().equals(ar[y].getCsId())) {
                    if ("1".equals(ar[y].getCpStat())) {
                        ar[x].setCpStat("1");
                    } else if (!"1".equals(ar[x].getCpStat())) {
                        if ("2".equals(ar[y].getCpStat())) {
                            ar[x].setCpStat("2");
                        }
                    }
                }
            }
        }
        // 공지사항
        BbsVO[] b_ar = service.notice_user(1, 5, null, null);

        mv.addObject("b_ar", b_ar);
        mv.addObject("ar", ar);
        mv.addObject("len", ar.length);
        mv.setViewName("/main/test");

        return mv;
    }

}
