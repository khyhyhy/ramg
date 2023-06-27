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
public class KakaoController {

    @Autowired
    private HttpSession session;

    @Autowired
    private LoginService ls;

    @RequestMapping("/kakao/login")
    public ModelAndView kakaoLogin(String code) {
        // 카카오 서버에서 인증코드를 전달해주는 곳
        // 코드(토큰)값을 받아야 두번째 호출이 가능하다
        ModelAndView mv = new ModelAndView();

        // 이제는 인증코드를 가지고 토큰을 받기 위해 다시 카카오서버를 호출해야 한다.
        // 호출한 후 받아야하는것은 refresh 토큰이다.

        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        // 위의 URL을 POST방식으로 호출해야 하므로 URL객체를 생성해야 한다.

        try {

            // 웹상의 경로(URL)를 객체화 시킨다.
            URL url = new URL(reqURL);

            // post방식으로 호출할 경로와 연결
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // 요청방식을 POST로 지정하고, 반드시 doOutput 또한 true로 지정해야 한다.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // 지금까지 POST방식으로 요청하기 위한 준비가 끝이났고, 이젠 보내고자 하는 파라미터를 문자열로 준비해야한다.
            // 파라미터 4개를 만들어서 스트림을 통해 보내면 된다.
            StringBuffer sb = new StringBuffer();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=45360f73f863670b5f6cfb33bf1fa775"); // 수정
            sb.append("&redirect_uri=http://localhost:8080/kakao/login");
            sb.append("&code=" + code);

            // 전달하고자하는 파라미터들을 보낼 outputstream을 준비
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

            // 준비된 스트림을 통해 파라미터들을 카카오 API서버로 보낸다.
            bw.write(sb.toString());
            bw.flush();

            int res_code = conn.getResponseCode();
            // System.out.println("RES_CODE"+res_code);

            if (res_code == 200) {
                // 요청을 통해 얻은 JSON 타입의 결과메세지를 읽어온다.
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

                // "JSON 형식의 문자열"을 저장할곳
                StringBuffer result = new StringBuffer();

                // 한줄 단위로 읽어서 result라는 StringBuffer에 적재한다.
                String line = null;

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }
                // System.out.println(result.toString());

                // JSON 파싱처리를 하기 위해서 "access_token"과 "refresh_token"을 잡아내어
                // 카카오 API로 다시 사용자 정보를 요청한 후에,
                // modelandview에 저장하여 result.jsp에서 결과를 표현한다. (프로필 사진, 별칭, 이메일)
                JSONParser jsonParser = new JSONParser();

                // JSON 표현식의 값이 하나의 문자열로 되어있는것을 JSON 객체로 변환하는
                // 라이브러리를 위에서 생성했음. org.json.simple.parser.JSONParser
                Object obj = jsonParser.parse(result.toString());
                JSONObject json = (JSONObject) obj;

                /*
                 * {"access_token":"_3DjvtObWRzCqr_d7xsgML2wtgfLPHWXDbkHsdJKCj1y6gAAAYiUaY__",
                 * "token_type":"bearer","refresh_token":
                 * "Bk02XH2myx8ONXpdYx5_X8yjFxVAfm7HFkdOlM5OCj1y6gAAAYiUaY_9",
                 * "expires_in":21599,"scope":"profile_image profile_nickname"
                 * ,"refresh_token_expires_in":5183999}
                 */
                access_Token = (String) json.get("access_token");
                refresh_Token = (String) json.get("refresh_token");

                // System.out.println("access_token:"+access_Token);
                // System.out.println("refresh_token:" + refresh_Token);

                // 마지막 3번째 호출은 사용자 정보를 가져오기 위한 호출이다.
                String apiURL = "https://kapi.kakao.com/v2/user/me";
                String header = "Bearer " + access_Token;

                // 자바에서 특정 웹상의 경로를 호출하기 위해서는 먼저 URL 객체가 생성되어야 한다.
                URL url2 = new URL(apiURL);

                HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
                conn2.setRequestMethod("POST");
                conn2.setDoOutput(true);

                // 헤더 지정하기 (카카오 문서에서 헤더 지정은 필수)
                conn2.setRequestProperty("Authorization", header);

                res_code = conn2.getResponseCode();
                // System.out.println("RES_CODE: "+res_code);

                // res_code가 200일때 카카오API 서버로부터 JSON 자원을 읽어서
                // kakao_account.profile, kakao_account.name, kakao_account.email
                // 위 3개의 값을 파싱하여 얻어내어 출력하기

                if (res_code == HttpURLConnection.HTTP_OK) { // if(res_code == 200){
                    // 요청에 성공한 경우!!!!

                    // 카카오 서버쪽에서 사용자의 정보를 보냈다. 이것을 읽어와서
                    // 필요한 정보들을 선별해야 한다.
                    BufferedReader brdm = new BufferedReader(
                            new InputStreamReader(conn2.getInputStream(), "utf-8"));

                    String str = null;// 스트림을 통해 한줄단위로 읽어 저장할 곳
                    StringBuffer res = new StringBuffer();// 위의 str을 누적할 곳

                    while ((str = brdm.readLine()) != null)
                        res.append(str);// 한줄씩 읽어온 JSON자원을 누적!!

                    // 카카오 서버에서 전달되는 모든 JSON값들을 res에 누적 시켰다.
                    // System.out.println("RES:"+res.toString());

                    // 받은 값을 JSON객체로 변환한다.
                    obj = jsonParser.parse(res.toString()); // 자바 Object로 변환!
                    json = (JSONObject) obj; // 자바 Object를 JSONObject로 형변환!

                    // 변환된 JSON객체안에서 다시 JSON객체로 얻어내야 하는 것이
                    // 바로 "properties"라는 키의 값이다.
                    JSONObject props = (JSONObject) json.get("properties");
                    String nickName = (String) props.get("nickname");
                    String p_img = (String) props.get("profile_image");

                    // System.out.println("NICK_NAME:"+nickName);
                    // System.out.println("PROFILE_IMAGE:"+p_img);

                    // 이메일을 얻기위해 "kakao_account"키의 정보를 다시 JSONObject로 가져온다.
                    JSONObject kakao_acc = (JSONObject) json.get("kakao_account");
                    String email = (String) kakao_acc.get("email");

                    JSONObject profile = (JSONObject) kakao_acc.get("profile");
                    nickName = (String) profile.get("nickname");
                    p_img = (String) profile.get("profile_image_url");

                    MemVO mvo = new MemVO();
                    // p_img,nickName,email
                    mvo.setM_name(nickName);
                    mvo.setM_email(email);
                    mvo.setM_pw("0000");

                    MemVO vo = ls.search_email(email);
                    if (vo == null) { // 가입여부 확인
                        ls.add_mem(mvo);// 회원가입 - 최초 접근시 한번만 수행!!
                        // mv.setViewName("mypage/car_mt");
                        vo = mvo;
                    }

                    session.setAttribute("mvo", vo);

                } // if문의 끝

            } // if문 끝

        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("redirect:/main/");
        return mv;

    }

}
