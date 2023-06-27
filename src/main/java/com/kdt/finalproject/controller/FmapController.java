package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.print.DocFlavor.STRING;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.vo.ChargeVO;

@Controller
public class FmapController {

    private String key = "bJ6oLO1YEYJbMWFVcv7pnkobUWW2bUmlGcVWx51o2%2FlRzzNbNqBpgrnzy0DR2yBMEwybwKRo1LYNbEUZJGHF6A%3D%3D";

    @RequestMapping("/fmap/")
    public ModelAndView searchCharger() throws Exception {

        ModelAndView mv = new ModelAndView();
        // 한전공공api :
        // http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=bJ6oLO1YEYJbMWFVcv7pnkobUWW2bUmlGcVWx51o2%2FlRzzNbNqBpgrnzy0DR2yBMEwybwKRo1LYNbEUZJGHF6A%3D%3D&pageNo=1&numOfRows=10&addr=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C
        // 한전 에너지센터 : https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do

        String city = "서울특별시";
        StringBuffer sb = new StringBuffer();
        sb.append("http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList");
        sb.append("?serviceKey=" + key);
        sb.append("&pageNo=1");
        sb.append("&numOfRows=400");
        sb.append("&addr=" + URLEncoder.encode(city, "UTF-8"));

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
        mv.addObject("ar", ar);
        mv.setViewName("/fmap/fmap");
        System.out.println("ddddddddddddd여기왔어");
        return mv;
    }
}
