package org.wof.service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
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
            mapper.userPhoneUpdate(memberVO);
            mapper.partnersUpdate2(partnersVO);
        }else {//비밀번호가 입력된 경우
            memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
             mapper.partnersUpdate3(memberVO);
             mapper.partnersUpdate2(partnersVO);
        }
    }
    //로그인시 회원 상태체크,로그인날짜 최신화
    @Override
    public String loginIdCheck(String userid) {
        String status;
        log.info("userid : " + userid);
        MemberVO memberVO = mapper.loginIdCheck(userid);
        if (memberVO.getStatus() != null) {
            status = memberVO.getStatus();
            if (status.equals("탈퇴")) {
                status = "1";
            } else if (status.equals("휴면")) {
                status = "2";
            } else {
                mapper.loginsysdate(userid);
                status = "0";
            }
        }else {
            status = "3";
        }
        log.info("status : " + status);
        return status;
    }

    @Transactional
    @Override
    public void clientUpdate(MemberVO memberVO, ClientVO clientVO) {
        //비밀번호가 입력이 안된경우
        if (memberVO.getUserpw() == null||memberVO.getUserpw() == "") {
            mapper.userPhoneUpdate(memberVO);
            mapper.clientUpdate2(clientVO);
        }else {//비밀번호가 입력된 경우
            memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
            mapper.clientUpdate3(memberVO);
            mapper.clientUpdate2(clientVO);
        }
    }
}
