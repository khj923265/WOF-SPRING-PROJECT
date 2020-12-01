package org.wof.service;

import java.util.List;

import javax.naming.InsufficientResourcesException;

import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface PointService {
	public int ChargingService(PointVO point, MemberVO member);
	
	public int WithdrawService(PointVO point, MemberVO member);
	
	public int PaymentFromService(PointVO point, MemberVO member, ProjectVO project);

	public int PaymentToService(PointVO point, MemberVO member);
	
	//public int getPointTotalService(MemberVO member);
	
	public List<PointVO> ListService(Standard standard);
	
	public int getTotalService(Standard standard);

	public String pwCheckService(MemberVO member);
}

