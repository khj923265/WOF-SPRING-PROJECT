package org.wof.service;


import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;

public interface MemberService {
    String checkId(String userid);
    void sginUp(MemberVO memberVO);
    PartnersVO partnersInfo(String member_no);

}
