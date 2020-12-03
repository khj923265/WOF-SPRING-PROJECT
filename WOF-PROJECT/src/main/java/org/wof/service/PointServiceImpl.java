package org.wof.service;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;
import org.wof.mapper.PointMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Log4j
public class PointServiceImpl implements PointService {

	@Setter(onMethod_= @Autowired)
	private PointMapper pointMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	Date date = new Date();
	String currentDate = new SimpleDateFormat("yy-MM-dd").format(date);
	
	@Transactional
	@Override
	public int ChargingService(PointVO point, MemberVO member){
		
		log.info("포인트 충전" + point);
		
		//포인트 누적
		pointMapper.Charging(point);
		
		//member에서 total_point가져오기
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => "0:충전", 1:인출, 2:결제, 3:보관, 4:전송, (5:입금, 6:환불)
		point.setPoint_type(0);
		
		//point_balance
		System.out.println("service point : "+point);
		point.setPoint_balance(balance);
		
		//충전 여부 확인
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point, MemberVO member) {
		
		log.info("포인트 인출" + point);
		
		//포인트 누적
		pointMapper.Withdraw(point);
		
		//member에서 total_point가져오기
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => 0:충전, "1:인출", 2:결제, 3:보관, 4:전송, (5:입금, 6:환불)
		point.setPoint_type(1);
		
		//point_balance
		System.out.println("service point : "+point);
		point.setPoint_balance(balance);
		
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("잔고 부족 :"+(point.getPoint_amount()-member.getTotal_point())+"이 모자랍니다.");
		}*/
		
		//인출여부 확인 (인출 내역)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	@Override
	public int PaymentInService(PointVO point, ContractSourceVO contract) {
		
		log.info("포인트 결제" + point);
		
		//pointMapper.getContract(contract);

		//contract.setBusiness_register_no(contract.getBusiness_register_no());
		
		/*point.setPoint_owner(contract.getContract_write_source());	//Client(사업주)
		point.setPoint_amount(contract.getProj_estimate());
		point.setPoint_contents(contract.getProj_title());*/

		point.setPoint_owner(contract.getContract_write_source());	//Client(사업주)
		point.setPoint_amount(point.getPoint_amount());
		point.setPoint_contents(point.getPoint_contents());
		
		log.error("-------------확인------------"+point);
		//포인트 누적
		pointMapper.PaymentFrom(point);
		
		//member에서 total_point가져오기
		int balance = pointMapper.getTotalpoint(point);
		
		//point_balance
		System.out.println("member에서 total_point가져온 후 : " + point);
		point.setPoint_balance(balance);
		
		//결제 (인출 )
		pointMapper.PaymentFromList(point);
		
		
		//포인트 누적
		pointMapper.HoldFrom(point);
		
		//member에서 total_point가져오기
		int balance2 = pointMapper.getTotalpoint(point);
		
		//point_balance
		System.out.println("member에서 total_point가져온 후 : " + point);
		point.setPoint_balance(balance2);
		
		//결제 (인출 )
		pointMapper.PaymentFromList(point);
		
		//결제여부 확인 (인출 내역)
		int result = pointMapper.PaymentFrom(point);
				
		return result;
		
	}

	@Override
	public int PaymentOutService(PointVO point, MemberVO member, ContractSourceVO contract) {
		
		log.info("포인트 전송" + point);
		
		//포인트 누적
		pointMapper.PaymentTo(point);
		
		//member에서 total_point가져오기
		int balance = pointMapper.getTotalpoint(point);
		
		//point_type => 0:충전, 1:인출, 2:결제, 3:보관, "4:전송", (5:입금, 6:환불)
		point.setPoint_type(4);
		
		//point_balance
		System.out.println("member에서 total_point가져온 후 : " + point);
		point.setPoint_balance(balance);
		
		//결제여부 확인 (인출 내역)
		int paymentOutResult = pointMapper.PaymentToList(point);
		
		return paymentOutResult;
	}

	@Override
	public List<PointVO> ListService(MemberVO member, PointVO point, Standard standard) {
			
		member = pointMapper.getMember_no(member);
		
		member.getReal_name();
		
		point.setPoint_owner(member.getMember_no());
		
		return pointMapper.getList(point);
	}
	
	@Override
	public int getTotalService(Standard standard) {
		
		return pointMapper.getTotalCount(standard);
	}
	
	@Override
	public String pwCheckService(MemberVO member) {
		
		String data = "0";
		
		//Member에 mapper에서 가져온객체 가져오기
		String pw = pointMapper.pwCheck(member.getUserid());
		
		if(passwordEncoder.matches(member.getUserpw(), pw)){
			//성공 시
			data = "1";
		}
		
		return data;
	}

	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSBVLIC1XCP0K66"; //위에서 받은 api key를 추가
        String api_secret = "QQHS8GSBLPKRHPYZLHQB9HIDLCSNHEW8";  //위에서 받은 api secret를 추가
        Message coolsms = new Message(api_key, api_secret);
        
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "01074721644");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[WOF] 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 2.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

	}

	@Override
	public int totalPoinAjaxtService(MemberVO member) {
		
		return pointMapper.getTotalpointAjax(member);
	}


	
}
