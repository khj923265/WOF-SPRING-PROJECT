package org.wof.service;


import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;

public interface MemberService {
    String checkId(String userid);
    void sginUp(MemberVO memberVO);
    PartnersVO partnersInfo(String userid);
    ClientVO clientInfo(String userid);
    String checkPw(MemberVO memberVO);
    void Withdrawal(MemberVO memberVO);
    void partnersUpdate(MemberVO memberVO,PartnersVO partnersVO);
    String loginIdCheck(String userid);
    void clientUpdate(MemberVO memberVO,ClientVO clientVO);
}
