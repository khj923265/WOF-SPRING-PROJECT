package org.wof.service;

import java.util.List;

import org.wof.domain.ClientVO;
import org.wof.domain.NoticeVO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;

public interface AdminService {

	public int getTotal2();

	public int TotalMember();
	
	public int RegisterCompany();
	
	public List<ClientVO> CompanyList(Standard standard);
	public int CompanyListTotal(Standard standard);
	
	public List<NoticeVO> noticeList(Standard standard);
	
	public int getTotal(Standard standard);
	
	public void register(NoticeVO noticeVO);
	
	public NoticeVO get(int nno);
	
	public boolean remove(int nno);
	
	public boolean modify(NoticeVO noticeVO);
}
