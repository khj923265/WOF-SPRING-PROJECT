package org.wof.service;

import java.util.List;

import javax.naming.InsufficientResourcesException;

import org.wof.domain.MemberVO;
import org.wof.domain.PointSearch;
import org.wof.domain.PointVO;

public interface PointService {
	public int ChargingService(PointVO point);
	
	public int PaymentService(PointVO point);
	
	public int WithdrawService(PointVO point);
	
	public List<PointVO> GetService(PointSearch search);
}

