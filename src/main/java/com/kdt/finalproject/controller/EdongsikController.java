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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.javassist.expr.NewArray;
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
import com.kdt.finalproject.vo.SuseVO;
import com.kdt.finalproject.vo.SwriteVO;

import lombok.val;

@Controller
public class EdongsikController {

    @Autowired
    HttpSession session;

    @Autowired
    EdongsikService service;

    @RequestMapping("/edongsik/")
    public ModelAndView edongsik() {
        ModelAndView mv = new ModelAndView();

        MemVO mvo1 = (MemVO) session.getAttribute("mvo");
        if (mvo1 != null) {
            String m_idx = mvo1.getM_idx();
            System.out.println("진짜 세션: " + m_idx);

            List<CwriteVO> cw_ar = new ArrayList<CwriteVO>();
            cw_ar = service.carList(m_idx);
            List<CarVO> carVo = new ArrayList<CarVO>();
            for (CwriteVO kkk : cw_ar) {
                CarVO kkk2 = kkk.getCvo();

                carVo.add(kkk2);
            }
            mv.addObject("carVo", carVo);
        }
        mv.setViewName("edongsik/edongsik");

        return mv;
    }

    @RequestMapping("/carAddr/")
    public ModelAndView carAddr(String c_idx) throws Exception {

        ModelAndView mv = new ModelAndView();

        CarVO c_vo = service.carList3(c_idx);
        List<CarVO> c_ar = new ArrayList<CarVO>();
        c_ar.add(c_vo);
        mv.addObject("c_ar", c_ar);

        String state = c_vo.getC_state();
        String city = c_vo.getC_city();
        String addr1 = c_vo.getC_addr1();

        System.out.println(state);
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

            // -------------------- 고객 위치 값 구하기 끝 ----------------------------

            // 충전 기사들의 위치값 가져오기
            ServiceVO[] sar = service.getEdongsik(state);
            List<SwriteVO> swar = new ArrayList<SwriteVO>();

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
                        + Math.cos(Math.toRadians(lat)) * Math.cos(Math.toRadians(lat2)) *
                                Math.sin(dLon / 2)
                                * Math.sin(dLon / 2);
                double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                double d = 6371 * c * 1000; // Distance in m
                System.out.println("현재 지점 " + addr1 + "과 좌표값의 거리는 " + d + "m입니다.");

                lo = (int) Math.round(d);

                System.out.println("lo==" + lo);
                System.out.println(value.getS_radius());
                // --------------------------------------------------------------------------------

                if (lo <= Integer.valueOf(value.getS_radius())) {

                    String s_idx = value.getS_idx();
                    SwriteVO swvo = service.radiusInfo(s_idx);
                    swar.add(swvo);

                    mv.addObject("swar", swar);
                }

            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // System.out.println(ar.);

        mv.setViewName("edongsik/e_info");
        return mv;
    }

    @RequestMapping("/local/")
    public ModelAndView local(@Param("lat") String lat, @Param("lng") String lng) {
        ModelAndView mv = new ModelAndView();
        System.out.println("lat======" + lat + "lng=====" + lng);
        mv.addObject("lat", lat);
        mv.addObject("lng", lng);
        mv.setViewName("edongsik/e_search");
        return mv;
    }

    @RequestMapping("/e_order/")
    public ModelAndView e_order(String s_idx, String su_idx) {
        ModelAndView mv = new ModelAndView();
        SuseVO suvo = service.getOrder(su_idx);
        mv.addObject("suvo", suvo);

        SwriteVO swvo = service.radiusInfo(s_idx);
        MemVO mvo = swvo.getMvo();
        ServiceVO svo = swvo.getSvo();

        mv.addObject("mvo", mvo);
        mv.addObject("svo", svo);

        mv.setViewName("edongsik/e_order");
        return mv;
    }

    @RequestMapping("/e_nowOrder/")
    public ModelAndView e_nowOrder() {
        ModelAndView mv = new ModelAndView();

        MemVO mvo1 = (MemVO) session.getAttribute("mvo");
        String m_idx = mvo1.getM_idx();

        // System.out.println("세션" + m_idx);

        List<CwriteVO> cwList = new ArrayList<CwriteVO>();
        cwList = service.getOrderList(m_idx);

        List<SuseVO> suar = new ArrayList<SuseVO>();

        for (CwriteVO cwvo : cwList) {
            List<SuseVO> su_list = cwvo.getSuvo();

            for (SuseVO su_vo : su_list) {
                su_vo.setCwvo(cwvo);
                suar.add(su_vo);
                System.out.println("c_idx" + su_vo.getC_idx());
                System.out.println("Su_date" + su_vo.getSu_date());
                System.out.println("s_idx" + su_vo.getS_idx());

                String s_idx = su_vo.getS_idx();
                System.out.println(s_idx);

                // SwriteVO swvo = service.getBusiness(s_idx);

                SwriteVO swvo = service.radiusInfo(s_idx);

                MemVO mvo = swvo.getMvo();
                ServiceVO svo = swvo.getSvo();

                su_vo.setSvo(svo);
                su_vo.setMvo(mvo);

                System.out.println(mvo.getM_idx());
                System.out.println(svo.getS_type());
            }

        }

        mv.addObject("suar", suar);

        mv.setViewName("edongsik/e_nowOrder");
        return mv;
    }

