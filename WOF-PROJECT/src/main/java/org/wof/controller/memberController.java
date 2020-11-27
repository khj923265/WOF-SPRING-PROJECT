package org.wof.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;
import org.wof.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class memberController {

    private MemberService service;

    //로그인 관련 메서드//------------------------------------------------------
    //회원가입 페이지
    @GetMapping("signup")
    public String signUp() {
        return "/member/signup";
    }
    //아이디 중복체크
    @RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
    @ResponseBody
    public String idCheck(@RequestParam("userid") String userid) {
        return service.checkId(userid);
    }

    @PostMapping("signup")
    public String signUp(MemberVO memberVO) {
        service.sginUp(memberVO);
        return "/member/customlogin";
    }
    //로그인시 회원 status 체크,로그인날짜 최신화
    @RequestMapping(value = "/member/loginIdCheck", method = RequestMethod.GET)
    @ResponseBody
    public String loginIdCheck(@RequestParam("userid") String userid){
        return service.loginIdCheck(userid);
    }
    //------------------------------------------------------------------------
    //파트너스 관련 메서드//------------------------------------------------------
    @GetMapping("partners")
    public String partners() {
        return "member/partners";
    }

    //파트너스 로그인시 파트너정보 세션저장컨트롤러(시큐리티 success 핸들러에서만 접근)
    @GetMapping("success/partners")
    public String successPartners(Principal principal, HttpServletRequest request) {
        HttpSession session = request.getSession();

        PartnersVO partnersVO = service.partnersInfo(principal.getName());

        session.setAttribute("partners", partnersVO);

        return "redirect:/member/partners/profile_info";
    }
    @GetMapping("partners/profile_info_update")
    public String partnersInfoUpdate(){
        return "member/partners/profile_info_update";
    }

    @GetMapping("partners/profile_info")
    public String partnersInfo() {
        return "member/partners/profile_info";
    }

    @GetMapping("partners/profile_info_insert")
    public String partnersInfoInsert() {
        return "profile_info_insert";
    }
    //파트너스 개인정보 수정
    @PostMapping("partnersinfoupdate")
    public String infoUpdate(MemberVO memberVO,PartnersVO partnersVO){

        service.partnersUpdate(memberVO,partnersVO);
        return "member/partners/profile_info";
    }
    //------------------------------------------------------------------------
    //클라이언트 관련 메서드-------------------------------------------------------
    @GetMapping("client")
    public String client() {
        return "member/client";
    }
    //클라이언트 로그인시 클라이언트정보 세션저장컨트롤러(시큐리티 success 핸들러에서만 접근)
    @GetMapping("success/client")
    public String clientInfoInsert(Principal principal,HttpServletRequest request){
        HttpSession session = request.getSession();

        ClientVO clientVO = service.clientInfo(principal.getName());

        session.setAttribute("client",clientVO);

        return "redirect:/member/client/dashboard_client";
    }
    @GetMapping("client/dashboard_client")
    public void dashboard_client(){}
    @GetMapping("client/client_info_update")
    public void clientInfoUpdatePage(){}
    //클라이언트 회사정보 수정
    @PostMapping("clientinfoupdate")
    public String clientInfoUpdate(MemberVO memberVO,ClientVO clientVO){

        service.clientUpdate(memberVO,clientVO);

        return "redirect:/member/client/dashboard_client";
    }

    //------------------------------------------------------------------------
    //공통메서드or기타
    @GetMapping("admin")
    public String admin() {
        return "member/admin";
    }
    //회원탈퇴
    @PostMapping("withdrawal")
    public String Withdrawal(MemberVO memberVO){
        memberVO.setStatus("탈퇴");
        service.Withdrawal(memberVO);
        return "redirect:/customlogout";
    }
    //회원정보수정 비밀번호 확인
    @RequestMapping(value = "/member/pwcheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
    @ResponseBody
    public String method(@RequestBody MemberVO memberVO){
        return service.checkPw(memberVO);
    }


}