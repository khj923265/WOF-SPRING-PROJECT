package org.wof.mapper;

import java.util.List;

import org.wof.domain.ContractSourceVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.Standard;

public interface PointMapper {

	public int getTotalpoint(PointVO point);
	
	public MemberVO getMember_no(MemberVO member);
	
	public String pwCheck(String pwcheck);
	
	
	public int ChargingList(PointVO point);
	
	public int Charging(PointVO point);
	
	
	public int WithdrawList(PointVO point);
	
	public int Withdraw(PointVO point);
	
	
	public int PaymentFromList(PointVO point);
	
	public int PaymentFrom(PointVO point);
	
	public int HoldFromList(PointVO point);
	
	public int HoldFrom(PointVO point);
	
	public int HoldToList(PointVO point);
	
	public int HoldTo(PointVO point);
	
	public int PaymentToList(PointVO point);
	
	public int PaymentTo(PointVO point);
	
	public ContractSourceVO getContract(ContractSourceVO contract);
	
	
	//public int pointBalance(PointVO point);
	
	public List<PointVO> getList(PointVO point);
	//public List<PointVO> getList(Standard standard);	
	
	public List<PointVO> getListPaging(Standard standard);
	
	public int getTotalCount(Standard standard);
}
