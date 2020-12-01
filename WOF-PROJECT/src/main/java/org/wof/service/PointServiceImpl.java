package org.wof.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
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
	
	
	@Override
	public int ChargingService(PointVO point, MemberVO member){
		
		
		log.info("포인트 충전" + point);
		
		//포인트 누적
		pointMapper.Charging(point);
		
		//point_type => "0:충전", 1:인출, 2:결제
		point.setPoint_type(0);
		
		//point_balance
		//String userId = member.getMember_no();
		
		int balance = pointMapper.pointBalance(point);
		
		point.setPoint_balance(member.getTotal_point());
		
		
		//log.info("point type:" + point.getPoint_type());
		
		//충전여부 확인 (충전 내역)
		int chargingResult = pointMapper.ChargingList(point);
		
		return chargingResult;
	}
	
	@Override
	public int WithdrawService(PointVO point, MemberVO member) {
		
		log.info("포인트 인출" + point);
		
		
		//포인트 누적
		pointMapper.Withdraw(point);
		
		//point_type => 0:충전, "1:인출", 2:결제
		point.setPoint_type(1);
		
		//point_balance
		
		/*if(member.getTotal_point() < point.getPoint_amount()){
			throw new BalanceInsufficientException("잔고 부족 :"+(point.getPoint_amount()-member.getTotal_point())+"이 모자랍니다.");
		}*/
		point.setPoint_balance(member.getTotal_point());
		
		//인출여부 확인 (인출 내역)
		int withdrawResult = pointMapper.WithdrawList(point);
		
		return withdrawResult;
	}
	
	

	@Override
	public int PaymentFromService(PointVO point, MemberVO member, ProjectVO project) {
	
		
	if(project.getProj_status() == 2){
		//포인트 결제
		pointMapper.PaymentFrom(point);
		//point_type => 0:충전, 1:인출, "2:결제", 3:입금
		point.setPoint_type(2);
	}
	
	log.info("포인트  결제" + point);
		//point_balance
		
		//point.setPoint_balance(member.getTotal_point());
		
		//결제여부 확인 (결젠 내역)
		int paymentResult = pointMapper.PaymentList(point);
		
		return paymentResult;
	}

	@Override
	public int PaymentToService(PointVO point, MemberVO member) {
		
		
		pointMapper.PaymentTo(point);
		//point_type => 0:충전, "1:인출", 2:결제, "3:입금"
		point.setPoint_type(3);
		
		//point_balance
		
		//point.setPoint_balance(member.getTotal_point());
		
		//결제여부 확인 (결젠 내역)
		int paymentResult = pointMapper.PaymentList(point);
		
		return paymentResult;
	}
	
	
	@Override
	public List<PointVO> ListService(Standard standard) {
			
		return pointMapper.getListPaging(standard);
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
