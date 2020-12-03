package org.wof.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.wof.domain.ClientVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PartnersVO;
import org.wof.domain.ProjectProfileVO;
import org.wof.security.CustomUserDetailsService;
import org.wof.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class memberController {

    private MemberService service;
    private CustomUserDetailsService customUserDetailsService;

    //로그인 관련 메서드//------------------------------------------------------
    //회원가입 페이지
    @GetMapping("signup")
    public String signUp() {
        return "/member/signup";
    }
    //아이디 중복체크
    @RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
    public ResponseEntity idCheck(@RequestParam("userid") String userid) {
        return ResponseEntity.ok(service.checkId(userid));
    }

    @PostMapping("signup")
    public String signUp(MemberVO memberVO) {
        service.sginUp(memberVO);
        return "/member/customlogin";
    }
    //로그인시 회원 status 체크,로그인날짜 최신화
    @RequestMapping(value = "/member/loginIdPwCheck", method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ResponseEntity loginIdCheck(@RequestBody MemberVO memberVO){
        log.info("memberVO======="+memberVO);
        String status = service.loginIdPwCheck(memberVO);
        log.info("controller_status : "+status);
        return ResponseEntity.ok(status);
    }
    //------------------------------------------------------------------------
    //파트너스 관련 메서드//------------------------------------------------------
    @GetMapping("partners")
    public String partners() {
        return "member/partners";
    }
    @GetMapping("partners/profile_info_update")
    public String partnersInfoUpdate(){
        return "member/partners/profile_info_update";
    }
    @GetMapping("partners/profile_info")
    public String partnersInfo(Principal principal,Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userid = principal.getName();
        PartnersVO partnersVO = service.partnersInfo(userid);

        session.setAttribute("partners", partnersVO);
        model.addAttribute("profilelist",service.projectProfileList(userid));
        return "member/partners/profile_info";
    }
    @GetMapping("partners/profile_info_insert")
    public String partnersInfoInsert() {
        return "profile_info_insert";
    }
    @PostMapping("projectprofileinsert")
    public String partnersprofileinsert(ProjectProfileVO projectProfileVO){
        service.projectprofileinsert(projectProfileVO);
        return "redirect:/member/partners/profile_info";
    }
    @RequestMapping(value = "projectprofileinfo",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity projectprofileinfo(@RequestParam("userid") String userid){
        return ResponseEntity.ok(service.projectprofileinfo(userid));
    }

    //파트너스 로그인시 파트너정보 세션저장컨트롤러(시큐리티 success 핸들러에서만 접근)
    @GetMapping("success/partners")
    public String successPartners(Principal principal, HttpServletRequest request) {
        HttpSession session = request.getSession();

        PartnersVO partnersVO = service.partnersInfo(principal.getName());

        session.setAttribute("partners", partnersVO);

        return "redirect:/member/partners/profile_info";
    }
    //파트너스 개인정보 수정
    @PostMapping("partnersinfoupdate")
    public String infoUpdate(Principal principal,MemberVO memberVO, PartnersVO partnersVO, HttpServletResponse response, HttpServletRequest request){
        HttpSession session = request.getSession();
        memberVO.setUserid(principal.getName());
        service.partnersUpdate(memberVO,partnersVO);
        session.setAttribute("partners",partnersVO);

        List<GrantedAuthority> roles = new ArrayList<>(1);
        String roleStr = "ROLE_PARTNERS";
        roles.add(new SimpleGrantedAuthority(roleStr));
        log.info("*******memberVO : "+memberVO);
        Authentication auth = new UsernamePasswordAuthenticationToken(customUserDetailsService.loadUserByUsername(memberVO.getUserid()), null, roles);

        SecurityContextHolder.getContext().setAuthentication(auth);

        return "redirect:/member/partners/profile_info";
    }
    //자기소개 수정
    @ResponseBody
    @RequestMapping(value = "/member/profileupdate",method = RequestMethod.POST, produces = "application/json; charset=utf8")
    public void profileupdate(@RequestBody PartnersVO partnersVO){
        log.info("profileupdate test : "+partnersVO);
        service.profileupdate(partnersVO);
    }
    //프로젝트/경력 삭제
    @RequestMapping(value = "/member/projectprofiledelete",method = RequestMethod.GET)
    public String projectprofiledelete(@RequestParam("no") String no){
        service.projectprofiledelete(no);
        return "redirect:/member/partners/profile_info";
    }
    //프로젝트/경력 수정
    @PostMapping("projectprofileupdate")
    public String projectprofileupdate(ProjectProfileVO projectProfileVO){
        service.projectProfileUpdate(projectProfileVO);
        return "redirect:/member/partners/profile_info";
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

        return "redirect:/client/dashboard_client?member_no="+clientVO.getMember_no();
    }
    @GetMapping("client/dashboard_client")
    public void dashboard_client(){}
    @GetMapping("client/client_info_update")
    public void clientInfoUpdatePage(){}
    //클라이언트 회사정보 수정
    @PostMapping("clientinfoupdate")
    public String clientInfoUpdate(Principal principal,MemberVO memberVO,ClientVO clientVO,
                                   HttpServletRequest request){
        HttpSession session = request.getSession();
        memberVO.setUserid(principal.getName());
        service.clientUpdate(memberVO,clientVO);
        session.setAttribute("client",clientVO);

        List<GrantedAuthority> roles = new ArrayList<>(1);
        String roleStr = "ROLE_CLIENT";
        roles.add(new SimpleGrantedAuthority(roleStr));

        customUserDetailsService.loadUserByUsername(memberVO.getUserid());

        Authentication auth = new UsernamePasswordAuthenticationToken(customUserDetailsService.loadUserByUsername(memberVO.getUserid()), null, roles);

        SecurityContextHolder.getContext().setAuthentication(auth);



        return "redirect:/client/client/dashboard_client";
    }

    //------------------------------------------------------------------------
    //공통메서드or기타
    @GetMapping("admin")
    public String admin() {
        return "member/admin";
    }

    //회원탈퇴
    @RequestMapping(value = "/member/withdrawal",method = {RequestMethod.POST, RequestMethod.GET})
    public String Withdrawal(@RequestParam("userid") String userid,MemberVO memberVO){
        memberVO.setStatus("탈퇴");
        memberVO.setUserid(userid);
        service.Withdrawal(memberVO);
        return "redirect:/customlogout";
    }
    //회원정보수정 비밀번호 확인
    @RequestMapping(value = "/member/pwcheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
    @ResponseBody
    public String method(@RequestBody MemberVO memberVO){
        return service.checkPw(memberVO);
    }

    //아이디 찾기
    @RequestMapping(value = "/member/findIdForm", method = RequestMethod.POST, produces = "application/json; charset=utf8")
    @ResponseBody
    public MemberVO findIdForm(@RequestBody MemberVO memberVO){
        memberVO.setUserid(service.findIdForm(memberVO));
        log.info(memberVO.getUserid());
        return memberVO;
    }

    //비밀번호 찾기
    @RequestMapping(value = "/member/findPwForm", method = RequestMethod.POST, produces = "application/json; charset=utf8")
    @ResponseBody
    public MemberVO findPwForm(@RequestBody MemberVO memberVO){
        memberVO.setUserpw(service.findPwForm(memberVO));
        log.info(memberVO);
        return memberVO;
    }



    //카카오 로그인 메소드
    @RequestMapping("/member/kakaologin")
    public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
//        log.info("#########" + code);
        String access_Token = service.kakaoAccessToken(code);
        HashMap<String,Object> userInfo = service.getUserInfo(access_Token);

//        log.info("###access_Token#### : " + access_Token);
//        log.info("###userInfo#### : " + userInfo.get("email"));
//        log.info("###nickname#### : " + userInfo.get("nickname"));
//        log.info("###profile_image#### : " + userInfo.get("profile_image"));

        MemberVO memberVO = new MemberVO();

        memberVO.setUserid((String)userInfo.get("email"));
        memberVO.setReal_name((String)userInfo.get("nickname"));
        memberVO.setAuth("ROLE_PARTNERS");
        memberVO.setUserpw("1234");

        String idCheck = service.checkId(memberVO.getUserid());

        log.info("idcheck : "+idCheck);
        if (!idCheck.equals("1")){
        service.kakaoSignup(memberVO);
        }

        List<GrantedAuthority> roles = new ArrayList<>(1);
        String roleStr = "ROLE_PARTNERS";
        roles.add(new SimpleGrantedAuthority(roleStr));

        Authentication auth = new UsernamePasswordAuthenticationToken(customUserDetailsService.loadUserByUsername(memberVO.getUserid()), null, roles);

        SecurityContextHolder.getContext().setAuthentication(auth);


        return "redirect:/member/partners/profile_info";
    }






}