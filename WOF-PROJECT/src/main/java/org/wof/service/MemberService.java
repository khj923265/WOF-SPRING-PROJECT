package org.wof.service;


import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectProfileVO;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

public interface MemberService {
    //회원 공통 정보 관련
    String checkId(String userid);
    void sginUp(MemberVO memberVO);
    String checkPw(MemberVO memberVO);
    void Withdrawal(MemberVO memberVO);
    String loginIdCheck(String userid);

    //클라이언트 회원 정보 관련
    ClientVO clientInfo(String userid);
    void clientUpdate(MemberVO memberVO,ClientVO clientVO);

    //파트너스 회원정보 관련
    void partnersUpdate(MemberVO memberVO,PartnersVO partnersVO);
    PartnersVO partnersInfo(String userid);
    List<ProjectProfileVO> projectProfileList(String userid);
    void projectprofileinsert(ProjectProfileVO projectProfileVO);
    ProjectProfileVO projectprofileinfo(String userid);
    void profileupdate(PartnersVO partnersVO);
    void projectprofiledelete(String no);

    //카카오 토큰,회원정보 가져오기
    String kakaoAccessToken(String authorize_code);
    HashMap<String, Object> getUserInfo(String access_Token);

    //카카오 회원가입/로그인
    void kakaoSignup(MemberVO memberVO);

    //id/pw 찾기
    String findIdForm(MemberVO memberVO);
    String findPwForm(MemberVO memberVO);
}
