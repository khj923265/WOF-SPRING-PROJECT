package org.wof.service;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.AuthVO;
import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;
import org.wof.mapper.MemberMapper;

@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{

    private PasswordEncoder passwordEncoder;
    private MemberMapper mapper;

    @Override
    public String checkId(String userid) {
        return mapper.checkId(userid);
    }

    @Transactional
    @Override
    public void sginUp(MemberVO memberVO) {
        memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));

        AuthVO authVO = new AuthVO();
        authVO.setUserid(memberVO.getUserid());
        authVO.setAuth(memberVO.getAuth());

        mapper.signUp(memberVO);
        mapper.insertAuth(authVO);

        if (memberVO.getAuth().equals("ROLE_PARTNERS")){
            mapper.signUpPartners(memberVO);
        }else if (memberVO.getAuth().equals("ROLE_CLIENT")){
            mapper.signUpClient(memberVO);
        }

    }

    @Override
    public PartnersVO partnersInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.partnersInfo(member_no);
    }

    @Override
    public ClientVO clientInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.clientInfo(member_no);
    }
}
