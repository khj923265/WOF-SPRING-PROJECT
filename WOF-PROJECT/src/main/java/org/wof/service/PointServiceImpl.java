package org.wof.service;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
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
	public int PaymentInService(PointVO point, ContractVO contract) {
		
		log.info("포인트 결제" + point);
		
		//pointMapper.getContract(contract);

		//contract.setBusiness_register_no(contract.getBusiness_register_no());
		
		point.setPoint_owner(contract.getClient());
		point.setPoint_amount(contract.getProj_estimate());
		point.setPoint_contents(contract.getProj_title());
		point.setPoint_chg_date(contract.getProj_start_date());
		
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

}