    @RequestMapping("/e_orderList/")
    public ModelAndView e_orderList() {
        ModelAndView mv = new ModelAndView();

        MemVO mvo1 = (MemVO) session.getAttribute("mvo");
        String m_idx = mvo1.getM_idx();

        // System.out.println("세션" + m_idx);

        List<CwriteVO> cwList = new ArrayList<CwriteVO>();
        cwList = service.getOrderList(m_idx);

        List<SuseVO> suar = new ArrayList<SuseVO>();

        for (CwriteVO cwvo : cwList) {
            List<SuseVO> su_list = cwvo.getSuvo();

            for (SuseVO su_vo : su_list) {
                su_vo.setCwvo(cwvo);
                suar.add(su_vo);
                System.out.println("c_idx" + su_vo.getC_idx());
                System.out.println("Su_date" + su_vo.getSu_date());
                System.out.println("s_idx" + su_vo.getS_idx());

                String s_idx = su_vo.getS_idx();
                System.out.println(s_idx);

                // SwriteVO swvo = service.getBusiness(s_idx);

                SwriteVO swvo = service.radiusInfo(s_idx);

                MemVO mvo = swvo.getMvo();
                ServiceVO svo = swvo.getSvo();

                su_vo.setSvo(svo);
                su_vo.setMvo(mvo);

                System.out.println(mvo.getM_idx());
                System.out.println(svo.getS_type());
            }

        }

        mv.addObject("suar", suar);

        mv.setViewName("edongsik/e_orderList");
        return mv;
    }

    @RequestMapping("/e_search/")
    public ModelAndView init(@Param("addr") String addr) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("addr", addr);
        mv.setViewName("edongsik/e_search");
        return mv;
    }

    @RequestMapping("/e_search/select/")
    public ModelAndView select(@Param("nowlat") String nowlat, @Param("nowlng") String nowlng,
            @Param("nowstate") String nowstate, @Param("nowcity") String nowcity) {
        ModelAndView mv = new ModelAndView();

        MemVO mvo1 = (MemVO) session.getAttribute("mvo");
        String m_idx = mvo1.getM_idx();
        System.out.println("세션m_idx:" + m_idx);

        List<CwriteVO> cw_ar = new ArrayList<CwriteVO>();
        cw_ar = service.carList(m_idx);
        List<CarVO> c_ar = new ArrayList<CarVO>();

        for (CwriteVO ccvo : cw_ar) {
            c_ar.add(ccvo.getCvo());
        }
        // System.out.println(cvo.getC_idx());
        mv.addObject("c_ar", c_ar);

        int lo;

        // 충전 기사들의 위치값 가져오기
        ServiceVO[] sar = service.getEdongsik(nowstate);
        List<SwriteVO> swar = new ArrayList<SwriteVO>();

        for (ServiceVO value : sar) {
            // String s_x = value.getS_mapx();
            // String s_y = value.getS_mapy();

            // System.out.println("이동식차량 x:" + s_x + ", 이동식차량 y:" + s_y);

            double lat = Double.valueOf(value.getS_mapy());// 기사위치
            double lng = Double.valueOf(value.getS_mapx());
            double lat2 = Double.parseDouble(nowlat); // 고객 차량 y
            double lng2 = Double.parseDouble(nowlng); // 고객 차량 x
            double dLat = Math.toRadians(lat - lat2);
            double dLon = Math.toRadians(lng - lng2);

            double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                    + Math.cos(Math.toRadians(lat)) * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2)
                            * Math.sin(dLon / 2);
            double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            double d = 6371 * c * 1000; // Distance in m
            System.out.println("현재 지점과 좌표값의 거리는 " + d + "m입니다.");

            lo = (int) Math.round(d);

            System.out.println("lo==" + lo);
            System.out.println(value.getS_radius());
            // --------------------------------------------------------------------------------

            if (lo <= Integer.valueOf(value.getS_radius())) {

                String s_idx = value.getS_idx();
                SwriteVO swvo = service.radiusInfo(s_idx);
                swar.add(swvo);

                mv.addObject("swar", swar);

            }

        }

        mv.setViewName("edongsik/e_info");

        return mv;

    }

}
