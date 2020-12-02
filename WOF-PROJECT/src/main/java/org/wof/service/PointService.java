package org.wof.service;

import java.util.List;

import javax.naming.InsufficientResourcesException;

import org.wof.domain.ContractSourceVO;
import org.wof.domain.ContractVO;
import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;
import org.wof.domain.ProjectVO;
import org.wof.domain.Standard;

public interface PointService {
	public int ChargingService(PointVO point, MemberVO member);
	
	public int WithdrawService(PointVO point, MemberVO member);
	
	public int PaymentInService(PointVO point, ContractVO contract);

	public int PaymentOutService(PointVO point, MemberVO member, ContractSourceVO contract);
	
	public List<PointVO> ListService(MemberVO member, PointVO point, Standard standard);
	
	public int getTotalService(Standard standard);

	public String pwCheckService(MemberVO member);
}

