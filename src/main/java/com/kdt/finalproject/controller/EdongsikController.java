package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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

import lombok.val;

@Controller
public class EdongsikController {

    String state;
    String city;
    String addr1;

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
    public ModelAndView carAddr(String m_idx) throws Exception {

        ModelAndView mv = new ModelAndView();

        CwriteVO cwvo = service.carList(m_idx);
        List<CarVO> ar = cwvo.getCar_list();
        for (CarVO value : ar) {
            state = value.getC_state();
            city = value.getC_city();
            addr1 = value.getC_addr1();
            // tcol = "신림동";
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
        sb.append(addr1);

        String addr = sb.toString();
        // System.out.println(addr);

        URL obj;

        int lo;

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

            mv.addObject("c_ar", ar);

            // -------------------- 고객 위치 값 구하기 끝 ----------------------------

            // 충전 기사들의 위치값 가져오기
            ServiceVO[] sar = service.getEdongsik(state);
            List<ServiceVO> list = new ArrayList<>();

            for (ServiceVO value : sar) {
                // String s_x = value.getS_mapx();
                // String s_y = value.getS_mapy();

                // System.out.println("이동식차량 x:" + s_x + ", 이동식차량 y:" + s_y);

                double lat = Double.valueOf(value.getS_mapy());// 기사위치
                double lng = Double.valueOf(value.getS_mapx());
                double lat2 = Double.parseDouble(y); // 고객 차량 y
                double lng2 = Double.parseDouble(x); // 고객 차량 x
                double dLat = Math.toRadians(lat - lat2);
                double dLon = Math.toRadians(lng - lng2);

                double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                        + Math.cos(Math.toRadians(lat)) * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2)
                                * Math.sin(dLon / 2);
                double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                double d = 6371 * c * 1000; // Distance in m
                System.out.println("현재 지점 " + addr1 + "과 좌표값의 거리는 " + d + "m입니다.");

                lo = (int) Math.round(d);

                System.out.println("lo==" + lo);
                System.out.println(value.getS_radius());
                // --------------------------------------------------------------------------------

                if (lo <= Integer.valueOf(value.getS_radius())) {
                    list.add(value);
                }

            }

            if (list.size() > 0) {

                mv.addObject("s_ar", list);
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // System.out.println(ar.);

        mv.setViewName("edongsik/e_info");
        return mv;
    }

    @RequestMapping("/e_search/")
    public ModelAndView init(@Param("addr") String addr) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("addr", addr);
        mv.setViewName("edongsik/e_search");
        return mv;
    }

    public int guri(double hlat, double hlng, double plat, double plng) {
        int radius = 0;

        double dLat = Math.toRadians(hlat - plat);
        double dLon = Math.toRadians(hlng - plng);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(hlat)) * Math.cos(Math.toRadians(plat)) * Math.sin(dLon / 2)
                        * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double d = 6371 * c * 1000; // Distance in m
        radius = (int) Math.round(d);
        return radius;
    }

    @RequestMapping("/e_search/select/")
    public ModelAndView select(@Param("nowlat") String nowlat, @Param("nowlng") String nowlng,
            @Param("nowstate") String nowstate, @Param("nowcity") String nowcity) {
        ModelAndView mv = new ModelAndView();
        // double lat = 37.48489405082669;
        // double lng = 126.90278513630275;
        double lat2 = Double.parseDouble(nowlat);
        double lng2 = Double.parseDouble(nowlng);
        double dLat = Math.toRadians(Double.parseDouble(nowlat) - lat2);
        double dLon = Math.toRadians(Double.parseDouble(nowlng) - lng2);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(Double.parseDouble(nowlat))) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double d = 6371 * c * 1000; // Distance in m

        // System.out.println("현재 지점" + nowstate + "과 구로 디지털 단지의 역 거리는 " + d + "m입니다.");
        System.out.println("nowcity ==" + nowcity);

        // if (nowstate.contains(sp) || nowstate.contains(mp) || nowstate.contains(wp))
        // {
        // System.out.println("현재 위치는 특별 혹은 광역 혹은 자치 시입니다.");
        ServiceVO[] ar = service.getEdongsik(nowstate);

        int idx = 1;

        for (ServiceVO vo : ar) {
            int radius = guri(Double.parseDouble(nowlat), Double.parseDouble(nowlng),
                    Double.parseDouble(vo.getS_mapx()), Double.parseDouble(vo.getS_mapy()));

            System.out.println(vo.getS_city() + "의" + idx + "번째 서비스 구역의 커버범위는" + vo.getS_radius() + "m 입니다");

            if (radius < Integer.parseInt(vo.getS_radius()))
                System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 가능합니다");
            else
                System.out.println("현재 서비스 객체와의 거리는 " + radius + "M이므로 서비스가 불가합니다");
            ++idx;
        }

        // }

        return mv;

    }

    @RequestMapping("/e_search/addr/")
    public ModelAndView select2(@Param("addr") String addr) {
        ModelAndView mv = new ModelAndView();

        mv.setViewName(addr);
        return mv;

    }

}
