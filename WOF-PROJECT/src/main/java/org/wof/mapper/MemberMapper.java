package org.wof.mapper;

import org.wof.domain.AuthVO;
import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;

public interface MemberMapper {
    MemberVO read(String username);
    int signUp(MemberVO memberVO);
    int insertAuth(AuthVO authVO);
    String checkId(String userid);
    String memberNo(String userid);
    PartnersVO partnersInfo(String member_no);
    ClientVO clientInfo(String member_no);
    int signUpPartners(MemberVO memberVO);
    int signUpClient(MemberVO memberVO);
    String checkPw(String userpw);
    int Withdrawal(MemberVO memberVO);
    void partnersUpdate(MemberVO memberVO);
    void partnersUpdate2(PartnersVO partnersVO);
    void partnersUpdate3(MemberVO memberVO);

}
