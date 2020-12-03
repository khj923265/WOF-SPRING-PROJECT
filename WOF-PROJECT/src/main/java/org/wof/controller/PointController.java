package org.wof.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.Coolsms;
import org.wof.domain.MemberVO;
import org.wof.domain.PageDTO;
import org.wof.domain.PointVO;
import org.wof.domain.Standard;
import org.wof.service.PointService;
import org.wof.service.PointServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/point/*")
public class PointController {
	
    private PointService service;

    
    @GetMapping("/admin")
    public String admin(Principal principal,PointVO point, MemberVO member, Model model, Standard standard){
    	
    	member.setUserid(principal.getName());
    	log.info("포인트 관리 페이지(충전/인출/조회)");
    	log.info("=============member : "+member);
    	log.info("=============point : "+point);
    	
    	//model.addAttribute("admin", service.ListService(standard));
    	
    	model.addAttribute("getList", service.ListService(member, point, standard));
    	
    	int total = service.getTotalService(standard);
    	log.info(standard);
    	log.info(total);
    	model.addAttribute("pageMaker", new PageDTO(standard, total));
    	
    	return "point/point-admin";
    }
    
    @GetMapping("/charging")
    public String getcharging(){
    	return "point/point-charging";
    }
    
    @PostMapping("/charging")
    public String charging(PointVO point, MemberVO member, RedirectAttributes rttr){
    		log.info(point);
    		if(service.ChargingService(point, member) == 1){
        		rttr.addFlashAttribute("result", "success");
        	}
    		
    	return "redirect:/point/admin";
    }
    
    @GetMapping("/withdraw")
    public String getwithdarw(){
    	return "point/point-withdraw";
    }
    
    @PostMapping("/withdraw")
    public String withdraw(PointVO point, MemberVO member, RedirectAttributes rttr){
    		
    	if(service.WithdrawService(point, member) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    	
    		return "redirect:/point/admin";
    }
    
    @RequestMapping(value="/point/pwCheck", method=RequestMethod.GET)
    @ResponseBody
    public String pwCheck(@RequestParam("userpw") String userpw ,MemberVO member, Principal principal){
    	
    	log.info("======== principal.getName() : ========" + principal.getName());
    	member.setUserid(principal.getName());
    	member.setUserpw(userpw);
    	
    	return service.pwCheckService(member);
    }
    
    @GetMapping("/pointTest")
    public String pointTest(){
    	return "point/point-test";
    }
    
    @PostMapping("/paymentIn")
    public String paymentIn(ContractSourceVO contract, PointVO point, Model model){
    		log.info("paymentIn 1st" + contract);
    		log.info("------------"+point);
    		
    		model.addAttribute("paymentIn", service.PaymentInService(point, contract));
    		
    		return "point/point-admin";
    }
    
    @PostMapping("/paymentOut")
    public String paymentOut(PointVO point, MemberVO member, ContractSourceVO contract, RedirectAttributes rttr){
    		
    	if(service.PaymentOutService(point, member, contract) == 1){
    		rttr.addFlashAttribute("result", "success");
    	}
    		return "point/point-admin";
    }
    
    @GetMapping("/check/sendSMS")
    public @ResponseBody
    String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        service.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
    
    
  //문자를 보낼때 맵핑되는 메소드
    /*@RequestMapping(value = "/sendSms.do")
      public void sendSms(HttpServletRequest request) throws Exception {

        String api_key = "NCSBVLIC1XCP0K66"; //위에서 받은 api key를 추가
        String api_secret = "QQHS8GSBLPKRHPYZLHQB9HIDLCSNHEW8";  //위에서 받은 api secret를 추가
        
        Coolsms coolsms = new Coolsms(api_key, api_secret);
        
        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", "01074721644"); // 수신번호

        set.put("from", (String)request.getParameter("from")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
        set.put("text", (String)request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
        set.put("type", "sms"); // 문자 타입

        System.out.println(set);

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

        if ((boolean)result.get("status") == true) {

          // 메시지 보내기 성공 및 전송결과 출력
          System.out.println("성공");
          System.out.println(result.get("group_id")); // 그룹아이디
          System.out.println(result.get("result_code")); // 결과코드
          System.out.println(result.get("result_message")); // 결과 메시지
          System.out.println(result.get("success_count")); // 메시지아이디
          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
        } else {

          // 메시지 보내기 실패
          System.out.println("실패");
          System.out.println(result.get("code")); // REST API 에러코드
          System.out.println(result.get("message")); // 에러메시지
        }

        //return "member/number"; //문자 메시지 발송 성공했을때 number페이지로 이동함
      }*/
    
}
