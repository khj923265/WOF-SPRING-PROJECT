package org.wof.service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
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
@Log4j
public class MemberServiceImpl implements MemberService{

    private PasswordEncoder passwordEncoder;
    private MemberMapper mapper;
    //아이디 확인
    @Override
    public String checkId(String userid) {
        return mapper.checkId(userid);
    }
    //회원가입
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
    //파트너스 정보
    @Override
    public PartnersVO partnersInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.partnersInfo(member_no);
    }
    //클라이언트 정보
    @Override
    public ClientVO clientInfo(String userid) {
        String member_no = mapper.memberNo(userid);
        return mapper.clientInfo(member_no);
    }
    //비밀번호 확인
    @Override
    public String checkPw(MemberVO memberVO) {
        String data = "0";
        String userpwEc = mapper.checkPw(memberVO.getMember_no());

        if(passwordEncoder.matches(memberVO.getUserpw(),userpwEc)){
            data = "1";
        }
        return data;
    }
    //회원탈퇴
    @Override
    public void Withdrawal(MemberVO memberVO) {
        mapper.Withdrawal(memberVO);
    }

    //파트너스 회원정보수정
    @Transactional
    @Override
    public void partnersUpdate(MemberVO memberVO,PartnersVO partnersVO) {
            //비밀번호가 입력이 안된경우
        if (memberVO.getUserpw() == null||memberVO.getUserpw() == "") {
            mapper.partnersUpdate(memberVO);
            mapper.partnersUpdate2(partnersVO);
        }else {//비밀번호가 입려된 경우
            memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
             mapper.partnersUpdate3(memberVO);
             mapper.partnersUpdate2(partnersVO);
        }
    }
}
