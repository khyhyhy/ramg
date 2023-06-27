package com.kdt.finalproject.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.MemVO;

import javax.servlet.http.HttpSession;

@Controller
public class NaverController {

    @Autowired
    private LoginService ls;

    @Autowired
    private HttpSession session;

    @RequestMapping("/naver/login")
    public ModelAndView naverLogin(String code, String state) {
        // 카카오 서버에서 인증코드를 전달해 주는 곳이며 여기서
        // 코드(토큰) 값을 받아야 두번째 호출을 할 수 있는 것이다.
        ModelAndView mv = new ModelAndView();
        // 카카오 서버가 인자로 전달해 준 인증(토큰)코드가 code라는 변수로 받아졌다. 확인해보자!
        // System.out.println("CODE:"+code);

        // 이젠 인증코드를 가지고 토큰을 받기 위해 다시 카카오서버를 호출해야 한다.
        // 호출한 후 받아야 하는 것은 refresh토큰을 받아야 한다.
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://nid.naver.com/oauth2.0/token";

        // 위의 URL을 POST방식으로 호출해야 하므로 URL객체를 생성해야 한다.
        try {
            // 웹 상의 경로(URL)를 객체화 시킨다.
            URL url = new URL(reqURL);

            // 우리가 POST방식으로 호출할 경로와 연결한다.
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // 요청방식을 POST로 지정하고, 반드시 doOutput또한 true로 지정해야 한다.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST방식으로 요청하기 위한 준비가 끝이 났고, 이젠 보내고자 하는
            // 파라미터를 문자열로 준비해야 한다.
            // 파라미터 4개를 만들어서 스트림을 통해 보내면 된다.
            StringBuffer sb = new StringBuffer();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=XmayIwrMRA3sOwu2hTor");
            sb.append("&client_secret=vjKVBFhI4M");
            sb.append("&code=" + code);
            sb.append("&state=" + state);

            // 전달하고자 하는 파라미터들을 보낼 output스트림을 준비
            BufferedWriter bw = new BufferedWriter(
                    new OutputStreamWriter(conn.getOutputStream()));

            // 준비된 스트림을 통해 파라미터들을 카카오 API서버로 보낸다.
            bw.write(sb.toString());
            bw.flush(); // 스트림 비운다. 즉, 서버로 완전히 다~~ 보낸다.

            // 결과코드가 궁금하므로 응답을 받자!
            int res_code = conn.getResponseCode();
            // System.out.println("RES_CODE:"+res_code); // 성공시 200

            if (res_code == 200) {
                // 요청을 통해 얻은 JSON타입의 결과 메세지를 읽어온다.
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(conn.getInputStream()));

                // JSON형식의 문자열을 저장할 곳
                StringBuffer result = new StringBuffer();

                // 한줄단위로 읽어서 result라는 StringBuffer에 적재한다.
                String line = null;

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }
                // System.out.println(result.toString());

                // JSON파싱 처리 "access_token"과 "refresh_token"을 잡아내어
                // 카카오 API로 다시 사용자 정보를 요청을 한 후
                // ModelAndView에 저장하여 result.jsp에서 결과를 표현한다.(프로필사진, 별칭, 이메일)
                JSONParser jsonParser = new JSONParser();

                // JSON표현식의 값이 하나의 문자열로 되어 있는 것을 JSON객체로 변환하는
                // 라이브러리를 위에서 생성했다. org.json.simple.parser.JSONParser
                Object obj = jsonParser.parse(result.toString());
                JSONObject json = (JSONObject) obj;
                /*
                 * {
                 * "access_token":"pivprv_Tsi0C8ApDg1g_AJct5vGm3V86O3k5o0sgCj10mAAAAYiUaYue",
                 * "refresh_token":"DK4pOP9eYOqqXSunHx4cdYtF9JssMmpSQg9Sl8FZCj10mAAAAYiUaYue"
                 * }
                 */
                access_Token = (String) json.get("access_token");
                refresh_Token = (String) json.get("refresh_token");

                // System.out.println("access_token:"+access_Token);
                // System.out.println("refresh_token:"+refresh_Token);

                // 마지막 3번째 호출은 사용자 정보를 가져오기 위한 호출이다.
                String apiURL = "https://openapi.naver.com/v1/nid/me";
                String header = "Bearer " + access_Token;

                // 자바에서 특정 웹상의 경로를 호출하기 위해서는 먼저 URL객체가 생성되어야 한다.
                URL url2 = new URL(apiURL);

                HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

                conn2.setRequestMethod("POST");
                conn2.setDoOutput(true);

                // 헤더 지정하기 (카카오 문서에서 헤더 지정은 필수)
                conn2.setRequestProperty("Authorization", header);

                res_code = conn2.getResponseCode();
                // System.out.println("RES_CODE:"+res_code);

                // res_code가 200일 때 카카오API서버로 부터 JSON자원을 읽어서
                // kakao_account.profile
                // kakao_account.name
                // kakao_account.email
                // 위의 3개의 값을 파싱하여 얻어내어 출력해 보자!
                if (res_code == HttpURLConnection.HTTP_OK) { // if(res_code == 200){
                    // 요청에 성공한 경우!!!!

                    // 카카오 서버쪽에서 사용자의 정보를 보냈다. 이것을 읽어와서
                    // 필요한 정보들을 선별해야 한다.
                    BufferedReader brdm = new BufferedReader(
                            new InputStreamReader(conn2.getInputStream(), "UTF-8"));

                    String str = null;// 스트림을 통해 한줄단위로 읽어 저장할 곳
                    StringBuffer res = new StringBuffer();// 위의 str을 누적할 곳

                    while ((str = brdm.readLine()) != null)
                        res.append(str);// 한줄씩 읽어온 JSON자원을 누적!!

                    // 카카오 서버에서 전달되는 모든 JSON값들을 res에 누적 시켰다. 확인~~~~!
                    // System.out.println("RES:"+res.toString());

                    // 받은 값을 JSON객체로 변환한다.
                    obj = jsonParser.parse(res.toString()); // 자바 Object로 변환!
                    json = (JSONObject) obj; // 자바 Object를 JSONObject로 형변환!

                    // 변환된 JSON객체안에서 다시 JSON객체로 얻어내야 하는 것이
                    // 바로 "properties"라는 키의 값이다.
                    JSONObject response = (JSONObject) json.get("response");
                    String nickname = (String) response.get("nickname");
                    String p_img = (String) response.get("profile_image");
                    String email = (String) response.get("email");

                    MemVO mvo = new MemVO();
                    // nickName, p_img, email
                    mvo.setM_name(nickname);
                    mvo.setM_email(email);
                    mvo.setM_pw("0000");

                    MemVO vo = ls.search_email(email);
                    if (vo == null) { // 가입여부 확인
                        ls.add_mem(mvo);// 회원가입 - 최초 접근시 한번만 수행!!
                        // mv.setViewName("mypage/car_mt");
                        vo = mvo;
                    }
                    session.setAttribute("mvo", vo);

                    /*
                     * mv.addObject("nickname", nickName);
                     * mv.addObject("p_img", p_img);
                     * mv.addObject("name", name);
                     */
                } // if문의 끝
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("redirect:/");

        return mv;
    }

}
