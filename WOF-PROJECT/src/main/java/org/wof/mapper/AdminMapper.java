package org.wof.mapper;

import java.util.List;

import org.wof.domain.ClientVO;
import org.wof.domain.NoticeVO;
import org.wof.domain.PartnersBoardVO;
import org.wof.domain.Standard;

public interface AdminMapper {

	public int getTotalCount2();
	
	public int TotalMember();
	
	public int RegisterCompany();
	
	public List<ClientVO> CompanyList(Standard standard);
	public int CompanyListTotal(Standard standard);
	
	public List<NoticeVO> noticeList();

	public List<NoticeVO> getListWithPaging(Standard standard);
	
	public void insert(NoticeVO noticeVO);
	
	public void insertSelectKey(NoticeVO noticeVO);
	
	public NoticeVO read(int nno);
	
	public int delete(int nno);
	
	public int getTotalCount(Standard standard);
	public int update(NoticeVO noticeVO);
}
