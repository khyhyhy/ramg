package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.EdongsikService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.ServiceVO;
import com.kdt.finalproject.vo.SwriteVO;

@Controller
public class EdongsikController {

    private String state;
    private String city;
    private String tcol;

    @Autowired
    HttpSession session;

    @Autowired
    EdongsikService service;

    @RequestMapping("/edongsik/")
    public String edongsik() {
        MemVO vo = service.init();

        // String str = vo.getM_idx();
        // System.out.println(str);
        session.setAttribute("evo", vo);

        return "edongsik/edongsik";
    }

    @RequestMapping("/edongsik/map")
    public String edongsi() {

        return "map/map";
    }

    @RequestMapping("/carAddr/")
    public ModelAndView carAddr(String m_idx) throws IOException {

        ModelAndView mv = new ModelAndView();

        CwriteVO cwvo = service.carList(m_idx);
        List<CarVO> ar = cwvo.getCar_list();
        for (CarVO value : ar) {
            state = value.getC_state();
            city = value.getC_city();
            tcol = value.getC_addr1();
            //tcol = "신림동";
            // System.out.println(str);
        }

        // System.out.println(state);
        String url = "https://dapi.kakao.com/v2/local/search/address.json?query=";
        String restapikey = "KakaoAK 560d99cfbbeacf57b6d1aa4d98b99496";

        StringBuffer sb = new StringBuffer();
        sb.append(state);
        sb.append(" ");
        sb.append(city);
        sb.append(" ");
        sb.append(tcol);

        String addr = sb.toString();
        // System.out.println(addr);

        URL obj;

        try {
            String address = URLEncoder.encode(addr, "UTF-8");
            // System.out.println(address);
            obj = new URL(url + address);

            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", restapikey);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);

            Charset charset = Charset.forName("UTF-8");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));

            String inputLine = null;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            // response 객체를 출력해보자
            // System.out.println("RES :" + response.toString());

            JSONParser jsonParser = new JSONParser();
            JSONObject json_data = (JSONObject) jsonParser.parse(response.toString());
            JSONArray documents = (JSONArray) json_data.get("documents");
            JSONObject data = (JSONObject) documents.get(0);

            String x = (String) data.get("x");
            String y = (String) data.get("y");

            // System.out.println("x:" + x + ", y:" + y);

            mv.addObject("x", x);
            mv.addObject("y", y);
            // -------------------- 고객 위치 값 구하기 끝 ----------------------------

            // 충전 기사들의 위치값 가져오기
            ServiceVO[] sar = service.getEdongsik();
            for (ServiceVO value : sar) {
                String s_x = value.getS_mapx();
                String s_y = value.getS_mapy();

                System.out.println("이동식차량 x:" + s_x + ", 이동식차량 y:" + s_y);

            }

            // v

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // System.out.println(ar.);

        mv.setViewName("edongsik/carAddr");
        return mv;
    }

}
