package org.wof.mapper;

import java.util.List;

import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;

public interface PointMapper {

	public int ChargingList(PointVO point);
	
	public int Charging(MemberVO member);
	
	public int WithdrawList(PointVO point);
	
	public int Withdraw(MemberVO member);
	
	public int Payment(PointVO point);
	
	public List<PointVO> getList();
	
	public List<PointVO> getListPaging(PointSearch search);
	
}
