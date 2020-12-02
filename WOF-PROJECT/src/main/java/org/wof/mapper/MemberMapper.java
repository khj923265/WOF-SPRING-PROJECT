package org.wof.mapper;

import org.wof.domain.*;

import java.util.List;

public interface MemberMapper {

    //공통 회원 정보
    MemberVO read(String username);
    int signUp(MemberVO memberVO);
    int insertAuth(AuthVO authVO);
    String checkId(String userid);
    String memberNo(String userid);
    int signUpPartners(MemberVO memberVO);
    int signUpClient(MemberVO memberVO);
    String checkPw(String member_no);
    String checkPw2(String userid);
    int Withdrawal(MemberVO memberVO);
    String loginIdCheck(String userid);
    void loginsysdate(String userid);
    void userPhoneUpdate(MemberVO memberVO);

    //클라이언트
    ClientVO clientInfo(String member_no);
    void clientUpdate2(ClientVO clientVO);
    void clientUpdate3(MemberVO memberVO);

    //파트너스
    List<ProjectProfileVO> projectProfileList(String userid);
    void projectprofileinsert(ProjectProfileVO projectProfileVO);
    ProjectProfileVO projectprofileinfo(String userid);
    void profileupdate(PartnersVO partnersVO);
    void projectprofiledelete(String no);
    void partnersUpdate2(PartnersVO partnersVO);
    void partnersUpdate3(MemberVO memberVO);
    PartnersVO partnersInfo(String member_no);
    void projectProfileUpdate(ProjectProfileVO projectProfileVO);
    void meetingupdate(MeetVO meetVO);
    MeetVO meetInfo(String meet_id);

    //카카오 로그인 관련
    int kakaoSignup(MemberVO memberVO);
    String kakaoIdCheck(String userid);

    //id/pw 찾기
    int findIdCount(MemberVO memberVO);
    String findIdForm(MemberVO memberVO);
    int findPwCount(MemberVO memberVO);
    int setEncodePassword(MemberVO memberVO);
}
