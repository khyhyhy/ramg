package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.LoginMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class LoginService {

    @Autowired
    private LoginMapper l_Mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 비지니스 메서드(로직)
    public MemVO[] getList() {
        MemVO[] ar = null;

        List<MemVO> list = l_Mapper.getList();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO login(MemVO mvo) { // 객체 안에 m_email, m_name, m_pw있음.

        MemVO vo = l_Mapper.login(mvo);

        if (vo != null) {
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }

        // Map<String, String> map = new HashMap<>();
        // map.put("m_email", m_email);
        // map.put("m_pw", m_pw);
        // map.put("m_class", m_class);

        return null;
    }

    // 회원가입
    public int add_mem(MemVO mvo) {

        MemVO vo = new MemVO();
        vo.setM_email(mvo.getM_email());
        vo.setM_name(mvo.getM_name());
        vo.setM_class(mvo.getM_class()); // 이거 추가해봄

        vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));

        return l_Mapper.add_mem(vo);
    }

    // 어차피 이메일로 가입할거라 id체크 굳이 필요없음
    // public MemVO check_id(String id){
    // return m_Mapper.check_id(id);
    // }

    public MemVO search_email(String m_email) {
        return l_Mapper.search_email(m_email);
    }

    public MemVO check_email(String m_email) {
        return l_Mapper.check_email(m_email);
    }

}
