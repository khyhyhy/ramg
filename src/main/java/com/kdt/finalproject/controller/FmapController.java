package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.ChargeVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class FmapController {

    private String key = "bJ6oLO1YEYJbMWFVcv7pnkobUWW2bUmlGcVWx51o2%2FlRzzNbNqBpgrnzy0DR2yBMEwybwKRo1LYNbEUZJGHF6A%3D%3D";

    // 위치 설정할 jsp로 이동시킴
    @RequestMapping("/fmap2/")
    public String login() {

        return "/fmap/loading";
    }

    // 위치를 받아와서 맵에 뿌려줄 충전소api
    @RequestMapping("/fmap/")
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

        mv.addObject("ar", ar);
        mv.addObject("len", ar.length);
        mv.setViewName("/fmap/fmap");

        return mv;
    }

    // 목록을 클릭 했을때 길찾기 표시를 비동기식 전송방식으로 받음
    @PostMapping("/here")
    @ResponseBody
    public Map<String, Object> searchFestival2(String lati3, String lon3, String lati2, String lon2) throws Exception {
        Map<String, Object> map = new HashMap<>();
        System.out.println("/////////////////////11");
        String apiKey = "f7b7653182e4c0612dac5e8cd9ea9c19";
        StringBuffer sb = new StringBuffer();
        sb.append("https://apis-navi.kakaomobility.com/v1/directions");
        sb.append("?priority=RECOMMEND");
        sb.append("&car_type=1");
        sb.append("&car_fuel=GASOLINE");
        sb.append("&origin=" + lon3 + "%2C" + lati3); // 출발지 위도경도
        sb.append("&destination=" + lon2 + "%2C" + lati2); // 도착지 위도경도
        System.out.println("/////////////////////22");
        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "KakaoAK " + apiKey);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.connect();
        System.out.println("/////////////////////33");
        if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
            // API 호출이 성공한 경우
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(conn.getInputStream());
            JsonNode routes = root.get("routes");

            map.put("key", routes);
        } else {
            // API 호출이 실패한 경우
            map.put("error", "API 호출 실패: " + conn.getResponseCode());
        }
        System.out.println("/////////////////////");
        return map;
    }

}
