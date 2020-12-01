package org.wof.mapper;

import java.util.List;

import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.Standard;

public interface PointMapper {

	public int ChargingList(PointVO point);
	
	public int Charging(PointVO point);
	
	public int WithdrawList(PointVO point);
	
	public int Withdraw(PointVO point);
	
	public int PaymentList(PointVO point);
	
	public int PaymentFrom(PointVO point);
	
	public int PaymentTo(PointVO point);
	
	//public int getPointTotal(MemberVO member);
	
	public int pointBalance(PointVO point);
	
	public List<PointVO> getList();
	
	public List<PointVO> getListPaging(Standard standard);
	
	public int getTotalCount(Standard standard);

	public String pwCheck(String pwcheck);
}
