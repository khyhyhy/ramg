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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.EdongsikService;
import com.kdt.finalproject.vo.CarVO;
import com.kdt.finalproject.vo.CwriteVO;
import com.kdt.finalproject.vo.MemVO;
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
            tcol = value.getCar_tcol();
            // System.out.println(str);
        }

        // System.out.println(state);
        String url = "https://dapi.kakao.com/v2/local/search/address.json?";
        String restapikey = "Authorization: KakaoAK 560d99cfbbeacf57b6d1aa4d98b99496";

        StringBuffer sb = new StringBuffer();
        sb.append("query=");
        sb.append(state);
        sb.append(" ");
        sb.append(city);
        sb.append(" ");
        sb.append(tcol);

        String address = sb.toString();
        // System.out.println(addr);

        URL obj;

        try {
            // String address = URLEncoder.encode(addr, "UTF-8");
            System.out.println(address);
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

            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            // response 객체를 출력해보자
            System.out.println(response.toString());

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // System.out.println(ar.);

        mv.setViewName("edongsik/carAddr");
        return mv;
    }

}
